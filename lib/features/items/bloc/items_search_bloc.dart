import 'dart:async';

import 'package:bloc/bloc.dart';

import 'item_search_event.dart';
import 'item_search_state.dart';

class ItemSearchBloc
    extends Bloc<ItemSearchEvent, ItemSearchState> {
 // final FacilitiesService facilitiesService;
  //final LocationsSearchBloc locationsSearchBloc;
  StreamSubscription locationSearchSubscription;
    StreamSubscription fecilitySearchSubscription;


  ItemSearchBloc();

  @override
  // TODO: implement initialState
  ItemSearchState get initialState => ItemSearchStateEmpty();

  @override
  Stream<ItemSearchState> mapEventToState(ItemSearchEvent event) {
    // TODO: implement mapEventToState
    return null;
  }

    }