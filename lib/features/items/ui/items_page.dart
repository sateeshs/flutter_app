import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/models/ItemModel.dart';
import 'package:flutter_app/models/locationModel.dart';
import 'package:flutter_app/widgets/platform_content.dart';
import 'package:flutter_app/widgets/platform_parent.dart';

class ItemsPage extends StatefulWidget {
  ItemsPage({Key key}) : super(key: key);

  @override
  _ItemsPage createState() => new _ItemsPage();
}

class _ItemsPage extends State<ItemsPage>
    with SingleTickerProviderStateMixin 
    {
  int _currentCategory = 0;
  int _selectedCountry = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: _currentCategory == 3 ? 1 : 3,
        child: PlatformParent(
          onNavigationTap: _onNavigationTapped,
          currentCategory: _currentCategory,
          selectedCountry: _selectedCountry,
          children:
              PlatformContent().generate(_currentCategory, _selectedCountry),
          onTapped: (int) => _onTabTapped(int),
          showTabs: _currentCategory != 3,
        ));
  }

  void _onNavigationTapped(int index) {
    setState(() {
      _currentCategory = index;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _selectedCountry = index;
    });
  }
}