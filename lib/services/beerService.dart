import 'dart:convert';
// get reponse from API
import 'package:flutter_app/models/beerListModel.dart';
import 'package:http/http.dart' as http;
// to check internet connection
import 'package:connectivity/connectivity.dart';

class BeerService {
// API url
  String url = "https://api.punkapi.com/v2/beers";
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
}
