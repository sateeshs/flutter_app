import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/FacilityModel.dart';

class FacilitySearchEvent extends Equatable {
  FacilitySearchEvent([List props = const []]) : super(props);
}

class TextChanged extends FacilitySearchEvent {
  final String query;

  TextChanged({this.query}) : super([query]);

  @override
  String toString() => "FacilitySearchTextChanged { query: $query }";
}

class AddFacility extends FacilitySearchEvent {
  final FacilityModel facility;

  AddFacility({this.facility}) : super([facility]);

  @override
  String toString() => "AddFacility { Facility ${facility.id}";
}

class EditFacility extends FacilitySearchEvent {
  final FacilityModel facility;

  EditFacility({this.facility}) : super([facility]);

  @override
  String toString() => "EditFacility { Facility ${facility.id}";
}

class RemoveFacility extends FacilitySearchEvent {
  final int facilityID;

  RemoveFacility({this.facilityID}) : super([facilityID]);

  @override
  String toString() => "Remove Facility { FacilityID: $facilityID }";
}

class SelectFacility extends FacilitySearchEvent {
  final FacilityModel facility;

  SelectFacility({this.facility}) : super([facility]);

  @override
  String toString() => "Selected Facility ${facility.title }";
}
