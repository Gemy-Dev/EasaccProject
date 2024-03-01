import 'package:easacc_web_view/pages/setting/bt_wifi.dart';
import 'package:easacc_web_view/pages/view/web_veiw.dart';
import 'package:easacc_web_view/services/auth/auth_firebase.dart';
import 'package:easacc_web_view/services/auth/auth_provider.dart';
import 'package:easacc_web_view/core/utility/extentions.dart';
import 'package:easacc_web_view/widgets/custom_button.dart';
import 'package:flutter/material.dart';

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
              onPressed: () async =>
                  await AppAuthProvider(auth: AuthFirebase()).logout(),
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
        child: ListView(
          children: [
            Form(
              key: _formKey,
              child: TextFormField(
                controller: urlController,
                validator: _validateCheck,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: 'Enter Url'),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(height: 150, child: BtWifiNetwork()),
            const SizedBox(height: 20),

            CustomButton(
                text: 'Go',
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    context.push(WebVeiwPage(url: urlController.text));
                  }
                }),
           
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

  String? _validateCheck(String? url) {
  String pattern = r'(http|https)://[\w-]+(\.[\w-]+)+([\w.,@?^=%&amp;:/~+#-]*[\w@?^=%&amp;/~+#-])?';
   RegExp regExp = RegExp(pattern);
 
    if (!regExp.hasMatch(url??'')) {
     return 'Please enter valid url';
   }
   return null;
  
  }
}
