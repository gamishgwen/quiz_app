import 'package:flutter/material.dart';

class QuestionResult extends StatelessWidget {
  const QuestionResult(
      {super.key,
      required this.question,
      required this.selectedOption,
      required this.correctOption});
  final String question;
  final String selectedOption;
  final String correctOption;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          question,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        Text(
          selectedOption,
          style: TextStyle(
              color:
                  selectedOption == correctOption ? Colors.yellow : Colors.red,
              fontSize: 14),
        ),
        Text(
          correctOption,
          style: TextStyle(color: Colors.green, fontSize: 16),
        ),
      ],
    );
  }
}
