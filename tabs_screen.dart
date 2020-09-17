import 'package:flutter/material.dart';
import 'package:mealsApp/Models/Meal.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories_screen.dart';
import '../screens/favourites_screen.dart';

class TabsScreen extends StatefulWidget {
      final List<Meal> favoriteMeals;
TabsScreen(this.favoriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
    int _indx=0;
    
   List<Map<String,Object>> _l;

  @override
  void initState() {
    // TODO: implement initState
    _l=[
     {"screen":CategoriesScreen(),
    "title": "Categories"

    },
    {"screen":FavouritesScreen(widget.favoriteMeals)
,
    "title":"Favourites"

    }
  ];
    super.initState();
  }
   
  
  void _selected_tab(int indx){
  setState(() {
    _indx=indx;
  });

  }
  @override
  Widget build(BuildContext context) {
    return
    Scaffold(
      appBar: AppBar(title: Text(_l[_indx]["title"]),),
      body:_l[_indx]["screen"], 
      bottomNavigationBar: BottomNavigationBar(items: [
        BottomNavigationBarItem(icon: Icon(Icons.category), title: Text("Categories")),
        BottomNavigationBarItem(icon: Icon(Icons.star),title: Text("Favourites"))
      ],
      backgroundColor: Theme.of(context).primaryColor,
      onTap: _selected_tab,
      unselectedItemColor: Colors.white,
      selectedItemColor: Theme.of(context).accentColor,
      currentIndex: _indx,
      
      ),
      drawer: MainDrawer(),
      
      
      );
    
    
  }
}