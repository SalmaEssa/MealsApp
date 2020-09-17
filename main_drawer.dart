
import 'package:flutter/material.dart';
import 'package:mealsApp/screens/filtres_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String txt, IconData icon, Function fun)
  {
 return ListTile(
leading: Icon(icon, size: 26, ),
title: Text(txt, style: TextStyle(
  fontSize: 24,
  fontWeight: FontWeight.bold,
  fontFamily:"RobotoCondensed"
),),
onTap: fun,
 );

  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      
      child:Column(
        children: <Widget>[
          Container(
            color: Theme.of(context).accentColor,
            height: 120,
            width: double.infinity,
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(20),
            child: Text("Cooking Up!" ,style: TextStyle(fontWeight: FontWeight.w900,
            fontSize: 30,
            color: Theme.of(context).primaryColor
            ),
            ),
          ),
          SizedBox(height:20),
          buildListTile("Meals",Icons.restaurant,(){
            Navigator.of(context).pushReplacementNamed('/');
          }),
          buildListTile("Filtres",Icons.settings,(){
            Navigator.of(context).pushReplacementNamed(FiltresScreen.route_name);

          })

        ],
      ) ,
    );
  }
}