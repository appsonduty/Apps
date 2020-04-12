import 'package:flutter/material.dart';
import '../dummy_data.dart';

class MealDetailsScreen extends StatelessWidget {

  final Function toggleFavourite;
  final Function isFav;
  MealDetailsScreen(this.toggleFavourite, this.isFav);
  static const routeName = '/meal-detail';

  Widget buildSectionTitle(String titleText, BuildContext ctx) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        titleText,
        style: Theme.of(ctx).textTheme.title,
      ),
    );
  }

  Widget buildContainer({@required Widget child}) {
    return Container(
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(5)),
      height: 200,
      width: 370,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;

    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
    return Scaffold(
      appBar: AppBar(
        title: Text("${selectedMeal.title}"),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 300,
                width: double.infinity,
                child: Image.network(selectedMeal.imageUrl),
              ),
              buildSectionTitle('Ingredients', context),
              Container(
                padding: EdgeInsets.all(4),
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(5)),
                height: 200,
                width: 370,
                child: ListView.builder(
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              buildSectionTitle('Steps', context),
              buildContainer(
                  child: ListView.builder(
                      itemCount: selectedMeal.steps.length,
                      itemBuilder: (ctx, index) => Column(
                            children: <Widget>[
                              ListTile(
                                leading: CircleAvatar(
                                  child: Text("#${(index + 1)}"),
                                ),
                                title: Text("${selectedMeal.steps[index]}"),
                              ),
                              Divider(),
                            ],
                          )
                          )
                          )
            ],
          ),
        ),
        
      ),
      floatingActionButton: FloatingActionButton(onPressed:() =>toggleFavourite(mealId), child: Icon(isFav(mealId)  ? Icons.favorite_border:Icons.favorite),),
    );
  }
}
