import 'dart:io';
import 'dart:developer';
import 'package:projeto_atividade/util/constants.dart';
import 'package:connectivity_plus/connectivity_plus.dart';


class ConnectionHelper {
  static Future<bool> isConnected() async {
    try {
      final result = await Connectivity().checkConnectivity();

      switch (result.firstOrNull) {
        case ConnectivityResult.bluetooth:
          return _isNetworkWorking();
        case ConnectivityResult.wifi:
          return _isNetworkWorking();
        case ConnectivityResult.ethernet:
          return _isNetworkWorking();
        case ConnectivityResult.mobile:
          return _isNetworkWorking();
        case ConnectivityResult.none:
          return false;
        case ConnectivityResult.other:
          return _isNetworkWorking();
        default:
          return false;
      }
    } catch (e) {
      log(e.toString());
    }

    return false;
  }

  static Future<bool> _isNetworkWorking() async {
    final lookup = await InternetAddress.lookup(
      Constants.getApiLookup(),
    ).timeout(
      const Duration(seconds: 10),
    );

    return lookup.isNotEmpty && lookup[0].rawAddress.isNotEmpty;
  }
}
