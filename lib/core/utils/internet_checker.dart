import 'package:connectivity_plus/connectivity_plus.dart';

class InternetChecker {
  static Future<bool> checkConnection() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }
}
