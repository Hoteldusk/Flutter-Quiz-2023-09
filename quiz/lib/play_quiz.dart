import 'package:flutter/material.dart';
import 'package:quiz/main_page.dart';

class PlayQuiz extends StatefulWidget {
  const PlayQuiz({super.key});

  @override
  State<PlayQuiz> createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
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
    );
  }
}
