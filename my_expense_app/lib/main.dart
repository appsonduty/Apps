import 'package:flutter/material.dart';
import 'package:my_expense_app/widgets/print.dart';
import './widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import './models/transaction.dart';
import './widgets/chart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Expense',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.cyan,
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(
                  fontFamily: 'OpenSans', fontWeight: FontWeight.bold, fontSize: 20)),
          fontFamily: 'OpenSans',
          appBarTheme: AppBarTheme(
              textTheme: ThemeData.light().textTheme.copyWith(
                  title: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: 20,
                      fontWeight: FontWeight.bold)))),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Transaction> _userTransaction = [];


  List<Transaction> get _recentTransaction {
    return _userTransaction.where((tx) {
      return tx.date.isAfter(DateTime.now().subtract(Duration(days: 7)),);
    }).toList();
  }
  void _addNewTransaction(String txTitle, double txAmount, DateTime datePicker) {
    final newTx = Transaction(
        id: DateTime.now().toString(),
        title: txTitle,
        spending: txAmount,
        date: datePicker);

    setState(() {
      _userTransaction.add(newTx);
    });
  }

  void _startNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (_) {
        return GestureDetector(
          child: NewTransaction(_addNewTransaction),
          onTap: () {},
          behavior: HitTestBehavior.opaque,
        );
      },
    );
  }

  void _deleteTransaction(String id) {
    setState(() {
      _userTransaction.removeWhere((deleteTx) {
        return deleteTx.id == id;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () => _startNewTransaction(context))
        ],
        title: Text("My Expense"),
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
           Chart(_recentTransaction),
            _userTransaction.length >= 1
                ? TransactionList(_userTransaction, _deleteTransaction)
                : PrintInfo(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () => _startNewTransaction(context),
          child: Icon(Icons.add)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
