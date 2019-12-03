import 'package:flutter/material.dart';
import 'package:flutter_app/models/itemList.dart';

import '../../../models/locationModel.dart';

class FacilitiesPage extends StatelessWidget {
  final LocationModel product;
  List<String> items = ["Beer", "Food", "Movie"];
  FacilitiesPage({this.product});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text(
          this.product.title,
          style: Theme.of(context).textTheme.headline,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
            _myListView(context), //List of features
//ActionButtons()
          ],
        ),
      ),
    );
  } //build

  ListView _myListView(BuildContext context) {
    return ListView.builder(
      physics: NeverScrollableScrollPhysics(),
      itemCount: items.length,
      itemBuilder: (context, index) => buildItem(context, items[index]),
    );
  }

  ListTile buildItem(BuildContext context, String item) {
    return ListTile(
      leading: Icon(Icons.local_drink),
      title: Text(item),
      onTap: () {
        Navigator.push(context,null
            //new MaterialPageRoutebuilder: (context) => new NowPlaying(songData, s)
            );
      },
    );
  }
}