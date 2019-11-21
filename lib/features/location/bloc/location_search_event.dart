import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/locationModel.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

abstract class LocationEvent extends Equatable {
  LocationEvent([List props = const []]) : super(props);

  
}

class TextChanged extends LocationEvent {
  final String query;

  TextChanged({this.query}) : super([query]);

  @override
  String toString() => "LocationSearchTextChanged { query: $query }";
}

class AddLocation extends LocationEvent {
  final LocationModel Location;

  AddLocation({this.Location}) : super([Location]);

  @override
  String toString() => "AddLocation { Location ${Location.id}";
}

class EditLocation extends LocationEvent {
  final LocationModel Location;

  EditLocation({this.Location}) : super([Location]);

  @override
  String toString() => "EditLocation { Location ${Location.id}";
}

class RemoveLocation extends LocationEvent {
  final int LocationID;

  RemoveLocation({this.LocationID}) : super([LocationID]);

  @override
  String toString() => "Remove Location { LocationID: $LocationID }";
}