import 'package:flutter_app/models/ItemModel.dart';

class ItemList {

  List<ItemModel> listOfItems = <ItemModel>[];
  
  ItemList.fromJson(Map<String,dynamic> json)
          :listOfItems = (json["items"] as List<dynamic>)
                          .map((item) => ItemModel.fromJson(item)).toList();
}