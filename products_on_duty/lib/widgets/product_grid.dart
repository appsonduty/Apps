import 'package:flutter/material.dart';

import '../widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductGrid extends StatelessWidget {

  final bool showFavoritesOnly;
  ProductGrid(this.showFavoritesOnly);
  @override
  Widget build(BuildContext context) {

    final productData = Provider.of<ProductsProvider>(context, listen: true);
    final products = showFavoritesOnly ? productData.favoriteItems : productData.items;

    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10.0),
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
        value: products[index],
        child: ProductItem(
            // id: products[index].id,
            // imageUrl: products[index].imageUrl,
            // title: products[index].title,
            ),
      ),
      itemCount: products.length,
      padding: const EdgeInsets.all(10.0),
    );
  }
}
