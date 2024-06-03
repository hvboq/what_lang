import 'package:flutter/material.dart';
import 'package:what_lang/models/quiz_model.dart';
import 'package:what_lang/widgets/quiz_card.dart';

class QuizWidget extends StatelessWidget {
  int index = 0;
  final List<Quiz> quizList;
  QuizWidget({required this.quizList, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.info),
        onPressed: () {},
      ),
      body: quizList.isEmpty
          ? const Text('퀴즈가 없어용')
          : QuizCard(
              inputQuiz: quizList[index],
            ),
    );
  }
}
