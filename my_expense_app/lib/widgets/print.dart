import 'package:flutter/material.dart';

class PrintInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      // child: Text("No Items present", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),),
      child: Image.asset('assets/images/waiting.png', fit: BoxFit.cover,),
      
    );
  }
}