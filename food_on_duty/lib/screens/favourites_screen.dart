import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatefulWidget {

  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);

  @override
  _FavouritesScreenState createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  @override
  Widget build(BuildContext context) {
    if(widget.favouriteMeals.isEmpty) {
      return Center(child: Text("No Favoutites"),);
    }
    else {
    return ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
                padding: const EdgeInsets.all(5),
                // decoration:
                //     BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: MealItem(
                  id: widget.favouriteMeals[index].id,
                  title: widget.favouriteMeals[index].title,
                  duration: widget.favouriteMeals[index].duration,
                  imageUrl: widget.favouriteMeals[index].imageUrl,
                  complexity: widget.favouriteMeals[index].complexity,
                  affordability: widget.favouriteMeals[index].affordability,
                  // removeItem: _removeMeal,
                  ));
          },
          itemCount: widget.favouriteMeals.length,
        );
  }
  }
}