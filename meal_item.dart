import 'package:flutter/material.dart';
import '../screens/meal_detail_screen.dart';
import '../Models/Meal.dart';

class MealItem extends StatelessWidget {
  final String id;
    final String title;
    final String imgurl;
      final int duration;
      final Complexity compl;
      final Affordability afort;
      MealItem({@required  this.afort,@required this.title,@required this.id, @required this.duration,@required this.compl, @required this.imgurl});
  
  String get complexity{
   switch (compl) {
     case Complexity.Simple:
       return "Simple";
       break;
     case Complexity.Challenging:
       return "Challenging";
       break;
     case Complexity.Hard:
       return "Hard";
       break;
      default:
       return "UnKnown";
   }
   
  }
String get affordability{
   switch (afort) {
      
       case Affordability.Affordable:
         return "Affordable";
         break;
       case Affordability.Pricey:
         return "Pricey";
         break;
       case Affordability.Luxurious:
         return "Expensive";
         break;
       default:
       return "UnKnown";
      
     }
}

  void selectedMeal(BuildContext ctx)
  {
Navigator.of(ctx).pushNamed(MealDetailScreen.route_name, arguments: id).then((value) {
  if(value!=null){
   // removeItem(value);
  }
});
  }
  @override
  Widget  build(BuildContext context) {
    return InkWell(
      onTap: ()=>selectedMeal(context),
          child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack(
              children: [
              ClipRRect(borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),  
              ),
              child: Image.network(imgurl,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
              )
              ,),
                
                Positioned(
                  bottom:20 ,
                  right: 10,
                  child: Container(
                    width: 250,
                     padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    color: Colors.black54,
                    child: Text(title, softWrap: true, overflow: TextOverflow.fade,
                    style: TextStyle(color: Colors.white,fontSize: 26),
                    
                  ) 
                   

              
                ))],
            ),
            Padding(
              padding: EdgeInsets.all(20),
                        child: Row(
                          mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: <Widget>[
                   Row(
                     children: <Widget>[
                       Icon(Icons.schedule),
                       SizedBox(width: 6,),
                       Text('$duration min')
                     ],
                   ),
                Row(
                     children: <Widget>[
                       Icon(Icons.work),
                       SizedBox(width: 6,),
                       Text(complexity)
                     ],
                   ),
                    Row(
                     children: <Widget>[
                       Icon(Icons.attach_money),
                       SizedBox(width: 6,),
                       Text(affordability)
                     ],
                   )

                ],
              ),
            )
          ],
        ),

        
      ),
    );
  }
}