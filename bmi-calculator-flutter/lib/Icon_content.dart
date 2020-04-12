import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'constants.dart';



class Childclass extends StatelessWidget {
  Childclass({@required this.childcolour, this.label});
  final IconData childcolour;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          childcolour,
          size: 80.0,
        ),
        SizedBox(height: 15.0),
        Text(
          label,
          style: Klabelstyle,
        )
      ],
    );
  }
}
