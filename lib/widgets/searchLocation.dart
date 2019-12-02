import 'package:flutter/material.dart';
import 'package:flutter_app/features/location/bloc/location_search_bloc.dart';
import 'package:flutter_app/features/location/bloc/location_search_event.dart';
import 'package:flutter_app/features/location/bloc/location_search_state.dart';
import 'package:flutter_app/models/locationModel.dart';
import 'package:flutter_app/widgets/productPage.dart';
import 'package:flutter_app/services/locationService.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class LocationSearch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LocationSearch();
}

class _LocationSearch extends State<LocationSearch> {
  LocationsSearchBloc _locationsSearchBloc;

  @override
  void initState() {
    super.initState();
    _locationsSearchBloc = LocationsSearchBloc(citiesService: CitiesService());
  }

  @override
  Widget build(BuildContext context) {
    // _locationsSearchBloc = BlocProvider.of<LocationsSearchBloc>(context);
    return Padding(
      padding: EdgeInsets.all(32.0),
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 10.0,
          ),
          TypeAheadField<LocationModel>(
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
              try {
                final list = CitiesService().getSuggestions(pattern);

                _locationsSearchBloc.add(TextChanged(query: pattern));
                return list;
                _locationsSearchBloc.listen((state) {
                  if (state is SearchStateSuccess) {
                    final results = (state as SearchStateSuccess).locations;
                    return results;
                  }
                });

                /*final results = (BlocProvider
                    .of<LocationsSearchBloc>(context)
                    .state as SearchStateSuccess)
                    .locations;
                return results;*/
              }catch(e) {

                print(e);
              }


              // .locals
              // .where(
              //   (local) =>
              //       local.description
              //           .toLowerCase()
              //           .contains(pattern.toLowerCase()),
              // )
              // .toList();
            },
            itemBuilder: (context, suggestion) {
              return ListTile(
                leading: Icon(Icons.location_searching),
                title: Text(suggestion.title),
                subtitle: Text('\$${suggestion.description}'),
              );
            },
            onSuggestionSelected: (suggestion) {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => ProductPage(
                      product:  suggestion)));
            },
          ),
        ],
      ),
    );
  }
}
