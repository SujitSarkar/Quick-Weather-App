import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class CennectivityService {
  CennectivityService._privateConstructor();
  static final CennectivityService instance =
      CennectivityService._privateConstructor();

  factory CennectivityService() => instance;

  Future<bool> isOnline() async {
    final connectivityResult = await Connectivity().checkConnectivity();
    debugPrint('$connectivityResult');
    if (connectivityResult.contains(ConnectivityResult.mobile)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.wifi)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.ethernet)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.vpn)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.other)) {
      return true;
    } else if (connectivityResult.contains(ConnectivityResult.none)) {
      return false;
    } else {
      return false;
    }
  }
}
