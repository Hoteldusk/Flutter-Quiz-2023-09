// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:quiz/main_page.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    this.quizValue,
    this.updateData,
  });

  final quizValue;
  final updateData;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // 컨트롤러 선언
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController correctController = TextEditingController();
  TextEditingController wrong1Controller = TextEditingController();
  TextEditingController wrong2Controller = TextEditingController();
  TextEditingController wrong3Controller = TextEditingController();

  // 변수 선언
  var localInputTitle = "";
  var localInputContent = "";
  var localInputCorrect = "";
  var localInputWrong1 = "";
  var localInputWrong2 = "";
  var localInputWrong3 = "";

  @override
  void initState() {
    super.initState();

    titleController = TextEditingController(text: widget.quizValue['title']);
    contentController =
        TextEditingController(text: widget.quizValue['content']);
    correctController =
        TextEditingController(text: widget.quizValue['correct']);
    wrong1Controller = TextEditingController(text: widget.quizValue['wrong1']);
    wrong2Controller = TextEditingController(text: widget.quizValue['wrong2']);
    wrong3Controller = TextEditingController(text: widget.quizValue['wrong3']);

    localInputTitle = widget.quizValue['title'];
    localInputContent = widget.quizValue['content'];
    localInputCorrect = widget.quizValue['correct'];
    localInputWrong1 = widget.quizValue['wrong1'];
    localInputWrong2 = widget.quizValue['wrong2'];
    localInputWrong3 = widget.quizValue['wrong3'];
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
            icon: const Icon(Icons.home))
      ]),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text("퀴즈 수정 및 삭제"),
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
                onPressed: () async {
                  var id = widget.quizValue.id;
                  await widget.updateData(
                    id,
                    localInputTitle,
                    localInputContent,
                    localInputCorrect,
                    localInputWrong1,
                    localInputWrong2,
                    localInputWrong3,
                  );
                },
                child: const Text("수 정"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
