

import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/meal_detail_screen.dart';

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final String id;
  // final Function removeItem;

  MealItem(
      {@required this.title,
      @required this.imageUrl,
      @required this.duration,
      this.complexity,
      this.affordability,
      @required this.id,
      });
    
    String get complexityText {
      switch (complexity) {
        case Complexity.Simple :
          return 'Simple';
          break;
        case Complexity.Challenging :
          return 'Challenging';
          break;

        case Complexity.Hard :
          return 'Hard';
          break;
        default:
          return 'Unknowm';
      }
    } 

    String get affordabilityText {
      switch(affordability) {
        case Affordability.Affordable:
          return 'Affordable';
          break;
        case Affordability.Luxurious:
          return 'Luxurious';
          break;
        case Affordability.Pricey:
          return 'Pricey';
          break;
        default:
          return 'unknown';
      }
    }

  void selectMeal(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(MealDetailsScreen.routeName, arguments: id,).then((result){
      print(result);
      if(result != null) {
        // removeItem(result);
      }
    });
  }
  // MealItem(this.categoryMeals, this.index);
  
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 4,
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15)),
                  child: Image.network(
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 100,
                  child: Container(
                    width: 270,
                    padding: const EdgeInsets.all(5),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: TextStyle(fontSize: 24, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 5,),
                      Text('$duration mins', style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 5,),
                      Text('$complexityText', style: TextStyle(fontSize: 18),),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 5,),
                      Text('$affordabilityText', style: TextStyle(fontSize: 18),)
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
