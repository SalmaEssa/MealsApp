import 'package:flutter/material.dart';
import '../widgets/category_item.dart';

import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: GridView( children: DUMMY_CATEGORIES.map((e) => CategoryItem(e.title, e.color,e.id)).toList(),

      padding:const EdgeInsets.all(25) ,
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(maxCrossAxisExtent: 200,mainAxisSpacing:20, crossAxisSpacing: 20,childAspectRatio: 3/2) ,
        
      ),
    );
  }
}