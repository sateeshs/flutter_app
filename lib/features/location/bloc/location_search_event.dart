import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/locationModel.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

abstract class LocationSearchEvent extends Equatable {
  LocationSearchEvent([List props = const []]) : super(props);
}

class TextChanged extends LocationSearchEvent {
  final String query;

  TextChanged({this.query}) : super([query]);

  @override
  String toString() => "LocationSearchTextChanged { query: $query }";
}

class AddLocation extends LocationSearchEvent {
  final LocationModel location;

  AddLocation({this.location}) : super([location]);

  @override
  String toString() => "AddLocation { Location ${location.id}";
}

class EditLocation extends LocationSearchEvent {
  final LocationModel location;

  EditLocation({this.location}) : super([location]);

  @override
  String toString() => "EditLocation { Location ${location.id}";
}

class RemoveLocation extends LocationSearchEvent {
  final int locationID;

  RemoveLocation({this.locationID}) : super([locationID]);

  @override
  String toString() => "Remove Location { LocationID: $locationID }";
}
