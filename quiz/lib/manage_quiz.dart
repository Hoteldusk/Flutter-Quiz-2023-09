// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:quiz/detail_page.dart';
import 'package:quiz/main_page.dart';

class ManageQuiz extends StatefulWidget {
  const ManageQuiz({
    super.key,
    this.quizList,
    this.listSize,
    this.updateData,
    this.result,
    this.getData,
  });

  final quizList;
  final listSize;
  final updateData;
  final result;
  final getData;

  @override
  State<ManageQuiz> createState() => _ManageQuizState();
}

class _ManageQuizState extends State<ManageQuiz> {
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
      // child: Text(widget.quizList[1]['title']),
      body: ListView.builder(
        itemCount: widget.listSize,
        itemBuilder: (c, i) {
          return ListTile(
            leading: const Icon(Icons.drag_indicator_sharp),
            title: Text(
              widget.quizList[i]["title"],
              style: const TextStyle(fontSize: 20),
            ),
            trailing: ElevatedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailPage(
                        // listSize: result.size,
                        quizValue: widget.quizList[i],
                        updateData: widget.updateData,

                        // redirect
                        result: widget.result,
                        quizList: widget.result.docs,
                        listSize: widget.result.size,
                        getData: widget.getData,
                      ),
                    ));
              },
              child: const Text("자세히"),
            ),
          );
        },
      ),
    );
  }
}
