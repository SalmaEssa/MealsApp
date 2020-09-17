import 'package:flutter/material.dart';
import 'package:mealsApp/Models/Meal.dart';
import 'package:mealsApp/widgets/meal_item.dart';

class FavouritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;
  FavouritesScreen(this.favoriteMeals);
  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty)
     return Center(
      child: Text("You have no favorites yes- start adding some!"),
    );

    else {

      return ListView.builder(itemBuilder: (ctx, indx){
            return Align(alignment: Alignment.centerLeft,
            child: MealItem(afort:  favoriteMeals[indx].affordability ,title:favoriteMeals[indx].title , id: favoriteMeals[indx].id,
             duration: favoriteMeals[indx].duration, compl: favoriteMeals[indx].complexity, imgurl: favoriteMeals[indx].imageUrl),
            );

          }, itemCount: favoriteMeals.length,
          );
      
    }

   
  }
}