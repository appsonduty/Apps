import 'package:flutter/material.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';
// import '../screens/product_detail_screen.dart';
import '../providers/product.dart';
import '../providers/cart.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String imageUrl;
  // final String title;
  // ProductItem({this.id, this.imageUrl, this.title});
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
            },
            child: Image.network(product.imageUrl, fit: BoxFit.cover)),
        footer: GridTileBar(
          leading: Consumer<Product>(
            builder: (ctx, product, _) => IconButton(
              icon: Icon(
                  product.isFavorite ? Icons.favorite : Icons.favorite_border,
                  color: Theme.of(context).iconTheme.color),
              onPressed: () {
                product.toggleFavoriteStatus();
              },
            ),
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart,
                color: Theme.of(context).iconTheme.color),
            onPressed: () {
              cart.addItem(product.id, product.title, product.price);
              Scaffold.of(context).hideCurrentSnackBar();
              Scaffold.of(context).showSnackBar(SnackBar(
                content: Text(
                  "Added Item to cart",
                ),
                duration: Duration(seconds: 2),
                action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      cart.removeItem(product.id);
                    }),
              ));
            },
          ),
          title: Text(
            product.title,
            textAlign: TextAlign.center,
          ),
          backgroundColor: Colors.black54,
        ),
      ),
    );
  }
}
