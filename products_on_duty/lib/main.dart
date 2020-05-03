import 'package:flutter/material.dart';
import './screens/splash_screen.dart';
import './screens/products_overview_screen.dart';
import './screens/auth_screen.dart.dart';
import './screens/edit_product_screen.dart';
import './screens/user_products_screen.dart';
import './screens/cart_screen.dart';
import './screens/orders_screen.dart';
import './providers/cart.dart';
import 'package:provider/provider.dart';
import './screens/product_detail_screen.dart';
// import './screens/products_overview_screen.dart';
import './providers/products_provider.dart';
import './providers/orders.dart';
import './providers/auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider.value(value: Auth()),
          ChangeNotifierProxyProvider<Auth, ProductsProvider>(
            update: (ctx, auth, previousProducts) => previousProducts
              ..update(auth.token, auth.userId,
                  previousProducts == null ? [] : previousProducts.items),
            create: (context) => ProductsProvider(),
          ),
          ChangeNotifierProvider.value(value: Cart()),
          // ChangeNotifierProvider.value(value: Orders()),
          // ChangeNotifierProxyProvider<Auth, Cart>(create: null, update: (_, auth, cartProducts) =>)
          ChangeNotifierProxyProvider<Auth, Orders>(
            create: (context) => Orders(),
            update: (ctx, auth, previousOrder) => previousOrder
              ..update(auth.token, auth.userId,
                  previousOrder == null ? [] : previousOrder.orders),
          ),
        ],
        child: Consumer<Auth>(
          builder: (ctx, auth, _) => MaterialApp(
            title: 'MyShop',
            theme: ThemeData(
              iconTheme: IconThemeData(color: Colors.orangeAccent),
              primarySwatch: Colors.blue,
            ),
            home: auth.isAuth
                ? ProductsOverviewScreen()
                : FutureBuilder(
                    builder: (ctx, authResultSnapShot) =>
                        authResultSnapShot.connectionState ==
                                ConnectionState.waiting
                            ? SplashScreen()
                            : AuthScreen(),
                    future: auth.tryAutoLogin(),
                  ),
            routes: {
              ProductDetailScreen.routeName: (ctx) => ProductDetailScreen(),
              CartScreen.routeName: (ctx) => CartScreen(),
              OrdersScreen.routeName: (ctx) => OrdersScreen(),
              UserProductsScreen.routeName: (ctx) => UserProductsScreen(),
              EditProductScreen.routeName: (ctx) => EditProductScreen(),
            },
          ),
        ));
  }
}
