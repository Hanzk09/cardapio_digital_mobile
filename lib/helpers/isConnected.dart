import 'package:connectivity_plus/connectivity_plus.dart';

Future<bool> isConnected() async {
  final List<ConnectivityResult> connectivityResult =
      await (Connectivity().checkConnectivity());
  if (connectivityResult.contains(ConnectivityResult.wifi) ||
      connectivityResult.contains(ConnectivityResult.mobile)) {
    return true;
  }
  return false;
}
