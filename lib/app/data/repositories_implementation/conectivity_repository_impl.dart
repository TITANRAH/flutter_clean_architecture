import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';

import '../../domain/repositories/conectivity_repository.dart';

class ConectivityRepositoryImpl implements ConectivityRepository {
  final Connectivity _connectivity;

  ConectivityRepositoryImpl(this._connectivity);

  @override
  Future<bool> get hasInternet async {
    final result = await _connectivity.checkConnectivity();

    if (result == ConnectivityResult.none) {
      return false;
    }

    // retorna true o false
    return _hasInternet();
  }

  Future<bool> _hasInternet() async {
    try {
      final list = await InternetAddress.lookup('google.com');
      print('entro a try de hasinternet $list');
      return list.isNotEmpty && list.first.rawAddress.isNotEmpty;
    } catch (e) {
      return false;
    }

    // no es compatible para web InternetAddress
  }
}
