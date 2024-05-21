import 'package:flutter/material.dart';
import 'package:what_lang/models/quiz_model.dart';
import 'package:what_lang/widgets/quiz_list_item.dart';

class QuizListWidget extends StatefulWidget {
  final List<Quiz>? quizList;
  const QuizListWidget({required this.quizList, super.key});

  @override
  State<QuizListWidget> createState() => _QuizListWidgetState();
}

class _QuizListWidgetState extends State<QuizListWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () => itemEvent(context, null),
      ),
      body: widget.quizList!.isEmpty
          ? const Center(
              child: Text("퀴즈가 없어용 만들어주세용"),
            )
          : ListView.builder(
              itemCount: widget.quizList!.length,
              itemBuilder: (context, index) {
                return QuizListItem(inputQuiz: widget.quizList![index]);
              }),
    );
  }

// 플로팅 액션 버튼 클릭 이벤트
  Future<void> itemEvent(BuildContext context, Quiz? originalQuiz) {
    // 플로팅 액션 버튼을 이용하여 항목을 추가할 제목과 내용
    final TextEditingController questionController = TextEditingController();
    final TextEditingController answerController = TextEditingController();
    late LangCode langCode;

    //원본 퀴즈가 있는 경우
    questionController.text = originalQuiz == null ? "" : originalQuiz.question;
    answerController.text = originalQuiz == null ? "" : originalQuiz.answer;
    langCode = originalQuiz == null ? LangCode.en : originalQuiz.langCode;

    // 다이얼로그 폼 열기
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setDialogState) {
            return AlertDialog(
              title: const Text('퀴즈 추가하기'),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  TextField(
                    controller: questionController,
                    decoration: const InputDecoration(
                      labelText: '퀴즈',
                    ),
                  ),
                  TextField(
                    controller: answerController,
                    decoration: const InputDecoration(
                      labelText: '정답',
                    ),
                  ),
                  DropdownButton<LangCode>(
                    value: langCode,
                    onChanged: (value) =>
                        setDialogState(() => langCode = value!),
                    items: LangCode.values
                        .map((e) => DropdownMenuItem<LangCode>(
                            value: e, child: Text(e.displayName)))
                        .toList(),
                  )
                ],
              ),
              actions: <Widget>[
                TextButton(
                  child: const Text('취소'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                TextButton(
                  child: const Text('추가'),
                  onPressed: () {
                    setState(() => widget.quizList!.add(Quiz(
                        langCode: langCode,
                        question: questionController.text,
                        answer: answerController.text)));
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
