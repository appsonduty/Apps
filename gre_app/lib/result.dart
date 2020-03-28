import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final double score;
  final Function resetHandler;
  Result(this.score, this.resetHandler);

  String get resultPhrase {
    return (score * 100).toString() + "%";
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      widthFactor: double.infinity,
      // heightFactor: double.infinity,
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Text(
              resultPhrase,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
            ),
            color: Colors.greenAccent,
          ),
          FlatButton(onPressed: resetHandler, child: Text("Reset !!"))
        ],
      ),
    );
  }
}
