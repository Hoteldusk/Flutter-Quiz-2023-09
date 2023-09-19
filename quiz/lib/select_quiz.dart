// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quiz/main_page.dart';
import 'package:quiz/play_quiz.dart';

class SelectQuiz extends StatefulWidget {
  const SelectQuiz({
    super.key,
    this.listSize,
    this.quizList,
  });

  final listSize;
  final quizList;

  @override
  State<SelectQuiz> createState() => _SelectQuizState();
}

class _SelectQuizState extends State<SelectQuiz> {
  int inputData = 0;

  List<int> defaultQuizIndexList = [];
  List<int> fillterQuizIndexList = [];
  List<Map<String, String>> fillterQuizList = [];

  final FocusNode _focusNode = FocusNode();

  // 인덱스 배열 생성(성공)
  initDefaultIndexList() {
    for (int i = 0; i < widget.listSize; i++) {
      defaultQuizIndexList.add(i);
      // print("initDefaultIndex 저장중 : ${defaultQuizIndexList[i]}");
    }
  }

  // 필터링 인덱스 배열 생성(성공)
  initFillterIndexList(count) {
    defaultQuizIndexList.shuffle();

    for (var i = 0; i < count; i++) {
      fillterQuizIndexList.add(defaultQuizIndexList.indexOf(i));
      print("initFillterIndex 저장중 : ${fillterQuizIndexList[i]}");
    }

    // test 코드
    // for (var number in fillterQuizIndexList) {
    //   print("fillterQuizIndexList : $number");
    // }
    // print("랜덤인덱스 사이즈 : ${fillterQuizIndexList.length}");
    // print("값 : ${fillterQuizIndexList[0]}");
  }

  // 필터링 퀴즈 리스트
  initFillterQuizList(count) {
    for (var i = 0; i < count; i++) {
      var randomIndex = fillterQuizIndexList[i];
      // print("랜덤 인덱스 : $randomIndex");
      var title = widget.quizList[randomIndex]["title"];
      // print("quizList : ${widget.quizList[randomIndex]["title"]}");
      var content = widget.quizList[randomIndex]["content"];
      var correct = widget.quizList[randomIndex]["correct"];
      var wrong1 = widget.quizList[randomIndex]["wrong1"];
      var wrong2 = widget.quizList[randomIndex]["wrong2"];
      var wrong3 = widget.quizList[randomIndex]["wrong3"];
      // print("필터리스트 저장중");
      fillterQuizList.add({
        "title": title,
        "content": content,
        "correct": correct,
        "wrong1": wrong1,
        "wrong2": wrong2,
        "wrong3": wrong3,
      });
    }
    for (var map in fillterQuizList) {
      print(map["title"]);
    }
  }

  @override
  void initState() {
    super.initState();
    initDefaultIndexList();
  }

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
              onPressed: () async {
                if (_focusNode.hasFocus) {
                  _focusNode.unfocus();
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
          child: Container(
            padding: const EdgeInsets.fromLTRB(40, 0, 40, 0),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                    child: Text(
                      "등록된 문제수 : ${widget.listSize}",
                      style: const TextStyle(fontSize: 30),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                    child: const Text(
                      "몇문제를 풀까요?",
                      style: TextStyle(fontSize: 25),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(150, 0, 150, 0),
                    child: TextField(
                      onChanged: (text) {
                        try {
                          inputData = int.parse(text);
                        } catch (e) {
                          print("입력오류 : $e");
                        }
                      },
                      textAlign: TextAlign.center,
                      focusNode: _focusNode,
                    ),
                  ),
                  Container(
                    width: 200,
                    height: 70,
                    margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
                    child: TextButton(
                      onPressed: () async {
                        if (widget.listSize < inputData || inputData == 0) {
                          _focusNode.unfocus();
                          inputData = 0;
                          return;
                        }

                        await initFillterIndexList(inputData);
                        await initFillterQuizList(inputData);

                        _focusNode.unfocus();
                        await Future.delayed(const Duration(milliseconds: 500));

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PlayQuiz(
                              playQuizList: fillterQuizList,
                            ),
                          ),
                        );
                      },
                      child: const Text(
                        "문제 풀기",
                        style: TextStyle(fontSize: 30),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
