import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltresScreen extends StatefulWidget {
  static const route_name="/Filtres";
   final Function _saveFilters;
  Map<String,bool> currentFiltets;

  FiltresScreen(this._saveFilters,this.currentFiltets);
  
  @override
  _FiltresScreenState createState() => _FiltresScreenState();
}

class _FiltresScreenState extends State<FiltresScreen> {
  bool _isGlutenFree=false;

   bool _isLactoseFree=false;

   bool _isVegan=false;

   bool _isVegetarian=false;
    
@override
void initState(){
_isGlutenFree=widget.currentFiltets["gluten"];
_isLactoseFree=widget.currentFiltets["lactose"];
_isVegan=widget.currentFiltets["vegan"];
_isVegetarian=widget.currentFiltets["vegetarian"];
  super.initState();
}

 Widget _createSwitchListTile(bool val, String title, String subtitle , Function fun ){
   return SwitchListTile(value: val ,title: Text(title) ,subtitle: Text(subtitle)    ,onChanged: fun );
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Your Filters"),
      actions: <Widget>[
        IconButton(icon: Icon(Icons.save), onPressed:(){
          final data={
            "gluten":_isGlutenFree,
    "lactose": _isLactoseFree,
    "vegan": _isVegan,
    "vegetarian" :_isVegetarian
          };
        widget._saveFilters(data) ;
        } )
      ],),
      body: Column(
    children: <Widget>[
      Container(
        padding: EdgeInsets.all(20),
        child: Text("Adjust your Meal Selection.",style: Theme.of(context).textTheme.headline1),
      ),
      Expanded(
child: ListView(
  children: <Widget>[
    _createSwitchListTile(_isGlutenFree,"Gluten-Free","Only Include Gluten-free meals",(val ){
      setState(() {
        _isGlutenFree=val;
      });
    }),
    _createSwitchListTile(_isLactoseFree,"Lactose-Free","Only Include Lactose-free meals",(val ){
      setState(() {
        _isLactoseFree=val;
      });
    }),

    _createSwitchListTile(_isVegan,"Vegan","Only Include Vegan  meals",(val ){
      setState(() {
        _isVegan=val;
      });
    }),
   _createSwitchListTile(_isVegetarian,"Vegetarian","Only Include Vegetarian  meals",(val ){
      setState(() {
        _isVegetarian=val;
      });
    }),
  ],
),
      )

    ],

      )
      ,
      drawer: MainDrawer(),
    );
  }
}