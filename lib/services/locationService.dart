import 'dart:io';
import 'dart:math';
import 'dart:convert';
import 'package:flutter_app/models/BeerModel.dart';
import 'package:flutter_app/models/locationModel.dart';
import 'package:flutter_app/services/network_service_response.dart';
import 'package:flutter_app/services/rest_client.dart';
import 'package:http/http.dart' as http;



  class CitiesService {
   //List<LocationModel> cities =  <LocationModel>[];
    List<LocationModel> _cities = List();
    CitiesService()
    {
      _cities.add(new LocationModel(title: "Repalle",description: "Repalle",id: 1,imageURL: "",type: ""));
      _cities.add(new LocationModel(title: "Vishakapatnam",description: "",id: 1,imageURL: "",type: ""));
      _cities.add(new LocationModel(title: "karnal",description: "",id: 1,imageURL: "",type: ""));
    }
   //LocationModel value = LocationModel({"","","","",0});
  //   [
  //   'Beirut',
  //   'Damascus',
  //   'San Fransisco',
  //   'Rome',
  //   'Los Angeles',
  //   'Madrid',
  //   'Bali',
  //   'Barcelona',
  //   'Paris',
  //   'Bucharest',
  //   'New York City',
  //   'Philadelphia',
  //   'Sydney',
  // ];

  List<LocationModel> getSuggestions(String query) {

    _cities.retainWhere((s) => s.title.toLowerCase().contains(query.toLowerCase()));
    return _cities;
  }
LocationModel addCity(LocationModel cityName){

  _cities.add(cityName);
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