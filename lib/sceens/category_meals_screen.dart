
import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/zero_item.dart';
class CategoryMealsScreen extends StatefulWidget {
 static const routeName =' cat_meal';
 final List<Meal> availableMeals;

  const CategoryMealsScreen(this.availableMeals) ;
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
String categoryTitle ;
List<Meal> displayedMeals;




    @override
  void didChangeDependencies() {
      final routm = ModalRoute.of(context).settings.arguments as Map<String ,String>;
      final catId = routm["id"];
      categoryTitle = routm["title"];
      displayedMeals  = widget.availableMeals.where((meal) {
        return meal.categories.contains(catId);
      }).toList();


    super.didChangeDependencies();
  }
void _remeoveMeal ( String mealId){
setState(() {
  displayedMeals.removeWhere((meal) => meal.id == mealId);
});
}

@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),

      ),
      body: ListView.builder
        (itemBuilder: (ctx, index){return ZeroItem(

        id :displayedMeals[index].id,
          imageUrl :displayedMeals[index].imageUrl,
         title : displayedMeals[index].title,
         duration: displayedMeals[index].duration ,
        complexity:displayedMeals[index].complexity ,
        affordability:displayedMeals[index].affordability ,
        removItem: _remeoveMeal ,
      );

        },

        itemCount: displayedMeals.length,

      ),
    );
  }
}
