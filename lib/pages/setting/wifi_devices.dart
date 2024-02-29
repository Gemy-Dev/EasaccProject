import 'dart:developer';
import 'package:easacc_web_view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'package:wifi_scan/wifi_scan.dart';

class WifiWidget extends StatefulWidget {
  const WifiWidget({super.key});

  @override
  State<WifiWidget> createState() => _WifiWidgetState();
}

class _WifiWidgetState extends State<WifiWidget> {
  final wifi = WiFiScan.instance;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: wifi.canStartScan(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            log(snapshot.data.toString());
            switch (snapshot.data) {
              case CanStartScan.yes:
                return _WiFiDevicesMenu(
                  wifi: wifi,
                );

              case CanStartScan.noLocationPermissionDenied:
              default:
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text('open Location '),
                    SizedBox(
                        width: 150,
                        child: CustomButton(
                            child: const Text('Refresh'),
                            onPressed: () {
                              setState(() {});
                            }))
                  ],
                );
            }
          }
          return _WiFiDevicesMenu(
            wifi: wifi,
          );
        });
  }
}

class _WiFiDevicesMenu extends StatefulWidget {
  const _WiFiDevicesMenu({ required this.wifi});
  final WiFiScan wifi;
  @override
  // ignore: no_logic_in_create_state
  createState() => _WiFiDevicesMenuState(wifi: wifi);
}

class _WiFiDevicesMenuState extends State<_WiFiDevicesMenu> {
  String? selectedDevice;
  final WiFiScan wifi;

  _WiFiDevicesMenuState({required this.wifi});
  void _startScan() async {
    final can = await wifi.canStartScan(askPermissions: true);

    if (can == CanStartScan.yes) {
      wifi.startScan();
    }
  }

  @override
  void initState() {
    _startScan();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Wifi NetWork',
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: wifi.onScannedResultsAvailable,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('loading');
              }
              if (snapshot.hasError) return const Icon(Icons.error);
              if (snapshot.hasData) {
                final devices = snapshot.data;

                return DropdownButtonFormField<String>(
                  items: devices
                      ?.map(
                        (device) => DropdownMenuItem<String>(
                          value: device.ssid ?? '',
                          child: SizedBox(
                              width: size.width * .69,
                              child: Text((device.ssid.isEmpty
                                      ? device.bssid
                                      : device.ssid) ??
                                  '')),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDevice = value ??= 'hidden';
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Wifi Device',
                    border: OutlineInputBorder(),
                  ),
                );
              } else {
                return const Text('No Devices Yet');
              }
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
