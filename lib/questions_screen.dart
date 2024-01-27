import 'package:flutter/material.dart';
import 'package:quiz_app/quiz_widget.dart';
import 'package:quiz_app/result.dart';

import 'data/questions.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  int currentQuestionIndex = 0;
  List<String> userSelectedOptions = [];

  void onOptionPressed(String selectedOption) {
    userSelectedOptions.add(selectedOption);
    if (currentQuestionIndex != questions.length) {
      setState(() {
        currentQuestionIndex++;
      });
    }
    print(userSelectedOptions);
  }

  void restart() {
    setState(() {
      currentQuestionIndex = 0;
    });
  }

  @override
  Widget build(context) {
    return Center(
      child: currentQuestionIndex == questions.length
          ? ResultWidget(
              selectedOptions: userSelectedOptions,
              restartQuiz: () {
                restart();
              },
            )
          : QuizWidget(
              key: ValueKey(questions[currentQuestionIndex].question),
              onOptionPressed: onOptionPressed,
              quiz: questions[currentQuestionIndex],
            ),
    );
  }
}
