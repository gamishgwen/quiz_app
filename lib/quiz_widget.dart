import 'package:flutter/material.dart';
import 'package:quiz_app/models/quiz_questions.dart';

class QuizWidget extends StatefulWidget {
  const QuizWidget({super.key, required this.quiz, required this.onOptionPressed});

  final QuizQuestion quiz;
  final Function(String selectionOption) onOptionPressed;
  @override
  State<QuizWidget> createState() => _QuizWidgetState();
}

class _QuizWidgetState extends State<QuizWidget> {
  List<String>? shuffledAnswers;
  // String? selectedAnswer;

  @override
  void initState() {
    shuffledAnswers = List.from(widget.quiz.answers)..shuffle();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(widget.quiz.question),
        for (int i = 0; i < 4; i++)
          OutlinedButton(
            onPressed: () {
              widget.onOptionPressed(shuffledAnswers![i]);
            },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.pink,
            ),
            child: Text(shuffledAnswers![i]),
          ),
      ],
    );
  }
}
