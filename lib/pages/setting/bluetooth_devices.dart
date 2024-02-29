import 'dart:io';

import 'package:easacc_web_view/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
class BlueToothWidget extends StatelessWidget {
  const BlueToothWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(stream: FlutterBluePlus.adapterState, builder: (_,adapter){
      if(adapter.hasData) {
        switch (adapter.data) {
        case BluetoothAdapterState.on:
        return const _BluetoothDevicesMenu();
        case BluetoothAdapterState.off:
        return Row(
          children: [
            const Expanded(child: Text('Bluetooth Off')),
            if(Platform.isAndroid)
            Expanded(
              child: CustomButton(child: const Text('Turn on Bluetooth'), onPressed: ()async=>
                  await FlutterBluePlus.turnOn()
              ),
            )
          ],
        );
          
         
        default:return const Text('unKnown Blutooth');
      }
      }
      return const Text('unKnown Blutooth');
    });
  }
}
class _BluetoothDevicesMenu extends StatefulWidget {
  const _BluetoothDevicesMenu();

  @override
   createState() => _BluetoothDevicesMenuState();
}

class _BluetoothDevicesMenuState extends State<_BluetoothDevicesMenu> {
  String? selectedDevice;

  @override
  void initState() {
    super.initState();

 _scanDevices();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Padding(
      padding: const EdgeInsets.all(5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Bluetooth NetWork',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Text(
                 FlutterBluePlus.adapterStateNow.name,
                style: Theme.of(context).textTheme.labelLarge,
              ),
            ],
          ),
          const SizedBox(height: 10),
          StreamBuilder(
            stream: FlutterBluePlus.onScanResults,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              }
              if (snapshot.hasError) return const Icon(Icons.error);
              if (snapshot.hasData) {
                final devices = snapshot.data;

                return DropdownButtonFormField<String>(
                  value: selectedDevice,
                  items: devices
                      ?.map(
                        (device) => DropdownMenuItem<String>(
                          value: device.device.remoteId.str??'',
                          child: SizedBox(
                            width: size.width * .69,
                            child: Text(
                              (device.device.advName.isEmpty
                                  ? device.device.remoteId.str
                                  : device.device.advName)??'',
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedDevice = value ??= 'hidden';
                   
                    });
                  },
                  decoration: const InputDecoration(
                    labelText: 'Bluetooth Device',
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
  
  void _scanDevices()async {
    

    if (!FlutterBluePlus.isScanningNow) {
     FlutterBluePlus.startScan();
    }
 
  }
}
