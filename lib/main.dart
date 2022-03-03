import 'package:flutter/material.dart';
import './question.dart';
import './answer.dart';

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
  int i = 0;

  void _answerQuestion() {
    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
  }

  @override // It already exists but we override with our own method --> To make the code more clear
  Widget build(BuildContext context) {
    var questions = [
      // creation of a MAP (key : value)
      {
        'questionText': 'x + 2 = 5 ?',
        'answers': [i, i+1, i+2, i-3]
        // first element list = pos 0
      },
     {
        'questionText': '2x - 5 = 1 ?',
        'answers': [ 4, 3, 1, 3]
      },
      {
        'questionText': '3 + x = 7 ?',
        'answers': [1, 2, 4, 3]
      },
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('MixMath'),
        ),
        body: Column(
          children: [
            Question(
              questions[_questionIndex]['questionText'] as String,
            ),
            ...(questions[_questionIndex]['answers'] as List<int>)  // "..."  take a list and pull all the values in that list out of them and add it in a surrounding as individual values
                .map((answer) {
              return Answer(_answerQuestion, answer);
            }).toList(),

            /*
            Answer(_answerQuestion),
            Answer(_answerQuestion),
            Answer(_answerQuestion),
             */

          ],
        ),
      ),
    );
  }
}
