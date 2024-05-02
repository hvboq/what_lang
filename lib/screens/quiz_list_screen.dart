import 'package:flutter/material.dart';
import 'package:what_lang/models/quiz_model.dart';
import 'package:what_lang/widgets/quiz_list_item.dart';

class QuizListWidget extends StatefulWidget {
  const QuizListWidget({super.key});

  @override
  State<QuizListWidget> createState() => _QuizListWidgetState();
}

class _QuizListWidgetState extends State<QuizListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
      body: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index) {
            return QuizListItem(
              inputQuiz: Quiz(
                langCode: LangCode.en,
                quiz: "응애",
                answer: index.toString(),
              ),
            );
          }),
    );
  }
}
