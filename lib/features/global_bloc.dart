import 'dart:async';
import 'dart:collection';

import 'package:flutter_app/models/ItemModel.dart';
import 'package:flutter_app/models/itemList.dart';

abstract class BlocBase {
  void dispose();
}

///This solution relies on the use of a Global object, instantiated once for all, not part of any Widget tree.
class ApplicationBloc implements BlocBase {
  ItemList _genresList;

  ///
  /// Synchronous Stream to handle the provision of the movie genres
  ///
  StreamController<List<ItemModel>> _syncController =
      StreamController<List<ItemModel>>.broadcast();
  Stream<List<ItemModel>> get outItems => _syncController.stream;

  ///
  StreamController<List<ItemModel>> _cmdController =
      StreamController<List<ItemModel>>.broadcast();
  StreamSink get getMovieGenres => _cmdController.sink;

  ApplicationBloc() {
    // Read all genres from Internet
    /*
    api.movieGenres().then((list) {
      _genresList = list;
    });
*/
    _cmdController.stream.listen((_) {
      _syncController.sink
          .add(UnmodifiableListView<ItemModel>(_genresList.listOfItems));
    });
  }

  void dispose() {
    _syncController.close();
    _cmdController.close();
  }
}
ApplicationBloc globalBloc = ApplicationBloc();

