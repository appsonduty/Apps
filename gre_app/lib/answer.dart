import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function questionState;
  final String option;
  Answer(this.questionState, this.option);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      child: RaisedButton(
        onPressed: questionState,
        color: Colors.purple[300],
        textColor: Colors.white,
        child: Text(
          option,
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
