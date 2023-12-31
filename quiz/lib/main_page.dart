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
      print("데이터 불러오기 성공");
    } catch (e) {
      print("getData 에러 발생 : $e");
    }
    return result;
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
  deleteData(data) async {
    try {
      await firestore.collection("quizData").doc(data).delete();
    } catch (e) {
      print("deleteData 에러 발생 : $e");
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
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
          child: SingleChildScrollView(
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
                  child: TextButton(
                    onPressed: () async {
                      await getData();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SelectQuiz(
                              listSize: result.size,
                              quizList: result.docs,
                            ),
                          ));
                    },
                    child: const Text(
                      "퀴즈 풀기",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                //  퀴즈 등록 버튼
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  width: 350,
                  height: 70,
                  child: TextButton(
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
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                //  퀴즈 확인 버튼
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 40, 0, 0),
                  width: 350,
                  height: 70,
                  child: TextButton(
                    onPressed: () async {
                      await getData();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ManageQuiz(
                              result: result,
                              quizList: result.docs,
                              listSize: result.size,
                              updateData: updateData,
                              getData: getData,
                              deleteData: deleteData,
                            ),
                          ));
                    },
                    child: const Text(
                      "퀴즈 목록",
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
