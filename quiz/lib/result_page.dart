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
      appBar: AppBar(
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: const Text("모두의 퀴즈"),
          flexibleSpace: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.topRight,
                  colors: [
                    Color.fromARGB(192, 135, 213, 255),
                    Color.fromARGB(255, 242, 252, 254)
                  ]),
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const MainPage(),
                  ),
                );
              },
              icon: const Icon(Icons.home),
              color: Colors.blue,
            )
          ]),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.topRight,
              colors: [
                Color.fromARGB(100, 28, 146, 210),
                Color.fromARGB(100, 242, 252, 254)
              ]),
        ),
        child: Center(
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
              Container(
                margin: const EdgeInsets.fromLTRB(0, 120, 0, 0),
                height: 70,
                width: 200,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MainPage(),
                      ),
                    );
                  },
                  child: const Text(
                    "확 인",
                    style: TextStyle(fontSize: 25),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
