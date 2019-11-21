import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_app/models/country.dart';
import 'package:flutter_app/services/api_provider.dart';
import 'country_event.dart';
import 'country_state.dart';

class CountryBloc extends Bloc<CountryEvent, CountryState> {
  final ApiProvider apiProvider = ApiProvider();
  void callCountry() {
    dispatch(GetCountry());
  }
  @override
  CountryState get initialState => CountryState.initial();
  @override
  Stream<CountryState> mapEventToState(CountryEvent event) async* {
    if (event is GetCountry) {
      yield currentState.copyWith(loading: true);
      try {
        await apiProvider.getCountry();
        List<CountryResponse> brandList;
        if (apiProvider.apiResult != null) {
          brandList = apiProvider.apiResult.response;
          if (brandList.isNotEmpty) {
            yield currentState.copyWith(
              loading: false,
              country: brandList
            );
          } else {
            yield currentState.copyWith(
              error: {"error": 'Data not found'},
              loaded: false,
              loading: false,
            );
          }
        }
      } catch (e) {
        yield currentState.copyWith(
          error: {"error": "Error, Something bad happened."},
          loaded: false,
          loading: false,
        );
      }
    }
  }
}