import 'package:flutter/material.dart';

// TESTS
/*
class Person {


  String name;
  int age;

  Person(this.name, this.age);

}

double ajout(double num1,double num2){
  //print(num1 + num2);
  return num1 + num2;
}

void main(){
  var p1 = Person('Max', 30);
  var p2 = Person('Manu', 31);
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
  State<MyApp> createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  var questionIndex = 0;

  void answerQuestion() {
    setState(() {
      questionIndex = questionIndex + 1;
    });
    print(questionIndex);
  }

  @override // It already exists but we override with our own method --> To make the code more clear
  Widget build(BuildContext context) {
    var questions = [
      'x + 2 = 5 ?', // first element list = pos 0
      '2x - 5 = 1 ?',
    ];

    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('MixMath'),
          ),
          body: Column(
            children: [
              Text(questions[questionIndex]),
              RaisedButton(
                child: Text('x = 4'),
                onPressed:
                    answerQuestion, //execute the function and not the name of the result of thefunction ! no ()
              ),
              RaisedButton(
                child: Text('x = 3'),
                onPressed: () => print('Vous avez choisi la réponse 3'),
              ),
              RaisedButton(
                child: Text('x = 2'),
                onPressed: () {
                  // ...
                  print('Vous avez choisi la réponse 2');
                },
              ),
            ],
          )),
    );
  }
}
