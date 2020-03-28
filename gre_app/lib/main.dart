import 'package:flutter/material.dart';
import './quiz.dart';
import './result.dart';

void main() => runApp(GreApp());

class GreApp extends StatefulWidget {
  @override
  _GreAppState createState() => _GreAppState();
}

class _GreAppState extends State<GreApp> {
  var _questionIndex = 0;
  var _totalScore = 0;
  final _questionAndAnswers = const [
    {
      "questionText": 'Amply',
      "answerText": [
        {'text': 'ably', 'score': 1},
        {'text': 'fully', 'score': 0}
      ]
    },
    {
      "questionText": 'Unassailable',
      "answerText": [
        {'text': 'immune to attack', 'score': 1},
        {'text': 'not good', 'score': 0},
        {'text': 'lazy', 'score': 0}
      ]
    }
  ];

  void _resetQuestions() {
    setState(() {
    _questionIndex = 0;
    _totalScore = 0;
      
    });
    print("App Restarted !!!");

  }

  void _answerQuestion(int score) {
    _totalScore += score;
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        themeMode: ThemeMode.system,
        home: Scaffold(
          appBar: AppBar(
            title: Text("GRE APP"),
            centerTitle: true,
            backgroundColor: Colors.indigoAccent,
          ),
          body: _questionIndex < _questionAndAnswers.length
              ? Quiz(
                  questionAndAnswers: _questionAndAnswers,
                  answerQuestion: _answerQuestion,
                  questionIndex: _questionIndex)
              : Result((_totalScore/_questionAndAnswers.length), _resetQuestions),
        ));
  }
}
