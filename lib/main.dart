import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';
import './quiz.dart';
import './result.dart';

// TESTS
/*
class Person {


  String name;
  int age;

  Person(this.name, this.age);

  Person.veryOld(this.name){
  age = 60;
}

double ajout(double num1,double num2){
  //print(num1 + num2);
  return num1 + num2;
}

void main(){
  var p1 = Person('Max', 30);
  var p2 = Person('Manu', 31);
  var p3 = Person.veryOld('Max');
  print(p3.name);
  print(p3.age);
  print(p1.name);
  print(p2.name);
  double firstResult;
  firstResult = ajout(4,6);
  print(firstResult + 1);
}

 */

// from scratch

void main() => runApp(MyApp()); // for functions who had only one argument

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() =>
      _MyAppState(); // put _ before teh name of the class means public class --> private class
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  final _questions = const [
    // creation of a MAP (key : value)
    {
      'questionText': 'x + 2 = 5 ?',
      'answers': [
        {'text': '3', 'score': 1},
        {'text': '2', 'score': 0},
        {'text': '4', 'score': 0},
        {'text': '1', 'score': 0}
      ]
      // first element list = pos 0
    },
    {
      'questionText': '2x - 5 = 1 ?',
      'answers': [
        {'text': '4', 'score': 0},
        {'text': '3', 'score': 1},
        {'text': '1', 'score': 0},
        {'text': '2', 'score': 0}
      ]
    },
    {
      'questionText': '3 + x = 7 ?',
      'answers': [
        {'text': '1', 'score': 0},
        {'text': '2', 'score': 0},
        {'text': '4', 'score': 1},
        {'text': '3', 'score': 0}
      ]
    },
  ];

  void _answerQuestion(int score) {
    _totalScore = _totalScore + score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    if (_questionIndex < _questions.length) {
      print("We have more questions !");
    } else {
      print("No more questions !");
    }
  }

  /*@override
  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

   */

  @override // It already exists but we override with our own method --> To make the code more clear
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('MixMath'),
      ),
      body: _questionIndex < _questions.length //if
          ? Quiz(
              answerQuestion: _answerQuestion,
              questionIndex: _questionIndex,
              questions: _questions)
          : Result(_totalScore, _resetQuiz),
    ));
  }
}
