import 'package:flutter/material.dart';
import 'constants.dart';

class Bottombutton extends StatelessWidget {

  Bottombutton({ @required this.calc ,@required this.ontap});


  final String calc;
  final Function ontap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        child: Center(
          child: Text(calc,
            style:TextStyle(

              fontSize: 31,
              fontWeight: FontWeight.w700,
              color: Colors.white,

            ) ,
          ),
        ),
        margin: EdgeInsets.all(10),
        height: Kbottomcontainerheight,
        decoration: BoxDecoration(
          color: Kbottomcontainercolour,
          borderRadius: BorderRadius.circular(10),
        ),

      ),
    );
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton( {@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),

    );
  }
}
