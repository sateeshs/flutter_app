/*import 'package:flutter/material.dart';
class Location extends StatefulWidget{
  final String title;
  Location({Key key, this.title}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }

}

*/

class LocationModel {
  final String title;
  final String description;
  final String type;
  final String imageURL;
  final int id;

  const LocationModel(
      {this.title,
        this.description,
        this.type,
        this.imageURL,
        this.id});

  bool isInQuery(String query) {
    return title.toLowerCase().contains(query.toLowerCase());
  }

  LocationModel copyWith({title, description, type, imageURL, id}) =>
      LocationModel(
          title: title ?? this.title,
          description: description ?? this.description,
          type: type ?? this.type,
          imageURL: imageURL ?? this.imageURL,
          id: id ?? this.id);
}
