import 'package:flutter/material.dart';

// If you keep pushing on "ctrl" and click on some attribute, you can see the code source

class Question extends StatelessWidget {
  final String
      questionText; // "final" means that the initial value will never change after passing in the constr

  Question(
      this.questionText); // position argument (if we add {} --> name argument)

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10), //margin in all directions
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
