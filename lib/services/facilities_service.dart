import 'package:flutter_app/common/network_type.dart';
import 'package:flutter_app/models/FacilityModel.dart';
import 'package:flutter_app/models/country.dart';
import 'package:flutter_app/services/network_service_response.dart';
import 'package:flutter_app/services/rest_client.dart';

import 'api_service.dart';

class FacilitiesService  extends NetworkType implements APIService {
  final _baseURL = 'https://restcountries.eu/rest/v2/';

  Map<String, String> headers = {
    "Content-Type": "application/x-www-form-urlencoded"
  };

  FacilitiesService(RestClient rest) : super(rest);

  @override
  Future<NetworkServiceResponse<List<CountryResponse>>> country() {
    // TODO: implement country
    return null;
  }

  @override
  Future<bool> isConnected() {
    // TODO: implement isConnected
    return null;
  }

  Future<List<FacilityModel>> get(String filter) async{

    List<FacilityModel> facilities = List();
    facilities.add(new FacilityModel(id:1,title: "Pick/Drop",description: "Pick/Drop"));
    return facilities;
  }

  Future<FacilityModel> add(FacilityModel filter) async{
    return null;
  }
  Future<FacilityModel> edit(FacilityModel filter) async{
    return null;
  }
  Future<FacilityModel> remove(int Id) async{
    return null;
  }
}
