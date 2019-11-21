import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/common/constants.dart';
import 'package:flutter_app/features/location/bloc/location_search_event.dart';
import 'package:flutter_app/features/location/bloc/location_search_state.dart';
import 'package:flutter_app/models/api/search_result_error.dart';
import 'package:flutter_app/models/locationModel.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

class LocationsSearchBloc extends Bloc<LocationEvent, LocationsSearchState> {
  final NetworkService networkService;

  LocationsSearchBloc({@required this.networkService});

  @override
  LocationsSearchState get initialState => SearchStateEmpty();

  @override
  Stream<LocationsSearchState> transformEvents(Stream<LocationEvent> events,
      Stream<LocationsSearchState> Function(LocationEvent event) next) {
    return super.transformEvents(
      (events as Observable<LocationEvent>).debounceTime(
        Duration(milliseconds: DEFAULT_SEARCH_DEBOUNCE),
      ),
      next,
    );
  }

  @override
  Stream<LocationsSearchState> mapEventToState(LocationEvent event) async* {
    if (event is TextChanged) {
      yield* _mapLocationsearchTextChangedToState(event);
    }
    if (event is AddLocation) {
      yield* _mapLocationAddToState(event);
    }
    if (event is RemoveLocation) {
      yield* _mapLocationRemoveToState(event);
    }
    if (event is EditLocation) {
      yield* _mapLocationEditToState(event);
    }
  }

  Stream<LocationsSearchState> _mapLocationsearchTextChangedToState(
      TextChanged event) async* {
    final String searchQuery = event.query;
    if (searchQuery.isEmpty) {
      yield SearchStateEmpty();
    } else {
      yield SearchStateLoading();

      try {
        final result = await networkService.searchLocations(searchQuery);
        yield SearchStateSuccess(result, searchQuery);
      } catch (error) {
        yield error is SearchResultError
            ? SearchStateError(error.message)
            : SearchStateError("Default error");
      }
    }
  }

  Stream<LocationsSearchState> _mapLocationAddToState(AddLocation event) async* {
    LocationModel updatedLocation = await networkService.addLocation(event.Location);
    if (currentState is SearchStateSuccess) {
      SearchStateSuccess state = currentState;
      List<LocationModel> updatedList = (currentState as SearchStateSuccess).locations;

      yield AddEditLocationstateSuccess();

      if (updatedLocation.isInQuery(state.query)) {
        updatedList..insert(0, updatedLocation);
      }
      yield SearchStateSuccess(updatedList, state.query);
    } else {
      yield AddEditLocationstateSuccess();
    }
  }

  Stream<LocationsSearchState> _mapLocationRemoveToState(RemoveLocation event) async* {
    await networkService.removeLocation(event.LocationID);
//    if(state is SearchStateSuccess){
//      SearchStateSuccess state = currentState;
//      yield SearchStateSuccess(state.Locations, state.query);
//    }
  }

  Stream<LocationsSearchState> _mapLocationEditToState(EditLocation event) async* {
    LocationModel updatedLocation = await networkService.editLocation(event.Location);
    yield EditLocationstateSuccess(updatedLocation);
  }

  @override
  void onTransition(Transition<LocationEvent, LocationsSearchState> transition) {
    print(transition);
  }
}