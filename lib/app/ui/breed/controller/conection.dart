import 'dart:async';
import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';

class ConnectionController extends ChangeNotifier {
  final Connectivity _connectivity = Connectivity();

  late StreamSubscription _connectionSubscription;

  bool _isOnline = true;
  bool get isOnline => _isOnline;

  ConnectionController() {
    _connectionSubscription = _connectivity.onConnectivityChanged
        .listen((_) => _checkInternetConnection());
    _checkInternetConnection();
  }

  Future<void> _checkInternetConnection() async {
    try {
      await Future.delayed(const Duration(seconds: 3));
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        _isOnline = true;
      } else {
        _isOnline = false;
      }
    } on SocketException catch (_) {
      //print('not connected');
      _isOnline = false;
    }
    notifyListeners();
  }

  @override
  void dispose() {
    _connectionSubscription.cancel();
    super.dispose();
  }
}
