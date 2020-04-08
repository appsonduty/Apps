import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/resuable_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'input_page.dart';
import 'Button.dart';

class ResultsPage extends StatelessWidget {

  ResultsPage({ @required this.bmiend1, @required this.bmiend2,@required this.bmiend3});

  final String bmiend1;
  final String bmiend2;
  final String bmiend3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('BMI CALCULATOR'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Text(
                  'Your Result',
                  style: KTilteTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Reusable(
                colour: Kcontainercolour,
                cardchild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      bmiend2,
                      style: KResultTextStyle,
                    ),
                    Text(
                      bmiend1,
                      style: KBmiTextStyle,
                    ),
                    Text(
                      bmiend3,
                      style: KBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            Bottombutton(
              calc: 'RECALCULATE',
              ontap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => InputPage(),
                  ),
                );
              },
            ),
          ],
        ));
  }
}
