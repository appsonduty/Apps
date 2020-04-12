import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../models/meal.dart';

class FavouritesScreen extends StatelessWidget {

  final List<Meal> favouriteMeals;
  FavouritesScreen(this.favouriteMeals);
  @override
  Widget build(BuildContext context) {
    if(favouriteMeals.isEmpty) {
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
                  id: favouriteMeals[index].id,
                  title: favouriteMeals[index].title,
                  duration: favouriteMeals[index].duration,
                  imageUrl: favouriteMeals[index].imageUrl,
                  complexity: favouriteMeals[index].complexity,
                  affordability: favouriteMeals[index].affordability,
                  // removeItem: _removeMeal,
                  ));
          },
          itemCount: favouriteMeals.length,
        );
  }
  }
}