
import 'package:flutter_app/services/rest_client.dart';

abstract class NetworkType {
  RestClient rest;
  NetworkType(this.rest);
}