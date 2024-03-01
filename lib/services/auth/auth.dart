

import 'package:firebase_auth/firebase_auth.dart';


abstract class Auth {
  Future<UserCredential> signInWithFacebook();
  Future<UserCredential> signInWithGoogle();
  Future<void> logout();
}

 
