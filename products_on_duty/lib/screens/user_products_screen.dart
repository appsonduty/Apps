import 'package:flutter/material.dart';
import 'package:products_on_duty/screens/edit_product_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-product';
  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Your Products"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(EditProductScreen.routeName);
              })
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: ListView.builder(
          itemBuilder: (ctx, index) => Column(children: [
            UserProductItem(productData.items[index].title,
                productData.items[index].imageUrl,
                productData.items[index].id),
            Divider(),
          ]),
          itemCount: productData.items.length,
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}