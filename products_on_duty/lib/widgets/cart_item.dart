import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final String productId;
  final double price;
  final int quantity;
  final String title;

  CartItem(
      {@required this.id,
      @required this.price,
      @required this.quantity,
      @required this.title,
      @required this.productId});
  @override
  Widget build(BuildContext context) {
    Provider.of<Cart>(context);
    return Dismissible(
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) => AlertDialog(
                  title: Text("Are you sure ?"),
                  content: Text("Do you wan to remove item from cart ?"),
                  actions: <Widget>[
                    FlatButton(onPressed: () {
                      Navigator.of(ctx).pop(false);
                    }, child: Text('No')),
                    FlatButton(onPressed: () {
                      Navigator.of(ctx).pop(true);
                    }, child: Text('Yes')),
                  ],
                ));
      },
      key: ValueKey(id),
      background: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).errorColor),
        child: Icon(
          Icons.delete,
          color: Colors.white,
          size: 40,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
      ),
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        Provider.of<Cart>(context, listen: false).removeItem(productId);
      },
      child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListTile(
            leading: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(2.0),
                child: FittedBox(child: Text("\$$price")),
              ),
            ),
            title: Text(title),
            subtitle: Text("Total: \$${(price * quantity)}"),
            trailing: Text("$quantity x"),
          ),
        ),
      ),
    );
  }
}
