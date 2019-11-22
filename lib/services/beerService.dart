//https://medium.com/flutter-community/flutter-design-patterns-3-template-method-89799d84e378
import 'dart:convert';
// get reponse from API
import 'package:flutter_app/common/network_type.dart';
import 'package:flutter_app/models/beerListModel.dart';
import 'package:flutter_app/models/country.dart';
import 'package:flutter_app/services/restClient.dart';
import 'package:http/http.dart' as http;
// to check internet connection
import 'package:connectivity/connectivity.dart';

import 'api_service.dart';
import 'network_service_response.dart';

class BeerService extends NetworkType implements APIService {

    BeerService(RestClient rest) : super(rest);
// API url
  String url = "https://api.punkapi.com/v2/beers/random";
  final String _countryUrl = "https://api.punkapi.com/v2/beers";

  Future<BeerListModel> get() async {
    final response = await http.get(
      url,
    );
    //json.decode used to decode response.body(string to map)
    return BeerListModel.fromJson(json.decode(response.body));
  }

  // method defined to check internet connectivity
  Future<bool> isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      return true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      return true;
    }
    return false;
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
}
