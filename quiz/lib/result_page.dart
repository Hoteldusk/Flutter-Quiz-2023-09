// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:quiz/main_page.dart';

class ResultPage extends StatefulWidget {
  const ResultPage({
    super.key,
    this.correctCount,
    this.wrongCount,
  });

  final correctCount;
  final wrongCount;

  @override
  State<ResultPage> createState() => _ResultPageState();
}

class _ResultPageState extends State<ResultPage> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "맞은 개수 : ${widget.correctCount}",
              style: const TextStyle(fontSize: 30),
            ),
            Text(
              "틀린 개수 : ${widget.wrongCount}",
              style: const TextStyle(fontSize: 30),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ),
                );
              },
              child: const Text("확 인"),
            )
          ],
        ),
      ),
    );
  }
}
