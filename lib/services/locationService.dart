import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:flutter_app/models/BeerModel.dart';
import 'package:flutter_app/models/locationModel.dart';
import 'package:flutter_app/services/network_service_response.dart';
import 'package:flutter_app/services/restClient.dart';
import 'package:http/http.dart' as http;



  class CitiesService {
  static final List<String> cities = [
    'Beirut',
    'Damascus',
    'San Fransisco',
    'Rome',
    'Los Angeles',
    'Madrid',
    'Bali',
    'Barcelona',
    'Paris',
    'Bucharest',
    'New York City',
    'Philadelphia',
    'Sydney',
  ];

  List<String> getSuggestions(String query) {
    List<String> matches = List();
    matches.addAll(cities);

    matches.retainWhere((s) => s.toLowerCase().contains(query.toLowerCase()));
    return matches;
  }
LocationModel addCity(LocationModel cityName){

  cities.add(cityName.description);
  return cityName;
}

void removeCity(int cityId){

  //cities.remove(cityName.description);
}
LocationModel editCity(LocationModel locationModel){
  return locationModel;
}

  /*{
                                                  response
                                                        .transform(utf8.decoder)
                                                        .transform(json.decoder)
                                                        .expand((data) => (data as List))
                                                        .map((data) => BeerModel.fromJson(data));}); */
Exception  onError(String error){
          print(error);
        throw new Exception(error);
  }
}

class BackendService {
  static Future<List> getSuggestions(String query) async {
    await Future.delayed(Duration(seconds: 1));

    return List.generate(3, (index) {
      return {'name': query + index.toString(), 'price': Random().nextInt(100)};
    });
  }
}