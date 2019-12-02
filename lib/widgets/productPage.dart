import 'package:flutter/material.dart';
import 'package:flutter_app/models/locationModel.dart';
class ProductPage extends StatelessWidget {
  final LocationModel product;

  ProductPage({this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(title: new Text(this.product.title,
        style: Theme.of(context).textTheme.headline,),),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          children: [
         _myListView(context),//List of features
//ActionButtons()
          ],
        ),
      ),
    );
  }

  ListView _myListView(BuildContext context) {
    return ListView(
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.fastfood),
          title: Text('Food'),
        ),
        ListTile(
          leading: Icon(Icons.local_drink),
          title: Text('Beer'),
          onTap: (){
            Navigator.push(context,null //new MaterialPageRoutebuilder: (context) => new NowPlaying(songData, s)))
                         );
          },
        ),
        ListTile(
          leading: Icon(Icons.movie),
          title: Text('Movie'),
        ),
      ],
    );
  }
}