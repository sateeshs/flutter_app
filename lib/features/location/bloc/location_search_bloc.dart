import 'package:bloc/bloc.dart';
import 'package:flutter_app/common/constants.dart';
import 'package:flutter_app/models/api/search_result_error.dart';
import 'package:flutter_app/models/locationModel.dart';
import 'package:flutter_app/services/beerService.dart';
import 'package:flutter_app/services/locationService.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'location_search_event.dart';
import 'location_search_state.dart';

class LocationsSearchBloc extends Bloc<LocationSearchEvent, LocationsSearchState> {
  final CitiesService citiesService;
  
  //StreamSubscription addEditBlocSubscription;

  LocationsSearchBloc({@required this.citiesService}){
    //listen
  }

  @override
  LocationsSearchState get initialState => SearchStateEmpty();




  @override
  Stream<LocationsSearchState> transformEvents(Stream<LocationSearchEvent> events,
      Stream<LocationsSearchState> Function(LocationSearchEvent event) next) {
    return super.transformEvents(
      (events as Observable<LocationSearchEvent>).debounceTime(
        Duration(milliseconds: DEFAULT_SEARCH_DEBOUNCE),
      ),
      next,
    );
  }

  @override
  Stream<LocationsSearchState> mapEventToState(LocationSearchEvent event) async* {
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
        final result = await citiesService.getSuggestions(searchQuery);
        yield SearchStateSuccess(result, searchQuery);
      } catch (error) {
        yield error is SearchResultError
            ? SearchStateError(error.message)
            : SearchStateError("Default error");
      }
    }
  }

  Stream<LocationsSearchState> _mapLocationAddToState(AddLocation event) async* {
    LocationModel updatedLocation = await citiesService.addCity(event.location);
    if (state is SearchStateSuccess) {
      SearchStateSuccess searchState = state;
      List<LocationModel> updatedList = (state as SearchStateSuccess).locations;

      //yield AddEditLocationstateSuccess();

      if (updatedLocation.isInQuery(searchState.query)) {
        updatedList..insert(0, updatedLocation);
      }
      yield SearchStateSuccess(updatedList, searchState.query);
    } //else {
      //yield AddEditLocationstateSuccess();
    //}
  }

  Stream<LocationsSearchState> _mapLocationRemoveToState(RemoveLocation event) async* {
    await citiesService.removeCity(event.locationID);
   if(state is SearchStateSuccess){
     SearchStateSuccess searchState = state;
     searchState.locations.removeWhere((song) {
        return song.id == event.locationID;
      });
     yield SearchStateSuccess(searchState.locations, searchState.query);
   }
  }

  Stream<LocationsSearchState> _mapLocationEditToState(EditLocation event) async* {
    LocationModel updatedLocation = await citiesService.editCity(event.location);
    //yield EditLocationstateSuccess(updatedLocation);
  }

  @override
  void onTransition(Transition<LocationSearchEvent, LocationsSearchState> transition) {
    print(transition);
  }
  
  @override
  Future<void> close() {
    //addEditBlocSubscription.cancel();
    return super.close();
  }
}