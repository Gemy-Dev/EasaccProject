import 'dart:developer';
import 'dart:ffi';
import 'dart:io';

import 'package:easacc_web_view/helper/either.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Auth {
  bool startLog = false;

// sign in with google
 Future<Either<String,bool>> signInWithGoogle() async {
  if (startLog) return Either.left('Please wait');
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

      // Obtain the auth details from the request
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      startLog = false;
        return Either.right(true);
    } catch (e) {
      startLog = false;
      return Either.left(e.toString());
    }
  }

  Future<Either<String,bool>> signInWithFacebook() async {
    if (startLog) return Either.left('Please wait');
    startLog = true;
    try {
      await FirebaseAuth.instance.currentUser?.reload();
      final LoginResult loginResult = await FacebookAuth.instance.login();

      if (loginResult.accessToken != null) {
        final OAuthCredential facebookAuthCredential =
            FacebookAuthProvider.credential(loginResult.accessToken!.token);
        await FirebaseAuth.instance
            .signInWithCredential(facebookAuthCredential);
      }
      startLog = false;
      return Either.right(true);
    } catch (e) {
      startLog = false;
       return Either.left(e.toString());
    }
  }

  Future<void> logout() async {
    await FirebaseAuth.instance.signOut();
  }
}
