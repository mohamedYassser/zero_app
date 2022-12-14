import 'package:flutter/material.dart';
import 'package:zero_app/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "meal_detail";

  Widget buildSectionTitle(BuildContext ctx, String text) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(text, style: Theme.of(ctx).textTheme.title),
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text(selectMeal.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildSectionTitle(context, "Ingerdients"),
            Container(
              //   decoration: BoxDecoration(
              //     color: Colors.white,
              //    border: Border.all(color: Colors.grey.shade300),
              // //    borderRadius: BorderRadius.circular(15),
              //   ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: Text(selectMeal.ingredients[index]),
                  ),
                ),
                itemCount: selectMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(context, "Steps"),
            Container(
               decoration: BoxDecoration(
                color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(15),
              ),
              margin: EdgeInsets.all(10),
              padding: EdgeInsets.all(10),
               height: 150,
               width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => ListTile(
                  leading: CircleAvatar(
                    child: Text("# ${index+1}"),
                  ),
                  title: Text(selectMeal.steps[index]),
                ),
                itemCount: selectMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed:() {Navigator.of(context).pop(mealId);},
        child: Icon(Icons.delete),

      ),
    );
  }
}
