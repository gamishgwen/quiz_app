import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/question_result.dart';

class ResultWidget extends StatelessWidget {
  const ResultWidget(
      {super.key, required this.selectedOptions, required this.restartQuiz});

  final List<String> selectedOptions;
  final VoidCallback restartQuiz;

  @override
  Widget build(BuildContext context) {
    var correctAnswersCount = 0;

    for (int i = 0; i < questions.length; i++) {
      if (selectedOptions[i] == questions[i].answers[0]) {
        correctAnswersCount++;
      }
    }
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
              'You answered $correctAnswersCount out of ${questions.length} questions correctly'),
          for (int i = 0; i < questions.length; i++)
            QuestionResult(
              question: questions[i].question,
              selectedOption: selectedOptions[i],
              correctOption: questions[i].answers[0],
            ),
          OutlinedButton.icon(
              onPressed: () {
                restartQuiz();
              },
              icon: Icon(Icons.restart_alt_rounded),
              label: Text('Restart'))
        ],
      ),
    );
  }
}
