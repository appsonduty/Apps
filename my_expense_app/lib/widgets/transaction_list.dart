import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.all(7),
            elevation: 5,
                      child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                    padding: EdgeInsets.all(10),
                    child: FittedBox(
                        child: Text('${transactions[index].spending}'))),
              ),
              title: Text(
                transactions[index].title,
                style: Theme.of(context).textTheme.title,
              ),
              subtitle: Text(DateFormat.yMMMMd().format(transactions[index].date),),
            ),
          );
        },
      ),
    );
  }
}
