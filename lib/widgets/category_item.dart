import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../sceens/category_meals_screen.dart';


class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color colur;

  CategoryItem(this.id, this.title, this.colur);
void selectCat(BuildContext ctx){
Navigator.of(ctx).pushNamed(CategoryMealsScreen.routeName,

    arguments: {
      'id' :id,
      'title' : title,
    },
);

}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      onTap: () =>selectCat(context) ,
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.title,),
        decoration: BoxDecoration(

            gradient: LinearGradient(
                colors: [
                colur.withOpacity(0.2),
            colur,
            ],
        begin: Alignment.bottomLeft,end: Alignment.bottomRight),
        borderRadius: BorderRadius.horizontal(right:Radius.zero,left: Radius.zero)
      ),


    ),

    );
  }
}
