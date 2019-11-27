import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_app/common/constants.dart';
import 'package:flutter_app/features/location/bloc/location_search_bloc.dart';
import 'package:flutter_app/features/location/bloc/location_search_state.dart';
import 'package:flutter_app/models/FacilityModel.dart';
import 'package:flutter_app/models/api/search_result_error.dart';
import 'package:flutter_app/services/facilities_service.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import 'facility_search_event.dart';
import 'facility_search_state.dart';

class FacilitySearchBloc
    extends Bloc<FacilitySearchEvent, FacilitySearchState> {
  final FacilitiesService facilitiesService;
  final LocationsSearchBloc locationsSearchBloc;
  StreamSubscription locationSearchSubscription;

  FacilitySearchBloc(
      {@required this.facilitiesService, @required this.locationsSearchBloc}) {
    //listen
    locationSearchSubscription =
        locationsSearchBloc.listen((selectedLocationState) {
      if (state is SelectLocationStateSuccess) {
        // add(LocationSelected)
      }
    });
  }

  @override
  // TODO: implement initialState
  FacilitySearchState get initialState => FacilitySearchStateEmpty();

  @override
  Stream<FacilitySearchState> transformEvents(
      Stream<FacilitySearchEvent> events,
      Stream<FacilitySearchState> Function(FacilitySearchEvent event) next) {
    return super.transformEvents(
      (events as Observable<FacilitySearchEvent>).debounceTime(
        Duration(milliseconds: DEFAULT_SEARCH_DEBOUNCE),
      ),
      next,
    );
  }

  @override
  Stream<FacilitySearchState> mapEventToState(
      FacilitySearchEvent event) async* {
    if (event is TextChanged) {
      yield* _mapLocationsearchTextChangedToState(event);
    }
    if (event is AddFacility) {
      yield* _mapLocationAddToState(event);
    }
    if (event is RemoveFacility) {
      yield* _mapLocationRemoveToState(event);
    }
    if (event is EditFacility) {
      yield* _mapLocationEditToState(event);
    }
  }

  Stream<FacilitySearchState> _mapLocationsearchTextChangedToState(
      TextChanged event) async* {
    final String searchQuery = event.query;
    if (searchQuery.isEmpty) {
      yield FacilitySearchStateEmpty();
    } else {
      yield FacilitySearchStateLoading();

      try {
        final result = await facilitiesService.get(searchQuery);
        yield FacilitySearchStateSuccess(result, searchQuery);
      } catch (error) {
        yield error is SearchResultError
            ? FacilitySearchStateError(error.message)
            : FacilitySearchStateError("Default error");
      }
    }
  }

  Stream<FacilitySearchState> _mapLocationAddToState(AddFacility event) async* {
    FacilityModel updatedLocation = await facilitiesService.add(event.facility);
    if (state is SearchStateSuccess) {
      FacilitySearchStateSuccess searchState = state;
      List<FacilityModel> updatedList =
          (state as FacilitySearchStateSuccess).facilities;

      //yield AddEditLocationstateSuccess();

      if (updatedLocation.isInQuery(searchState.query)) {
        updatedList..insert(0, updatedLocation);
      }
      yield FacilitySearchStateSuccess(updatedList, searchState.query);
    } //else {
    //yield AddEditLocationstateSuccess();
    //}
  }

  Stream<FacilitySearchState> _mapLocationRemoveToState(
      RemoveFacility event) async* {
    await facilitiesService.remove(event.facilityID);
    if (state is FacilitySearchStateSuccess) {
      FacilitySearchStateSuccess searchState = state;
      searchState.facilities.removeWhere((song) {
        return song.id == event.facilityID;
      });
      yield FacilitySearchStateSuccess(searchState.facilities, searchState.query);
    }
  }

  Stream<FacilitySearchState> _mapLocationEditToState(
      EditFacility event) async* {
    FacilityModel updatedLocation =
        await facilitiesService.edit(event.facility);
    //yield EditLocationstateSuccess(updatedLocation);
  }

  @override
  void onTransition(
      Transition<FacilitySearchEvent, FacilitySearchState> transition) {
    print(transition);
  }

  @override
  Future<void> close() {
    locationSearchSubscription.cancel();
    return super.close();
  }
}
