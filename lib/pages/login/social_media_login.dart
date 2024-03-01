import 'package:easacc_web_view/services/auth/auth_firebase.dart';
import 'package:easacc_web_view/services/auth/auth_provider.dart';
import 'package:easacc_web_view/core/utility/extentions.dart';
import 'package:flutter/material.dart';

class SocialMediaLogin extends StatefulWidget {
  const SocialMediaLogin({super.key});

  @override
  State<SocialMediaLogin> createState() => _SocialMediaLoginState();
}

class _SocialMediaLoginState extends State<SocialMediaLogin> {
  final login = AppAuthProvider(auth: AuthFirebase());
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Social Media Login'),
        centerTitle: true,
      ),
      body: Center(
        child: isLoading
            ? const CircularProgressIndicator()
            : Padding(
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
                          onPressed: () async => _facebookSignIn()),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton.icon(
                          icon: const Icon(
                            Icons.g_mobiledata,
                            color: Colors.green,
                          ),
                          label: const Text('Google'),
                          onPressed: () async => _googleSignIn()),
                    ),

                    // Add Google login button
                  ],
                ),
              ),
      ),
    );
  }

  Future _facebookSignIn() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    final result = await login.signInWithFacebook();
    result.matching((left) {
      setState(() {
        isLoading = false;
      });
      return context.snackBar(left);
    }, (right) => null);
  }

  Future _googleSignIn() async {
    if (isLoading) return;
    setState(() {
      isLoading = true;
    });
    final result = await login.signInWithGoogle();
    result.matching((left) {
      setState(() {
        isLoading = false;
      });
      return context.snackBar(left);
    }, (right) => null);
  }
}
