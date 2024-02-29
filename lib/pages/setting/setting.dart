
import 'package:easacc_web_view/services/auth/auth.dart';
import 'package:easacc_web_view/pages/view/web_veiw.dart';
import 'package:easacc_web_view/pages/setting/wifi_devices.dart';
import 'package:easacc_web_view/utility/extentions.dart';
import 'package:easacc_web_view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

import 'bluetooth_devices.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    urlController = TextEditingController();
    super.initState();
  }

  late TextEditingController urlController;
  final _formKey = GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting Screen'),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () async => await Auth().logout(),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: urlController,
                validator:  _validateCheck,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Url'),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 20),
            CustomButton(
                child: const Text('Go'),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.push(WebVeiwPage(url: urlController.text));
                  }
                }),
            const SizedBox(height: 20),
            const SizedBox(height: 150, child: BlueToothWidget()),
             const SizedBox(height: 150, child: WifiWidget()),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    urlController.dispose();
    super.dispose();
  }
  String? _validateCheck(String? url){
return  Uri.parse(url ?? '').isAbsolute
                    ? null
                    : "Please Enter A valid Url";}
}
