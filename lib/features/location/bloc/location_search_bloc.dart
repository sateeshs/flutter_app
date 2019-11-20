import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/models/locationModel.dart';

class LocationsSearchBloc extends Bloc<LocationEvent, LocationsSearchState> {
  final LyricsRepository lyricsRepository;

  LocationsSearchBloc({@required this.lyricsRepository});

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
        final result = await lyricsRepository.searchLocations(searchQuery);
        yield SearchStateSuccess(result, searchQuery);
      } catch (error) {
        yield error is SearchResultError
            ? SearchStateError(error.message)
            : SearchStateError("Default error");
      }
    }
  }

  Stream<LocationsSearchState> _mapLocationAddToState(AddLocation event) async* {
    LocationBase updatedLocation = await lyricsRepository.addLocation(event.Location);
    if (currentState is SearchStateSuccess) {
      SearchStateSuccess state = currentState;
      List<LocationBase> updatedList = (currentState as SearchStateSuccess).Locations;

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
    await lyricsRepository.removeLocation(event.LocationID);
//    if(state is SearchStateSuccess){
//      SearchStateSuccess state = currentState;
//      yield SearchStateSuccess(state.Locations, state.query);
//    }
  }

  Stream<LocationsSearchState> _mapLocationEditToState(EditLocation event) async* {
    LocationBase updatedLocation = await lyricsRepository.editLocation(event.Location);
    yield EditLocationstateSuccess(updatedLocation);
  }

  @override
  void onTransition(Transition<LocationEvent, LocationsSearchState> transition) {
    print(transition);
  }
}