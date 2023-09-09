import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "내가 만드는 퀴즈",
          textAlign: TextAlign.justify,
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Column(
        children: [
          Container(),
        ],
      ),
    ));
  }
}
