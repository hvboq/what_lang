import 'package:flutter/material.dart';
import 'package:what_lang/models/quiz_model.dart';

class QuizListItem extends StatelessWidget {
  final Quiz inputQuiz;
  final int index;
  final Function onTap;
  final Function deleteItem;

  const QuizListItem(
      {Key? key,
      required this.inputQuiz,
      required this.index,
      required this.onTap,
      required this.deleteItem})
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
      onLongPress: () => {},
    );
  }

  Future<void> onLongPress(BuildContext context) {
    return showDialog(
        context: context,
        builder: ((context) {
          return AlertDialog(
              title: const Text('삭제 확인'),
              content: Text('${inputQuiz.question} 를 삭제하시겠습니까?'),
              actions: <Widget>[
                TextButton(
                  child: const Text('취소'),
                  onPressed: () => {Navigator.pop(context)},
                ),
                TextButton(
                    child: const Text('삭제'),
                    onPressed: () {
                      deleteItem(index);
                      Navigator.of(context).pop();
                    }),
              ]);
        }));
  }
}
