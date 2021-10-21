import 'package:connectivity/connectivity.dart';

class NetworkConnection {
  static Future<bool> get isConnect async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return false;
    } else {
      return true;
    }
  }
}