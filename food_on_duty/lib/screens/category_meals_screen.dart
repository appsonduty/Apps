import 'package:flutter/material.dart';
import '../widgets/meal_item.dart';
import '../dummy_data.dart';

class CategoryMeal extends StatelessWidget {
  static const routeName = '/category-meal';
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMeal(this.categoryTitle, this.categoryId);
  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    return Scaffold(
      appBar: AppBar(
        title: Text("${categoryTitle.toString().toUpperCase()}"),
      ),
      body: Center(
        child: ListView.builder(
          itemBuilder: (ctx, index) {
            return Container(
                padding: const EdgeInsets.all(5),
                // decoration:
                //     BoxDecoration(borderRadius: BorderRadius.circular(30)),
                child: MealItem(
                  title: categoryMeals[index].title,
                  duration: categoryMeals[index].duration,
                  imageUrl: categoryMeals[index].imageUrl,
                  complexity: categoryMeals[index].complexity,
                  affordability: categoryMeals[index].affordability,
                  ));
          },
          itemCount: categoryMeals.length,
        ),
      ),
    );
  }
}
