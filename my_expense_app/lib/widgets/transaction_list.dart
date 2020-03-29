import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTransaction;
  TransactionList(this.transactions,this.deleteTransaction);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (ctx, index) {
          return Card(
            margin: EdgeInsets.all(7),
            elevation: 5,
            child: ListTile(
              trailing: IconButton(icon: Icon(Icons.delete), 
              color: Theme.of(context).errorColor,
              onPressed: () =>deleteTransaction(transactions[index].id)),
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
              subtitle: Text(
                DateFormat.yMMMMd().format(transactions[index].date),
              ),
            ),
          );
        },
      ),
    );
  }
}
