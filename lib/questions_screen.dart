import 'package:flutter/material.dart';

import 'models/quiz_questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  final quiz = const QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    [
      'Widgets',
      'Components',
      'Blocks',
      'Functions',
    ],
  );

  String? selectionOption;

  List<String>? shuffledOptions;

  @override
  void initState() {
    shuffledOptions = List.from(quiz.answers)..shuffle();
    super.initState();
  }

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(quiz.question),
          for (int i = 0; i < 4; i++)
            OutlinedButton(
              onPressed: () {
                selectionOption = shuffledOptions![i];
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.pink,
              ),
              child: Text(shuffledOptions![i]),
            ),
        ],
      ),
    );
  }
}
