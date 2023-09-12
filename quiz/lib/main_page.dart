import 'package:flutter/material.dart';
import 'package:quiz/manage_quiz.dart';
import 'package:quiz/select_quiz.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: const Text(
                "모두의 퀴즈",
                style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              width: 350,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SelectQuiz(),
                      ));
                },
                child: const Text(
                  "퀴즈 풀기",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              width: 350,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const ManageQuiz(),
                      ));
                },
                child: const Text(
                  "퀴즈 확인",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
