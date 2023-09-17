import 'package:flutter/material.dart';
import 'package:quiz/main_page.dart';

class SelectQuiz extends StatefulWidget {
  const SelectQuiz({
    super.key,
    this.listSize,
  });

  // ignore: prefer_typing_uninitialized_variables
  final listSize;

  @override
  State<SelectQuiz> createState() => _SelectQuizState();
}

class _SelectQuizState extends State<SelectQuiz> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      appBar: AppBar(actions: [
        IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MainPage(),
                ),
              );
            },
            icon: const Icon(Icons.home))
      ]),
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                  child: Text(
                    "등록된 문제수 : ${widget.listSize}",
                    style: const TextStyle(fontSize: 30),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                  child: const Text(
                    "몇문제를 풀까요?",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
                  child: const TextField(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
