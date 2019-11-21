import 'package:flutter/cupertino.dart';
import 'package:flutter_app/models/country.dart';
class CountryState {
  final List<CountryResponse> country;
  final bool loading;
  final Map error;
  CountryState({
    @required this.loading,
    @required this.error,
    this.country,
  });
  factory CountryState.initial() {
    return CountryState(
      loading: false,
      error: null,
      country: const [],
    );
  }
  CountryState copyWith({
    bool loading,
    bool loaded,
    Map error,
    List<CountryResponse> country
  }) {
    return CountryState(
      loading: loading ?? this.loading,
      error: error ?? this.error,
      country: country ?? this.country,
    );
  }
}