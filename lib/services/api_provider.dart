import 'dart:async';
import 'package:flutter_app/common/dependency_injection.dart';
import 'package:flutter_app/models/country.dart';

import 'package:flutter_app/services/network_service_response.dart';

import 'api_service.dart';

class ApiProvider {
  NetworkServiceResponse apiResult;
  APIService apiService = new Injector().flavor;

  Future<Null> getCountry() async {
    NetworkServiceResponse<List<CountryResponse>> result =
    await apiService.country();
    this.apiResult = result;
  }

}