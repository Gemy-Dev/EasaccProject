import 'package:easacc_web_view/services/auth/auth_firebase.dart';
import 'package:easacc_web_view/services/internet_checker.dart';

import '../../helper/either.dart';

class AppAuthProvider {
  final AuthFirebase auth;

  AppAuthProvider({required this.auth});

  Future<Either<String, bool>> logout() async {
    if (!(await InternetChecker.hasInternet())) {
      return Either.left('No Internet');
    }
    try {
      await auth.logout();

      return Either.right(true);
    } catch (e) {
      return Either.left(e.toString());
    }
  }

  Future<Either<String, bool>> signInWithFacebook() async {
    if (!(await InternetChecker.hasInternet())) {
      return Either.left('No Internet');
    }

    try {
      await auth.signInWithFacebook();
      return Either.right(true);
    } catch (e) {
      return Either.left(e.toString());
    }
  }

  Future<Either<String, bool>> signInWithGoogle() async {
    if (!(await InternetChecker.hasInternet())) {
      return Either.left('No Internet');
    }

    try {
      await auth.signInWithGoogle();
      return Either.right(true);
    } catch (e) {
      return Either.left(e.toString());
    }
  }
}
