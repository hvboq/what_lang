import 'package:flutter/material.dart';
import 'package:what_lang/models/quiz_model.dart';

class QuizListItem extends StatelessWidget {
  final Quiz inputQuiz;
  final int index;
  final Function onTap;

  const QuizListItem(
      {Key? key,
      required this.inputQuiz,
      required this.index,
      required this.onTap})
      : super(key: key);

  //정렬 한번 더 고민해볼 것

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: const Icon(Icons.flag), //추후 국기로 수정
      title: Text(
        inputQuiz.question,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        inputQuiz.answer,
        style: const TextStyle(color: Colors.grey),
      ),
      onTap: () => {onTap(context, inputQuiz, index)},
    );
  }
}
