// ignore_for_file: prefer_typing_uninitialized_variables, avoid_print, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:quiz/main_page.dart';
import 'package:quiz/manage_quiz.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({
    super.key,
    this.quizValue,
    this.updateData,
    this.result,
    this.quizList,
    this.listSize,
    this.getData,
    this.deleteData,
  });

  final quizValue;
  final updateData;
  final result;
  final quizList;
  final listSize;
  final getData;
  final deleteData;

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  // 변수 선언
  var localInputTitle = "";
  var localInputContent = "";
  var localInputCorrect = "";
  var localInputWrong1 = "";
  var localInputWrong2 = "";
  var localInputWrong3 = "";

  // 컨트롤러 선언
  TextEditingController titleController = TextEditingController();
  TextEditingController contentController = TextEditingController();
  TextEditingController correctController = TextEditingController();
  TextEditingController wrong1Controller = TextEditingController();
  TextEditingController wrong2Controller = TextEditingController();
  TextEditingController wrong3Controller = TextEditingController();

  final _focusNodeTitle = FocusNode();
  final _focusNodeContent = FocusNode();
  final _focusNodeCorrect = FocusNode();
  final _focusNodeWrong1 = FocusNode();
  final _focusNodeWrong2 = FocusNode();
  final _focusNodeWrong3 = FocusNode();

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
            icon: const Icon(Icons.home))
      ]),
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.fromLTRB(30, 0, 30, 0),
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
                  margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Expanded(
                        child: ElevatedButton(
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
                            // get
                            // await widget.getData();
                            var result = await widget.getData();
                            var quizList = result.docs;

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ManageQuiz(
                                    result: result,
                                    getData: widget.getData,
                                    quizList: quizList,
                                    listSize: result.size,
                                    updateData: widget.updateData,
                                    deleteData: widget.deleteData,
                                  ),
                                ));
                          },
                          child: const Text(
                            "수 정",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () async {
                            var id = widget.quizValue.id;
                            await widget.deleteData(id);

                            var result = await widget.getData();
                            var quizList = result.docs;

                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => ManageQuiz(
                                    result: result,
                                    getData: widget.getData,
                                    quizList: quizList,
                                    listSize: result.size,
                                    updateData: widget.updateData,
                                    deleteData: widget.deleteData,
                                  ),
                                ));
                          },
                          child: const Text(
                            "삭 제",
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                      ),
                    ],
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
