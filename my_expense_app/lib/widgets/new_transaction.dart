import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void _onSubmit() {
    final checkTitle = titleController.text;
    final checkAmount = double.parse(amountController.text);

    if (checkTitle.isEmpty || checkAmount <= 0) {
      return;
    }
    widget.addNewTransaction(checkTitle, checkAmount);

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextField(
              decoration: InputDecoration(labelText: "Title"),
              controller: titleController,
              onSubmitted: (_) => _onSubmit(),
              // onChanged: (val) {
              //   title = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _onSubmit(),
              //   onChanged: (val) => amount = val,
            ),
            FlatButton(
                onPressed: _onSubmit,
                child: Text(
                  "Add",
                  style: TextStyle(color: Colors.blue),
                ))
          ],
        ),
      ),
    );
  }
}
