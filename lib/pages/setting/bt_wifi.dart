
import 'package:app_settings/app_settings.dart';
import 'package:flutter/material.dart';

class BtWifiNetwork extends StatelessWidget {
  const BtWifiNetwork({super.key});

  @override
  Widget build(BuildContext context) {

    return 
      
    SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           Text('Network',style: Theme.of(context).textTheme.labelLarge,),
          const SizedBox(height: 5),
          Container(color: Colors.grey[350],
            child: DropdownButtonFormField(
              value: 'Wifi',
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.menu),
              ),
              items: [
                'Wifi',
                'Bluetooth',
              ]
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (value) async {
                if (value == 'Wifi') {
                  await AppSettings.openAppSettings(
                      type: AppSettingsType.wifi);
                } else if (value == 'Bluetooth') {
                  await AppSettings.openAppSettings(
                      type: AppSettingsType.bluetooth);
                }
              },
            ),
          ),
          const SizedBox(height: 2),
          const Text(
            'select to access your device network',
            style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 70),
          const Text(
            'Web page ',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
          ),
          const SizedBox(height: 10),
         
          const SizedBox(height: 30),
         
        ],
      ),
    );
  }
}
