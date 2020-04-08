import 'dart:math';

class Bmifinder {

  Bmifinder({ this.height,this.weight });

  final int height;
  final int weight;
  double _bmi;

  String finalBmi () {
     _bmi = weight / pow(height/100,2);
    return _bmi.toStringAsFixed(1);
  }


  String Status ( ) {
    if(_bmi>=25) {
      return ' OverWeight';
    } else if (_bmi > 18.5) {
      return 'Normal';
    } else  {
      return 'Underweight';
    }
  }




  String getResult () {
     if(_bmi>=25) {
       return ' Time to Start exercise';
     } else if (_bmi > 18.5) {
       return 'You have a normal weight. Stay fit';
     } else  {
       return 'You have low body weight. Eat some';
     }
  }

}