
import 'package:flutter/material.dart';

import '../screens/Category_meals_screen.dart';

class CategoryItem extends StatelessWidget {
  @override
  final String id;
  final String title;
  final Color color;
  CategoryItem(this.title,this.color,this.id);
  void select_category(BuildContext ctx){
    Navigator.of(ctx).pushNamed(CategoryMealsScreen.route_name, arguments: {
      "title":title,
      "id":id
      
    } );
  }
  Widget build(BuildContext context) {
    return InkWell(
      onTap:()=>select_category(context) ,
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(15),
          child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(title,style: Theme.of(context).textTheme.headline1,),
        decoration: BoxDecoration(gradient: LinearGradient(colors: [color.withOpacity(0.7),color],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight),
        borderRadius: BorderRadius.circular(15),

        ),

      ),
    );
  }
}