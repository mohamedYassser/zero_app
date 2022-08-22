import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function SaveFilters ;

 FiltersScreen(this.SaveFilters);


  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _lactoseFree = false;
  bool _vegan = false;
  bool _vegetarian = false;

  Widget buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
        title: Text(title),
        value: currentValue,
        subtitle: Text(description),
        onChanged: updateValue);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Your filters",

        ),
        actions: [
          IconButton
            (
            icon: Icon(Icons.save),
            onPressed:() {
              final Map<String ,bool>selectFilter = {
                'gluten': _glutenFree,
                'lactose': _vegetarian,
                'vegan': _lactoseFree,
                'vegetarian': _vegan,
              };

              widget.SaveFilters(selectFilter);

            }
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection",
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
              child: ListView(
            children: [
              buildSwitchListTile(
                  "Gluten-Free", "Only include gluten meals", _glutenFree,
                  (newValue) {
                setState(() {
                  _glutenFree = newValue;
                });
              }),
              buildSwitchListTile(
                  "Vegetarian", "Only include Vegetarian meals", _vegetarian,
                      (newValue) {
                    setState(() {
                      _vegetarian = newValue;
                    });
                  }),
              buildSwitchListTile(
                  "Vegan", "Only include Vegan meals", _vegan,
                      (newValue) {
                    setState(() {
                      _vegan = newValue;
                    });
                  }),
              buildSwitchListTile(
                  "Lactose-Free", "Only include Lactose meals", _lactoseFree,
                      (newValue) {
                    setState(() {
                      _lactoseFree = newValue;
                    });
                  }),
            ],
          ))
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
