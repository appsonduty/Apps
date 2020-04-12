import 'package:flutter/material.dart';
import './dummy_data.dart';
import './screens/meal_detail_screen.dart';
import './screens/settings_screen.dart';
import './screens/tabs_screen.dart';
import './screens/categories_screen.dart';
import './screens/category_meals_screen.dart';
import 'models/meal.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favouriteMeals = [];  

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if(_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }
        if(_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }
        if(_filters['vegan'] && !meal.isVegan) {
          return false;
        }
        if(_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }
        return true;

      }).toList();

    });
  }

  void _toggleFavourite(String mealId) {

    final existingIndex = _favouriteMeals.indexWhere((meal)=>meal.id == mealId);

    if(existingIndex >=0) {
      setState(() {
        _favouriteMeals.removeAt(existingIndex);
      });

    }
    else {
      setState(() {
        _favouriteMeals.add(DUMMY_MEALS.firstWhere((meal)=>meal.id == mealId));
      });
    }
  }

  bool _isMealFavourite(String id) {
    return _favouriteMeals.any((meal)=> meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FoodOnDuty',
      theme: ThemeData(
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
              body2: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              title: TextStyle(
                  fontFamily: 'RobotoCondensed',
                  fontWeight: FontWeight.bold,
                  fontSize: 25))),
      // home: CategoriesScreen(), \\ mentioned in routes //
      routes: {
        '/': (ctx) => TabsScreen(_favouriteMeals), // for home screen \\
        // '/category-meal': (ctx) => CategoryMeal(), (or) --> look below both are correct \\
        CategoryMeal.routeName: (ctx) => CategoryMeal(_availableMeals),
        MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(_toggleFavourite,_isMealFavourite),
        SettingsScreen.routeName: (ctx) => SettingsScreen(_filters,_setFilters),
      },
      // onGenerateRoute: (settings) {
      //   print(settings.arguments);
      //   return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      // },

      // FOR FALL BACK PURPOSE

      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (ctx) => CategoriesScreen());
      },
    );
  }
}

// class MyHomePage extends StatefulWidget {
//     @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('FoodOnDuty'),
//       ),
//       body: Center(
//         child: Text('Navigation Time!'),
//       ),
//     );
//   }
// }
