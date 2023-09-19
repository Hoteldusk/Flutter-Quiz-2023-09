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
    this.deleteData,
  });

  final quizList;
  final listSize;
  final updateData;
  final result;
  final getData;
  final deleteData;

  @override
  State<ManageQuiz> createState() => _ManageQuizState();
}

class _ManageQuizState extends State<ManageQuiz> {
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
      // child: Text(widget.quizList[1]['title']),
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
        child: ListView.builder(
          itemCount: widget.listSize,
          itemBuilder: (c, i) {
            return ListTile(
              leading: const Icon(Icons.remove),
              title: Text(
                widget.quizList[i]["title"],
                style: const TextStyle(fontSize: 19),
              ),
              trailing: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailPage(
                          // listSize: result.size,
                          quizValue: widget.quizList[i],
                          updateData: widget.updateData,
                          deleteData: widget.deleteData,

                          // redirect
                          result: widget.result,
                          quizList: widget.result.docs,
                          listSize: widget.result.size,
                          getData: widget.getData,
                        ),
                      ));
                },
                icon: const Icon(Icons.zoom_in),
              ),
            );
          },
        ),
      ),
    );
  }
}
