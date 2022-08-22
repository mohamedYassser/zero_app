import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../sceens/filters_screen.dart';

class MainDrawer extends StatelessWidget {

  Widget builListTile( String title, IconData icon,Function tabsOn) {
    return ListTile(
    leading: Icon(
     icon,
      size: 27,
    ),
    title: Text(
     title,
      style: TextStyle(
          fontSize: 24,
          fontFamily: 'RobotoCondensed',
          fontWeight: FontWeight.bold),
    ),
      onTap: tabsOn,
  );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            height: 129,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            color: Colors.tealAccent.shade100,
            alignment: Alignment.centerLeft,
            child: Text(
              "Cooking UP!",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).primaryColor),
            ),
          ),
          SizedBox(height: 20),
         builListTile("Meal", Icons.restaurant,(){Navigator.of(context).pushReplacementNamed('/');}),
          builListTile("Filters", Icons.settings,(){Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);}),


        ],
      ),
    );
  }
}
