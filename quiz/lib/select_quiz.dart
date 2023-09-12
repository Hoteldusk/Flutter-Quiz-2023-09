import 'package:flutter/material.dart';
import 'package:quiz/main_page.dart';

class SelectQuiz extends StatelessWidget {
  const SelectQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Container(
          padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                child: const Text(
                  "현재 등록된 문제수 : x",
                  style: TextStyle(fontSize: 30),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 150, 0, 0),
                child: const Text(
                  "몇문제를 풀까요?",
                  style: TextStyle(fontSize: 25),
                ),
              ),
              const TextField(),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 200, 0, 0),
                width: 350,
                height: 70,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainPage(),
                        ));
                  },
                  child: const Text(
                    "홈으로 돌아가기",
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
