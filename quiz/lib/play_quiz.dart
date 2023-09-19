// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:quiz/main_page.dart';
import 'package:quiz/result_page.dart';

class PlayQuiz extends StatefulWidget {
  const PlayQuiz({
    super.key,
    this.playQuizList,
  });

  final playQuizList;

  @override
  State<PlayQuiz> createState() => _PlayQuizState();
}

class _PlayQuizState extends State<PlayQuiz> {
  var localList;
  var selectValueList = [];
  var correctCount = 0;
  var wrongCount = 0;
  double progressValue = 0.0;
  var listLength = 0;

  selectValueListShuffle() {
    try {
      selectValueList.clear();
      selectValueList.add(localList[0]["correct"]);
      selectValueList.add(localList[0]["wrong1"]);
      selectValueList.add(localList[0]["wrong2"]);
      selectValueList.add(localList[0]["wrong3"]);
      selectValueList.shuffle();
      print("셔플 성공");
    } catch (e) {
      print("셔플실패 : $e");
    }
    return selectValueList;
  }

  void showResultDialog(bool isCorrect) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(isCorrect ? "정답입니다!" : "오답입니다!"),
          content: Text(isCorrect ? "정답을 선택했습니다." : "오답을 선택했습니다."),
          actions: <Widget>[
            TextButton(
              child: const Text("확인"),
              onPressed: () {
                if (isCorrect) {
                  correctCount++;
                } else if (!isCorrect) {
                  wrongCount++;
                }
                setState(() {
                  progressValue += 1.0 / listLength;
                }); //프로그래스 벨류 증가
                if (localList.length == 1) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                        correctCount: correctCount,
                        wrongCount: wrongCount,
                      ),
                    ),
                  );
                } else {
                  setState(() {
                    localList.removeAt(0);
                    selectValueListShuffle();
                  });
                  Navigator.of(context).pop(); // 다이얼로그 닫음
                }
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    localList = widget.playQuizList;
    listLength = localList.length;
    selectValueListShuffle();
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
      // body: Text(widget.playQuizList[0]["title"]),
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
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 1,
                child: Center(
                  child: Text(
                    localList[0]["title"],
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Text(
                  localList[0]["content"],
                  style: const TextStyle(fontSize: 20),
                ),
              ),
              // 프로그래스 바
              SizedBox(
                height: 5,
                child: LinearProgressIndicator(
                  value: progressValue,
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    OutlinedButton(
                      onPressed: () {
                        if (selectValueList[0] == localList[0]["correct"]) {
                          showResultDialog(true);
                        } else {
                          showResultDialog(false);
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(
                            double.infinity, 50), // 버튼의 가로 크기를 화면 가로에 맞게 조절
                      ),
                      // child: Text(localList[0]["correct"]),
                      child: Text(
                        selectValueList[0],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (selectValueList[1] == localList[0]["correct"]) {
                          showResultDialog(true);
                        } else {
                          showResultDialog(false);
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(
                            double.infinity, 50), // 버튼의 가로 크기를 화면 가로에 맞게 조절
                      ),
                      // child: Text(localList[0]["wrong1"]),
                      child: Text(
                        selectValueList[1],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (selectValueList[2] == localList[0]["correct"]) {
                          showResultDialog(true);
                        } else {
                          showResultDialog(false);
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(
                            double.infinity, 50), // 버튼의 가로 크기를 화면 가로에 맞게 조절
                      ),
                      // child: Text(localList[0]["wrong2"]),
                      child: Text(
                        selectValueList[2],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        if (selectValueList[3] == localList[0]["correct"]) {
                          showResultDialog(true);
                        } else {
                          showResultDialog(false);
                        }
                      },
                      style: OutlinedButton.styleFrom(
                        minimumSize: const Size(
                            double.infinity, 50), // 버튼의 가로 크기를 화면 가로에 맞게 조절
                      ),
                      // child: Text(localList[0]["wrong3"]),
                      child: Text(
                        selectValueList[3],
                        style: const TextStyle(fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
