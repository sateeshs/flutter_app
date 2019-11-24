import 'package:flutter_app/common/network_type.dart';
import 'package:flutter_app/models/country.dart';
import 'package:flutter_app/models/userModel.dart';
import 'package:flutter_app/services/api_service.dart';
import 'package:flutter_app/services/network_service_response.dart';
import 'package:flutter_app/services/restClient.dart';

class UserService extends NetworkType implements APIService {
  final _baseURL = 'https://restcountries.eu/rest/v2/';

  Map<String, String> headers = {
    "Content-Type": "application/x-www-form-urlencoded"
  };

  UserService(RestClient rest) : super(rest);

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

  Future<UserModel> addUser(UserModel user) async {
    return user;
  }
  Future<UserModel> editUser(UserModel user) async {
    return user;
  }
}
