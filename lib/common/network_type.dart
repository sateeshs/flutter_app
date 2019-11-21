
import 'package:flutter_app/services/restClient.dart';

abstract class NetworkType {
  RestClient rest;
  NetworkType(this.rest);
}