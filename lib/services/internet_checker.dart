import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecker {

static Future<bool>  hasInternet() async {
    final result = await Connectivity().checkConnectivity();
    switch (result) {
      case ConnectivityResult.mobile:
      case ConnectivityResult.wifi:
        return true;
      case ConnectivityResult.none:
       

      default:
        return false;
    }
  }
}


