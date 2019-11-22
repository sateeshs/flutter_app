import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_app/models/country.dart';
import 'package:flutter_app/services/network_service_response.dart';

abstract class APIService {
  Future<NetworkServiceResponse<List<CountryResponse>>> country();

  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}