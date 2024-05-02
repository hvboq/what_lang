import 'package:flutter/material.dart';
import 'package:what_lang/models/quiz_model.dart';

class QuizListItem extends StatelessWidget {
  final Quiz inputQuiz;

  const QuizListItem({Key? key, required this.inputQuiz}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: const Icon(Icons.flag), //추후 국기로 수정
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              inputQuiz.quiz,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
            Text(
              inputQuiz.answer,
              style: const TextStyle(color: Colors.grey),
            )
          ],
        ));
  }
}
