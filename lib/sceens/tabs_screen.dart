import 'package:flutter/material.dart';
import 'package:zero_app/widgets/main_drawer.dart';
import 'categories_screen.dart';
import 'favourits_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map <String , Object>> _pages = [

    {
      'page': CategoriesScreen(),
      'title' : "categories"
    },
    {
      'page': FavouritScreen(),
      'title': "your favourites",
    },
  ];




int _selectPageIndex =0;
  void _selectPage(int value) {
    setState(() {
_selectPageIndex = value;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pages[_selectPageIndex]['title']),


      ),
      body: _pages[_selectPageIndex]['page'],

    bottomNavigationBar: BottomNavigationBar(
      onTap: _selectPage,
      backgroundColor: Theme.of(context).primaryColor,
      selectedItemColor: Theme.of(context).accentColor,
      unselectedItemColor: Colors.white,
      currentIndex: _selectPageIndex,
      items: [
        BottomNavigationBarItem (
          icon: Icon(Icons.category),
          title: Text("Categories")
        ),

    BottomNavigationBarItem (
    icon: Icon(Icons.favorite),
    title: Text("Favourite"),
    ),
      ],
    ),
 drawer: MainDrawer(),
);
  }

}
