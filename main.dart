import 'package:flutter/material.dart';
import 'package:mealsApp/Models/Meal.dart';
import './dummy_data.dart';
import './screens/filtres_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './screens/Category_meals_screen.dart';

void main() {
  runApp(myApp());
}

class myApp extends StatefulWidget {
  @override
  _myAppState createState() => _myAppState();
}

class _myAppState extends State<myApp> {
  Map<String,bool> _filters={
    "gluten":false,
    "lactose": false,
    "vegan": false,
    "vegetarian" :false
  };
  List<Meal>  _filteredMeals=DUMMY_MEALS;
  List<Meal> _favoritesMeals=[];

void _toggleFavorites(String id)
{    final ind=_favoritesMeals.indexWhere((element) => element.id==id);
 if(ind<0){
   setState(() {
           _favoritesMeals.add(DUMMY_MEALS.firstWhere((element) => element.id==id));

   });
 }
 else {
   setState(() {
           _favoritesMeals.removeAt(ind);

   });
    }
 
}

bool _isFavorite(String id)
{
  return (_favoritesMeals.any((element) => element.id==id));
}
  void _set_filters(Map<String,bool> data){
     setState(() {
       _filters=data;
      
      _filteredMeals=DUMMY_MEALS.where((element) {
         if(!element.isGlutenFree&&data["gluten"])
         return false;
         if(!element.isLactoseFree&&data["lactose"])
         return false;
         if(!element.isVegan&&data["vegan"])
         return false;
         if(!element.isVegetarian&&data["vegetarian"])
         return false;
         return true;
      }).toList();
     });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title:"DeliMeals" ,
      theme: ThemeData(
      canvasColor: Color.fromRGBO(255, 254, 229, 1),
      fontFamily: "RobotoCondensed",
      primarySwatch: Colors.pink,
      accentColor: Colors.amber,
      textTheme: ThemeData.light().textTheme.copyWith(
        bodyText1: TextStyle(color:Color.fromRGBO(100, 51, 51, 1) ) 
        ,bodyText2: TextStyle(color:Color.fromRGBO(20, 51, 51, 1) ) ,
        headline1: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, fontFamily: "RobotoCondensed"
        , )
      )
      ),
      home:TabsScreen(_favoritesMeals),
      routes: { 
        CategoryMealsScreen.route_name:  (ctx)=>CategoryMealsScreen(_filteredMeals),
        MealDetailScreen.route_name: (ctx)=>MealDetailScreen(isFavorite: _isFavorite,toggleFavorite:_toggleFavorites ),
        FiltresScreen.route_name:(ctx)=>FiltresScreen(_set_filters,_filters)
      },
    );
  }
  
  
  }


