import 'dart:io';

import 'package:easacc_web_view/services/auth/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthFirebase extends Auth{
 
  @override
  Future<UserCredential> signInWithFacebook() async{
  try {
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        return await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      } else {
        throw Exception('Error to Sign with Facebook');
      }
    } catch (e) {
      throw Exception('Error to Sign with Facebook');
    }
  }
  

  @override
  Future<UserCredential> signInWithGoogle()async {
     try {
      GoogleSignInAccount? googleUser;
      if (Platform.isIOS) {
        googleUser = await GoogleSignIn(
                clientId:
                    '860422104667-eu6ime1jrs9ldeh09ro0mmvjmakq1v91.apps.googleusercontent.com')
            .signIn();
      } else {
        googleUser = await GoogleSignIn().signIn();
      }

      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      return await FirebaseAuth.instance.signInWithCredential(credential);
    } catch (e) {
      throw Exception('Error To login With Facebook');
    }
  }
   @override
  Future<void> logout()async {
 await FirebaseAuth.instance.signOut();
await FirebaseAuth.instance.currentUser?.reload();
  }

}