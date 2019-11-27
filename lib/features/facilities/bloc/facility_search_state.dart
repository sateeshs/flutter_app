

import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/FacilityModel.dart';
import 'package:meta/meta.dart';

@immutable
abstract class FacilitySearchState extends Equatable {
  FacilitySearchState([List props = const []]) : super(props);
}

class FacilitySearchStateEmpty extends FacilitySearchState {
  @override
  String toString() => 'SearchStateEmpty';
}
class FacilitySearchStateLoading extends FacilitySearchState {
  @override
  String toString() => 'SearchStateLoading';
}

class FacilitySearchStateSuccess extends FacilitySearchState {
  final List<FacilityModel> facilities;
  final String query;

  FacilitySearchStateSuccess(this.facilities, this.query) : super([facilities]);

  @override
  String toString() => 'FacilitySearchStateSuccess { songs: ${facilities.length} }';
}

class AddEditFacilitytateSuccess extends FacilitySearchState {
  @override
  String toString() => 'AddFacilityuccess';
}

class EditFacilitytateSuccess extends FacilitySearchState {
  final FacilityModel facility;

  EditFacilitytateSuccess(this.facility) : super([facility]);

  @override
  String toString() => 'EditFacilitySuccess {facility: $facility }';
}

class SelectFacilitytateSuccess extends FacilitySearchState {
  final FacilityModel facility;

  SelectFacilitytateSuccess(this.facility) : super([facility]);

  @override
  String toString() => 'SelectFacilitySuccess {facility: $facility }';
}

class FacilitySearchStateError extends FacilitySearchState {
  final String error;

  FacilitySearchStateError(this.error) : super([error]);

  @override
  String toString() => 'SearchStateError { error: $error }';
}