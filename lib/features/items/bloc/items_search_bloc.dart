import 'dart:async';

class ItemSearchBloc
    extends Bloc<ItemSearchEvent, ItemSearchState> {
  final FacilitiesService facilitiesService;
  final LocationsSearchBloc locationsSearchBloc;
  StreamSubscription locationSearchSubscription;

  ItemSearchBloc();

    }