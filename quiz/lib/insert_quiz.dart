// ignore_for_file: prefer_typing_uninitialized_variables, use_build_context_synchronously

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

  final _focusNodeTitle = FocusNode();
  final _focusNodeContent = FocusNode();
  final _focusNodeCorrect = FocusNode();
  final _focusNodeWrong1 = FocusNode();
  final _focusNodeWrong2 = FocusNode();
  final _focusNodeWrong3 = FocusNode();

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
          onPressed: () async {
            if (_focusNodeTitle.hasFocus ||
                _focusNodeContent.hasFocus ||
                _focusNodeCorrect.hasFocus ||
                _focusNodeWrong1.hasFocus ||
                _focusNodeWrong2.hasFocus ||
                _focusNodeWrong3.hasFocus) {
              _focusNodeTitle.unfocus();
              _focusNodeContent.unfocus();
              _focusNodeCorrect.unfocus();
              _focusNodeWrong1.unfocus();
              _focusNodeWrong2.unfocus();
              _focusNodeWrong3.unfocus();
              await Future.delayed(const Duration(milliseconds: 500));
            }

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
          child: Container(
            margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                TextField(
                  focusNode: _focusNodeTitle,
                  controller: titleController, // 컨트롤러 설정
                  onChanged: (text) {
                    localInputTitle = text;
                  },
                  decoration: const InputDecoration(hintText: "제목을 입력해주세요"),
                ),
                TextField(
                  focusNode: _focusNodeContent,
                  controller: contentController, // 컨트롤러 설정
                  onChanged: (text) {
                    localInputContent = text;
                  },
                  maxLines: 12,
                  decoration: const InputDecoration(hintText: "내용을 입력해주세요"),
                ),
                TextField(
                  focusNode: _focusNodeCorrect,
                  controller: correctController, // 컨트롤러 설정
                  onChanged: (text) {
                    localInputCorrect = text;
                  },
                  decoration: const InputDecoration(hintText: "정답을 입력해주세요"),
                ),
                TextField(
                  focusNode: _focusNodeWrong1,
                  controller: wrong1Controller, // 컨트롤러 설정
                  onChanged: (text) {
                    localInputWrong1 = text;
                  },
                  decoration: const InputDecoration(hintText: "오답을 입력해주세요"),
                ),
                TextField(
                  focusNode: _focusNodeWrong2,
                  controller: wrong2Controller, // 컨트롤러 설정
                  onChanged: (text) {
                    localInputWrong2 = text;
                  },
                  decoration: const InputDecoration(hintText: "오답을 입력해주세요"),
                ),
                TextField(
                  focusNode: _focusNodeWrong3,
                  controller: wrong3Controller, // 컨트롤러 설정
                  onChanged: (text) {
                    localInputWrong3 = text;
                  },
                  decoration: const InputDecoration(hintText: "오답을 입력해주세요"),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                  height: 50,
                  width: 200,
                  child: ElevatedButton(
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
                    child: const Text(
                      "등 록",
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
