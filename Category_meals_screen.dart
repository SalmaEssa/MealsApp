import 'package:flutter/material.dart';
import '../Models/Meal.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMealsScreen extends StatefulWidget {
    static const route_name="/category-Meals";
final List<Meal> filteredMeals;
CategoryMealsScreen(this.filteredMeals);
  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
 String title;
  List<Meal> displayedMeals;
 bool l=false;
 @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    
     final data=ModalRoute.of(context).settings.arguments as Map<String,String>;
    final category_id=data['id'];
   title=data["title"];
     displayedMeals=widget.filteredMeals.where((element) {
       return element.categories.contains(category_id);
     }).toList();
    
  }
 
  void _removeMeal(String id){
    setState(() {
         displayedMeals.removeWhere((element) => id==element.id);

    });
  }

  @override
  Widget build(BuildContext context) {
   

    
    return Scaffold(
      appBar: AppBar(title:Text(title) ,),
          body: ListView.builder(itemBuilder: (ctx, indx){
            return Align(alignment: Alignment.centerLeft,
            child: MealItem(afort:  displayedMeals[indx].affordability ,title:displayedMeals[indx].title , id: displayedMeals[indx].id,
             duration: displayedMeals[indx].duration, compl: displayedMeals[indx].complexity, imgurl: displayedMeals[indx].imageUrl),
            );

          }, itemCount: displayedMeals.length,
          )

    );
  }
}