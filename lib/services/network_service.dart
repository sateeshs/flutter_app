import 'dart:async';
import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter_app/common/network_type.dart';
import 'package:flutter_app/models/country.dart';
import 'package:flutter_app/models/login.dart';
import 'package:flutter_app/services/api_service.dart';

import 'package:flutter_app/services/restClient.dart';

import 'network_service_response.dart';


class NetworkService extends NetworkType implements APIService {
  static final _baseURL = 'https://restcountries.eu/rest/v2/';
  static final _loginUrl = '';
  final _countryUrl = _baseURL  + 'all';


  Map<String, String> headers = {
    "Content-Type": "application/x-www-form-urlencoded"
  };

  NetworkService(RestClient rest) : super(rest);

  @override
  Future<NetworkServiceResponse<LoginResponse>> login(String phoneNumber,
      String password) async {
    var result = await rest.get<LoginResponse>(
        '$_loginUrl?MobileNo=$phoneNumber&Password=$password&EmailId=""');
    if (result.mappedResult != null) {
      var res = LoginResponse.fromJson(json.decode(result.mappedResult));
      return new NetworkServiceResponse(
          response: res,
          responseCode: result.networkServiceResponse.responseCode);
    }
    return new NetworkServiceResponse(
        responseCode: result.networkServiceResponse.responseCode);
  }

  @override
  Future<NetworkServiceResponse<List<CountryResponse>>> country() async{
    var result = await rest.get<CountryResponse>('$_countryUrl');
    if (result.networkServiceResponse.responseCode == 200) {
      List<CountryResponse> list = (json.decode(result.mappedResult) as List)
          .map((data) => new CountryResponse.fromJson(data))
          .toList();
      return new NetworkServiceResponse(
          response: list,
          responseCode: result.networkServiceResponse.responseCode
      );
    }
    return new NetworkServiceResponse(
        responseCode: result.networkServiceResponse.responseCode);
  }
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