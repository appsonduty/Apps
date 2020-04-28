import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import '../widgets/order_item.dart';
import 'package:provider/provider.dart';
import '../providers/orders.dart';

class OrdersScreen extends StatefulWidget {
  static const routeName = '/orders-screen';

  @override
  _OrdersScreenState createState() => _OrdersScreenState();
}

class _OrdersScreenState extends State<OrdersScreen> {
  // var _isLoading = false;
  @override
  void initState() {
    // _isLoading = true;

    // Provider.of<Orders>(context, listen: false).fetchAndSetOrder().then((_) {
    //   setState(() {
    //     _isLoading = false;
    //   });
    // });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final ordersData = Provider.of<Orders>(context);
    return Scaffold(
        appBar: AppBar(
          title: Text("Your Orders"),
        ),
        drawer: AppDrawer(),
        body: FutureBuilder(
          future:
              Provider.of<Orders>(context, listen: false).fetchAndSetOrder(),
          builder: (ctx, dataSanpShot) {
            if (dataSanpShot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              if (dataSanpShot.error == null) {
                return Consumer<Orders>(
                  builder: (ctx, orderData, child) => ListView.builder(
                    itemCount: orderData.orders.length,
                    itemBuilder: (ctx, index) =>
                        OrderItemWidget(orderData.orders[index]),
                  ),
                );
              } else {
                return Center(
                  child: Text("Error Occured"),
                );
              }
            }
          },
        ));
  }
}
