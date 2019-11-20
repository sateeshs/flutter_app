import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/productPage.dart';
import 'package:flutter_app/services/locationService.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class LocationSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          TypeAheadField(
            textFieldConfiguration: TextFieldConfiguration(
              autofocus: true,
              style: DefaultTextStyle.of(context)
                  .style
                  .copyWith(fontStyle: FontStyle.italic),
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'What are you looking for?'),
            ),
            suggestionsCallback: (pattern) async {
              return await BackendService.getSuggestions(pattern);
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                leading: Icon(Icons.location_searching),
                title: Text(suggestion['name']),
                subtitle: Text('\$${suggestion['price']}'),
              );
            },
            onSuggestionSelected: (suggestion) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductPage(product: suggestion)));
            },
          ),
        ],
      ),
    );
  }
}
