// ignore_for_file: avoid_print, prefer_typing_uninitialized_variables, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quiz/insert_quiz.dart';
import 'package:quiz/manage_quiz.dart';
import 'package:quiz/select_quiz.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final firestore = FirebaseFirestore.instance;

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var result;

  // await firestore.collection("quizData").where().get();
  // print(result.docs[1]['title']);
  // print(result.docs[1]['content']);
  // print("id값 : ${result.docs[1].id}");
  getData() async {
    try {
      result = await firestore.collection('quizData').get();
    } catch (e) {
      print("getData 에러 발생 : $e");
    }
  }

  // await firestore.collection('quizData').add({"" : ""});
  addData(title, content, correct, wrong1, wrong2, wrong3) async {
    try {
      await firestore.collection('quizData').add(
        {
          "title": title,
          "content": content,
          "correct": correct,
          "wrong1": wrong1,
          "wrong2": wrong2,
          "wrong3": wrong3
        },
      );
    } catch (e) {
      print("addData 에러 발생 : $e");
    }
  }

// await firestore.collection("quizData").doc().update({"" : ""});
  updateData(data, title, content, correct, wrong1, wrong2, wrong3) async {
    try {
      await firestore.collection("quizData").doc(data).update(
        {
          "title": title,
          "content": content,
          "correct": correct,
          "wrong1": wrong1,
          "wrong2": wrong2,
          "wrong3": wrong3
        },
      );
    } catch (e) {
      print("updateData 에러 발생 : $e");
    }
  }

// await firestore.collection("quizData").doc().delete();
  deleteData() async {}

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreenAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              child: const Text(
                "모두의 퀴즈",
                style: TextStyle(
                    fontSize: 70,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue),
              ),
            ),
            //  퀴즈 풀기 버튼
            Container(
              margin: const EdgeInsets.fromLTRB(0, 100, 0, 0),
              width: 350,
              height: 70,
              child: ElevatedButton(
                onPressed: () async {
                  await getData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SelectQuiz(
                          listSize: result.size,
                        ),
                      ));
                },
                child: const Text(
                  "퀴즈 풀기",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            //  퀴즈 등록 버튼
            Container(
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              width: 350,
              height: 70,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InsertQuiz(
                          addData: addData,
                        ),
                      ));
                },
                child: const Text(
                  "퀴즈 등록",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
            //  퀴즈 확인 버튼
            Container(
              margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
              width: 350,
              height: 70,
              child: ElevatedButton(
                onPressed: () async {
                  await getData();
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ManageQuiz(
                          quizList: result.docs,
                          listSize: result.size,
                          updateData: updateData,
                        ),
                      ));
                },
                child: const Text(
                  "퀴즈 확인",
                  style: TextStyle(fontSize: 20),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
