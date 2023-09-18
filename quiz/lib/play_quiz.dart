// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print

import 'package:flutter/material.dart';
import 'package:quiz/main_page.dart';

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
  var buttons;
  var selectValueList = [];

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

  @override
  void initState() {
    super.initState();
    localList = widget.playQuizList;
    selectValueListShuffle();
  }

  @override
  Widget build(BuildContext context) {
    buttons = [
      ElevatedButton(
        onPressed: () {
          if (selectValueList[0] == localList[0]["correct"]) {
            print("정답입니다");
          } else {
            print("오답입니다");
          }
          setState(() {
            selectValueList.shuffle();
            localList.removeAt(0);
          });
        },
        // child: Text(localList[0]["correct"]),
        child: Text(selectValueList[0]),
      ),
      ElevatedButton(
        onPressed: () {
          if (selectValueList[1] == localList[0]["correct"]) {
            print("정답입니다");
          } else {
            print("오답입니다");
          }
          setState(() {
            selectValueList.shuffle();
            localList.removeAt(0);
          });
        },
        // child: Text(localList[0]["wrong1"]),
        child: Text(selectValueList[1]),
      ),
      ElevatedButton(
        onPressed: () {
          if (selectValueList[2] == localList[0]["correct"]) {
            print("정답입니다");
          } else {
            print("오답입니다");
          }
          setState(() {
            selectValueList.shuffle();
            localList.removeAt(0);
          });
        },
        // child: Text(localList[0]["wrong2"]),
        child: Text(selectValueList[2]),
      ),
      ElevatedButton(
        onPressed: () {
          if (selectValueList[3] == localList[0]["correct"]) {
            print("정답입니다");
          } else {
            print("오답입니다");
          }
          setState(() {
            selectValueList.shuffle();
            localList.removeAt(0);
          });
        },
        // child: Text(localList[0]["wrong3"]),
        child: Text(selectValueList[3]),
      )
    ];
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
      // body: Text(widget.playQuizList[0]["title"]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              localList[0]["title"],
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Text(
              localList[0]["content"],
              style: const TextStyle(fontSize: 20),
            ),
            for (ElevatedButton button in buttons) button,
          ],
        ),
      ),
    );
  }
}
