import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/ItemModel.dart';
import 'package:meta/meta.dart';


@immutable
abstract class ItemSearchState extends Equatable {
  ItemSearchState([List props = const []]) : super(props);
}

class ItemSearchStateEmpty extends ItemSearchState {
  @override
  String toString() => 'SearchStateEmpty';
}
class ItemSearchStateLoading extends ItemSearchState {
  @override
  String toString() => 'SearchStateLoading';
}

class ItemSearchStateSuccess extends ItemSearchState {
  final List<ItemModel> items;
  final String query;

  ItemSearchStateSuccess(this.items, this.query) : super([items]);

  @override
  String toString() => 'ItemSearchStateSuccess { songs: ${items.length} }';
}

class AddEditFacilitytateSuccess extends ItemSearchState {
  @override
  String toString() => 'AddFacilityuccess';
}

class EditFacilitytateSuccess extends ItemSearchState {
  final ItemModel facility;

  EditFacilitytateSuccess(this.facility) : super([facility]);

  @override
  String toString() => 'EditFacilitySuccess {facility: $facility }';
}

class SelectFacilitytateSuccess extends ItemSearchState {
  final ItemModel facility;

  SelectFacilitytateSuccess(this.facility) : super([facility]);

  @override
  String toString() => 'SelectFacilitySuccess {facility: $facility }';
}

class ItemSearchStateError extends ItemSearchState {
  final String error;

  ItemSearchStateError(this.error) : super([error]);

  @override
  String toString() => 'SearchStateError { error: $error }';
}