import 'package:flutter/material.dart';
import 'package:zero_app/widgets/category_item.dart';
import '../dummy_data.dart';




class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      title: Text("meal"),
      ),
     body: GridView(
          padding: EdgeInsets.all(25),
          children:
              DUMMY_CATEGORIES.map((catData) =>
               CategoryItem(catData.id,catData.title,catData.color)).toList(),


          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent: 300,
            childAspectRatio: 2/ 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
          )),
    );
  }
}
