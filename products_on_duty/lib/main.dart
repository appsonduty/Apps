import 'package:flutter/material.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './providers/cart.dart';
import 'package:provider/provider.dart';
import './screens/product_detail_screen.dart';
import './screens/products_overview_screen.dart';
import './providers/products_provider.dart';
import './providers/orders.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: ProductsProvider(),
        ),
        ChangeNotifierProvider.value(value: Cart()),
        ChangeNotifierProvider.value(value: Orders())
      ],
      child: MaterialApp(
        title: 'MyShop',
        
        theme: ThemeData(
          iconTheme: IconThemeData(color: Colors.orangeAccent),
          primarySwatch: Colors.blue,
        ),
        home: ProductsOverviewScreen(),
        routes: {
          ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
          CartScreen.routeName : (ctx)=> CartScreen(),
          OrdersScreen.routeName : (ctx)=> OrdersScreen(),
        },
      ),
    );
  }
}
