import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/locationModel.dart';
import 'package:meta/meta.dart';


@immutable
abstract class LocationsSearchState extends Equatable {
  LocationsSearchState([List props = const []]) : super(props);
}

class SearchStateEmpty extends LocationsSearchState {
  @override
  String toString() => 'SearchStateEmpty';
}

class SearchStateLoading extends LocationsSearchState {
  @override
  String toString() => 'SearchStateLoading';
}

class SearchStateSuccess extends LocationsSearchState {
  final List<LocationModel> locations;
  final String query;

  SearchStateSuccess(this.locations, this.query) : super([locations]);

  @override
  String toString() => 'SearchStateSuccess { songs: ${locations.length} }';
}

class AddEditLocationStateSuccess extends LocationsSearchState {
  @override
  String toString() => 'AddLocationSuccess';
}

class EditLocationStateSuccess extends LocationsSearchState {
  final LocationModel location;

  EditLocationStateSuccess(this.location) : super([location]);

  @override
  String toString() => 'EditLocationSuccess {location: $location }';
}

class SearchStateError extends LocationsSearchState {
  final String error;

  SearchStateError(this.error) : super([error]);

  @override
  String toString() => 'SearchStateError { error: $error }';
}