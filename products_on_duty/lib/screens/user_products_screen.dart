import 'package:flutter/material.dart';
import '../screens/edit_product_screen.dart';
import '../widgets/app_drawer.dart';
import '../widgets/user_product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = '/user-product';

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<ProductsProvider>(context, listen: false)
        .fetchAndSetProducts(true);
  }

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
      body: FutureBuilder(
          future: _refreshProducts(context),
          builder: (ctx, snapshotData) {
            // if (snapshotData.connectionState != ConnectionState.waiting) {
            //   print('waiting...');
            //   return Center(child: CircularProgressIndicator());
            // }
            print(snapshotData.data);

            print(snapshotData.connectionState);
            return RefreshIndicator(
              onRefresh: () => _refreshProducts(context),
              child: Consumer<ProductsProvider>(
                builder: (ctx, productsData, _) => Padding(
                  padding: EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemBuilder: (ctx, index) => Column(children: [
                      UserProductItem(
                          productData.items[index].title,
                          productData.items[index].imageUrl,
                          productData.items[index].id),
                      Divider(),
                    ]),
                    itemCount: productData.items.length,
                  ),
                ),
              ),
            );
          }),
      drawer: AppDrawer(),
    );
  }
}
