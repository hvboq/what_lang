import 'package:flutter/material.dart';

class QuizWidget extends StatelessWidget {
  const QuizWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.info),
        onPressed: () {},
      ),
      body: const Center(
        child: Text("Quiz"),
      ),
    );
  }
}
