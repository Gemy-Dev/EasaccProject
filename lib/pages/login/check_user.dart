import 'package:easacc_web_view/pages/setting/setting.dart';
import 'package:easacc_web_view/pages/login/social_media_login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class CheckLoginState extends StatefulWidget {
  const CheckLoginState({super.key});

  @override
  State<CheckLoginState> createState() => _CheckLoginStateState();
}

class _CheckLoginStateState extends State<CheckLoginState> {
  @override
  void initState() {
   super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
         
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasData) {
            if (snapshot.data != null) {
              return const SettingPage();
            } else {
              return const SocialMediaLogin();
            }
          }
          return const SocialMediaLogin();
        });
  }
}
