import 'package:flutter/material.dart';
import 'package:what_lang/models/quiz_model.dart';

class QuizCard extends StatelessWidget {
  final Quiz inputQuiz;
  const QuizCard({required this.inputQuiz, super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0), // 상하좌우 16의 간격
        child: Container(
          width: 300.0,
          height: 300.0,
          decoration: BoxDecoration(
              color: Colors.yellow[200],
              border: Border.all(
                color: Colors.blue, // 테두리 색상
                width: 5.0, // 테두리 두께
              ),
              borderRadius: BorderRadius.circular(20)),
          child: Center(
              child: Text(
            inputQuiz.question,
            style: const TextStyle(
                fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
          )),
        ),
      ),
    );
  }
}
