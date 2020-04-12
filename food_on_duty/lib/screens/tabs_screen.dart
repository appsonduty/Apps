import 'package:flutter/material.dart';
import '../models/meal.dart';
import '../screens/favourites_screen.dart';
import '../widgets/main_drawer.dart';
import '../screens/categories_screen.dart';



class TabsScreen extends StatefulWidget {
  final List<Meal> favouriteMeals;

  TabsScreen(this.favouriteMeals);
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    
    _pages = [{"page":CategoriesScreen() , "title": "Categories"},
  {"page":FavouritesScreen(widget.favouriteMeals) , "title": "Favourites"}];
    super.initState();
  }

  // @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(length: 2, initialIndex: 0,child: Scaffold(
//       appBar: AppBar(title: Text('Meals'), bottom: TabBar(tabs:
//       <Widget>[
//         Tab(icon: Icon(Icons.category),
//         text: 'Categories',),
//         Tab(icon: Icon(Icons.favorite),
//         text: 'Favourites',)
//       ]
//       ),
//       ),
//       body: TabBarView(children: [CategoriesScreen(), FavouritesScreen()]),
//     ));
//   }
// }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: Drawer(),
      drawer: MainDrawer(),
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]["title"]),
        
      ),
      body: _pages[_selectedPageIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        backgroundColor: Theme.of(context).primaryColor,
        currentIndex: _selectedPageIndex,
        type: BottomNavigationBarType.shifting,
        items: [
          BottomNavigationBarItem(
              backgroundColor: Theme.of(context).primaryColor,
              icon: Icon(Icons.category),
              title: Text("Categories")),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite),
              title: Text("Favourite"),
              backgroundColor: Theme.of(context).primaryColor),
        ],
      ),
    );
  }
}
