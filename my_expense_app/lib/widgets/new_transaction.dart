import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addNewTransaction;
  // final Function deleteTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final _titleController = TextEditingController();

  final _amountController = TextEditingController();
  DateTime _selectDate;
  void _onSubmit() {
    final checkTitle = _titleController.text;
    final checkAmount = double.parse(_amountController.text);
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
      initialDatePickerMode: DatePickerMode.day,
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
      setState(() {
        _selectDate = pickedDate;
      });
    });

    if (checkTitle.isEmpty || checkAmount <= 0 || _selectDate == null) {
      return;
    }
    
    widget.addNewTransaction(checkTitle, checkAmount, _selectDate);

    Navigator.of(context).pop();
  }

  // void _datePicker() {
  //   //  var date = DatePickerDateTimeOrder.date_dayPeriod_time;
  //   //  showTimePicker(context: ctx, initialTime: TimeOfDay.now());
    
  // }

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
              controller: _titleController,
              onSubmitted: (_) => _onSubmit(),
              // onChanged: (val) {
              //   title = val;
              // },
            ),
            TextField(
              decoration: InputDecoration(labelText: "Amount"),
              controller: _amountController,
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _onSubmit(),
              //   onChanged: (val) => amount = val,
            ),
            Container(
              height: 70,
              child: Row(
                children: <Widget>[
                  Expanded(
                      // flex: 1,
                      child: Text(_selectDate == null
                          ? 'No date chosen'
                          : 'Picked Date:${DateFormat.yMd().format(_selectDate)}')),
                  FlatButton(
                    onPressed: () => _onSubmit(),
                    child: Text(
                      'Choose date',
                    ),
                    textColor: Theme.of(context).primaryColor,
                  )
                ],
              ),
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
