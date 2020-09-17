import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
      static const route_name="/Meal Detail";
final Function isFavorite;
final Function toggleFavorite;
MealDetailScreen({this.isFavorite,this.toggleFavorite});
Widget Create_Title( BuildContext context ,String txt)
    {
return Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                child: Text(txt, style: Theme.of(context).textTheme.headline1),
              );


    }
    Widget create_container(BuildContext context, Widget child){

      return Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
                ),
                height:150,
                width: 300,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(10),
                
                child: child,
              );
    }
  
  @override
  Widget build(BuildContext context) {
    final id=ModalRoute.of(context).settings.arguments as String;
    final  meal=DUMMY_MEALS.firstWhere((element) => element.id==id);

    
    return Scaffold(
      appBar: AppBar(title: Text('${meal.title}'),),
          body:SingleChildScrollView(
                      child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Image.network(meal.imageUrl, height: 300, width: double.infinity, fit: BoxFit.cover,),
                Create_Title(context,"Ingredients"),
                create_container(context, ListView.builder(itemBuilder: (ctx,indx){
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding
                      (padding: EdgeInsets.symmetric(horizontal:10, vertical: 5),
                        child: Text(meal.ingredients[indx])),
                    );
                  }
                  ,itemCount: meal.ingredients.length,)),
                Create_Title(context,"Steps"),
                create_container(context, 
                ListView.builder(itemBuilder: (ctx,indx){
                 return Column(
                   children: <Widget>[
                     ListTile(leading: CircleAvatar(child: Text('# ${indx+1}'),),
                     title: Text(meal.steps[indx]),
                     ),
                     Divider()
                   ],
                 );
                },itemCount: meal.steps.length,
                
                
                )
                )
              ],
            ),
          )
        , floatingActionButton: FloatingActionButton(child: Icon(
          isFavorite(id)? Icons.star
          :Icons.star_border
          ),
          onPressed:()=>toggleFavorite(id)
        , 
        ),
      
    );
  }
}