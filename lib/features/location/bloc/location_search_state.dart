import 'package:equatable/equatable.dart';


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

class AddEditSongStateSuccess extends LocationsSearchState {
  @override
  String toString() => 'AddSongSuccess';
}

class EditSongStateSuccess extends LocationsSearchState {
  final LocationModel location;

  EditSongStateSuccess(this.location) : super([location]);

  @override
  String toString() => 'EditSongSuccess {song: $location }';
}

class SearchStateError extends LocationsSearchState {
  final String error;

  SearchStateError(this.error) : super([error]);

  @override
  String toString() => 'SearchStateError { error: $error }';
}