import 'package:easacc_web_view/services/auth/auth.dart';
import 'package:easacc_web_view/utility/extentions.dart';
import 'package:flutter/material.dart';

class SocialMediaLogin extends StatelessWidget {
  SocialMediaLogin({super.key});
  final login = Auth();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media Login'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.facebook_outlined,
                      color: Colors.blue,
                    ),
                    label: const Text('FaceBook'),
                    onPressed: () async {
                    final result=  await login.signInWithFacebook();
                     result.matching((left) => context.snackBar(left), (right) => null);
                    }),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                width: double.infinity,
                height: 48,
                child: ElevatedButton.icon(
                    icon: const Icon(
                      Icons.facebook_outlined,
                      color: Colors.green,
                    ),
                    label: const Text('Google'),
                    onPressed: () async {
                 final result=     await login.signInWithGoogle();
                 result.matching((left) => context.snackBar(left), (right) => null);
                    }),
              ),

              // Add Google login button
            ],
          ),
        ),
      ),
    );
  }
}
