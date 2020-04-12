import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../widgets/meal_item.dart';


class CategoryMeal extends StatefulWidget {
  static const routeName = '/category-meal';

  final List<Meal> availableMeals;

  CategoryMeal(this.availableMeals);

  @override
  _CategoryMealState createState() => _CategoryMealState();
}

class _CategoryMealState extends State<CategoryMeal> {
  String categoryTitle;
  List<Meal> displayedMeals;
  var _loadedInitData = false;
  

  // @override
  // void initState() {
  
    
    
  //   super.initState();
  // }

  @override
  void didChangeDependencies() {
    
    if(!_loadedInitData){
       final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
        categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    displayedMeals = widget.availableMeals.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    _loadedInitData = true;

    }
   
    super.didChangeDependencies();
  }
  // void _removeMeal(String mealId) {

  //   setState(() {
  //     displayedMeals.removeWhere((meal)=>meal.id == mealId);
  //   });

  // }
  @override
  Widget build(BuildContext context) {
    
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
                  id: displayedMeals[index].id,
                  title: displayedMeals[index].title,
                  duration: displayedMeals[index].duration,
                  imageUrl: displayedMeals[index].imageUrl,
                  complexity: displayedMeals[index].complexity,
                  affordability: displayedMeals[index].affordability,
                  // removeItem: _removeMeal,
                  ));
          },
          itemCount: displayedMeals.length,
        ),
      ),
    );
  }
}
