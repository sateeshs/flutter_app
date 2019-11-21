import 'dart:async';

import 'package:flutter_app/models/country.dart';
import 'package:flutter_app/services/network_service_response.dart';

abstract class APIService {
  Future<NetworkServiceResponse<List<CountryResponse>>> country();
}