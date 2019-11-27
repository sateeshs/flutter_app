import 'package:equatable/equatable.dart';
import 'package:flutter_app/models/ItemModel.dart';

class ItemSearchEvent extends Equatable {
  ItemSearchEvent([List props = const []]) : super(props);

}
class TextChanged extends ItemSearchEvent {
  final String query;

  TextChanged({this.query}) : super([query]);

  @override
  String toString() => "ItemSearchTextChanged { query: $query }";
}

class AddItem extends ItemSearchEvent {
  final ItemModel item;

  AddItem({this.item}) : super([item]);

  @override
  String toString() => "AddItem { Item ${item.id}";
}

class EditItem extends ItemSearchEvent {
  final ItemModel item;

  EditItem({this.item}) : super([item]);

  @override
  String toString() => "EditItem { Item ${item.id}";
}

class RemoveItem extends ItemSearchEvent {
  final int itemID;

  RemoveItem({this.itemID}) : super([itemID]);

  @override
  String toString() => "Remove Item { ItemID: $itemID }";
}

class SelectItem extends ItemSearchEvent {
  final ItemModel item;

  SelectItem({this.item}) : super([item]);

  @override
  String toString() => "Selected Item ${item.title }";
}