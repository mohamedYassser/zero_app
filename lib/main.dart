import 'package:flutter/material.dart';
import './dummy_data.dart';
import 'package:zero_app/models/meal.dart';
import 'package:zero_app/sceens/filters_screen.dart';
import './sceens/meal-detail_screen.dart';
import './sceens/tabs_screen.dart';
import './sceens/category_meals_screen.dart';


void main() => runApp(MyApp());


class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool>_filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };
  List<Meal>_availableMeal = DUMMY_MEALS;

  void _setFilters(Map<String, bool>_filterData) {
    setState(() {
      _filters = _filterData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        };
        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        return true;
      }).

        toList();

      });
    }
        @override
        Widget build(BuildContext context)
    {
      return MaterialApp(
        title: "flutter demo",
        theme: ThemeData(
          primaryColor: Colors.pink,
          primarySwatch: Colors.pink,
          accentColor: Colors.pinkAccent,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData
              .light()
              .textTheme
              .copyWith(
              body1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)
              ),
              body2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)

              ),
              title: TextStyle(fontSize: 22,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w600,
              )

          ),),
        //home: MyHomePage(),
        // home: CategoriesScreen()
        initialRoute: '/',
        routes: {
          '/': (context) => TabsScreen(),
          CategoryMealsScreen.routeName: (context) =>
              CategoryMealsScreen(_availableMeal),
          MealDetailScreen.routeName: (context) => MealDetailScreen(),
          FiltersScreen.routeName: (context) => FiltersScreen(_setFilters)
        },
      );
    }
  }

  class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
  }

  class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context){
  return Scaffold(
  appBar: AppBar(
  title: Text("Zero App"),
  ),

  body: null,

  );
  }

  }