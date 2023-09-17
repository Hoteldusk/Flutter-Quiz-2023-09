// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:quiz/main_page.dart';

class InsertQuiz extends StatefulWidget {
  const InsertQuiz({
    super.key,
    this.addData,
  });

  final addData;

  @override
  State<InsertQuiz> createState() => _InsertQuizState();
}

class _InsertQuizState extends State<InsertQuiz> {
  var localInputTitle = "";
  var localInputContent = "";
  var localInputCorrect = "";
  var localInputWrong1 = "";
  var localInputWrong2 = "";
  var localInputWrong3 = "";

  // 컨트롤러 정의
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final correctController = TextEditingController();
  final wrong1Controller = TextEditingController();
  final wrong2Controller = TextEditingController();
  final wrong3Controller = TextEditingController();

  @override
  void dispose() {
    // 컨트롤러 해제
    titleController.dispose();
    contentController.dispose();
    correctController.dispose();
    wrong1Controller.dispose();
    wrong2Controller.dispose();
    wrong3Controller.dispose();
    super.dispose();
  }

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
          icon: const Icon(Icons.home),
        )
      ]),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("퀴즈 등록"),
              TextField(
                controller: titleController, // 컨트롤러 설정
                onChanged: (text) {
                  localInputTitle = text;
                },
                decoration: const InputDecoration(hintText: "제목을 입력해주세요"),
              ),
              TextField(
                controller: contentController, // 컨트롤러 설정
                onChanged: (text) {
                  localInputContent = text;
                },
                maxLines: 12,
                decoration: const InputDecoration(hintText: "내용을 입력해주세요"),
              ),
              TextField(
                controller: correctController, // 컨트롤러 설정
                onChanged: (text) {
                  localInputCorrect = text;
                },
                decoration: const InputDecoration(hintText: "정답을 입력해주세요"),
              ),
              TextField(
                controller: wrong1Controller, // 컨트롤러 설정
                onChanged: (text) {
                  localInputWrong1 = text;
                },
                decoration: const InputDecoration(hintText: "오답을 입력해주세요"),
              ),
              TextField(
                controller: wrong2Controller, // 컨트롤러 설정
                onChanged: (text) {
                  localInputWrong2 = text;
                },
                decoration: const InputDecoration(hintText: "오답을 입력해주세요"),
              ),
              TextField(
                controller: wrong3Controller, // 컨트롤러 설정
                onChanged: (text) {
                  localInputWrong3 = text;
                },
                decoration: const InputDecoration(hintText: "오답을 입력해주세요"),
              ),
              ElevatedButton(
                onPressed: () {
                  widget.addData(
                    localInputTitle,
                    localInputContent,
                    localInputCorrect,
                    localInputWrong1,
                    localInputWrong2,
                    localInputWrong3,
                  );

                  // 버튼을 누를 때 컨트롤러로 입력된 내용을 지우기
                  titleController.clear();
                  contentController.clear();
                  correctController.clear();
                  wrong1Controller.clear();
                  wrong2Controller.clear();
                  wrong3Controller.clear();
                },
                child: const Text("등 록"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
