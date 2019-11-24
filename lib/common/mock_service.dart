import 'dart:async';
import 'package:flutter_app/models/country.dart';
import 'package:flutter_app/models/login.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:flutter_app/services/network_service_response.dart';

import 'constants.dart';

class MockService implements APIService {
  @override
  Future<NetworkServiceResponse<LoginResponse>> login(
      String phoneNumber, String password) async {
    await Future.delayed(Duration(seconds: 2));
    return Future.value(NetworkServiceResponse(
        responseCode: ok200,
        response: LoginResponse(
        )));
  }
  @override
  Future<NetworkServiceResponse<List<CountryResponse>>> country() {
    return null;
  }

  @override
  Future<bool> isConnected() {
    // TODO: implement isConnected
    return null;
  }
}
