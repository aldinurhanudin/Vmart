import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vmart/models/quiz_model/db_connect.dart';
import 'package:vmart/models/quiz_model/question_model.dart';
import 'package:vmart/shared/shared.dart';
import 'package:vmart/ui/widgets/home_page/quiz_widget/next_button.dart';
import 'package:vmart/ui/widgets/home_page/quiz_widget/option_card.dart';
import 'package:vmart/ui/widgets/home_page/quiz_widget/question_widget.dart';
import 'package:vmart/ui/widgets/home_page/quiz_widget/result_box.dart';

class QuizPage extends StatefulWidget {
  QuizPage({Key? key}) : super(key: key);

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  var db = DBconnect();
  late Future _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestions();
  }

  @override
  void initState() {
    _questions = getData();
    super.initState();
  }

  int index = 0;
  int score = 0;
  bool isPressed = false;
  bool isAlreadySelected = false;

  void nextQuestion(int questionLength) {
    if (index == questionLength - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => ResultBox(
          result: score,
          questionLength: questionLength,
          onPressed: startOver,
        ),
      );
    } else {
      if (isPressed) {
        setState(() {
          index++;
          isPressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Pilih opsi terlebih dahulu'),
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.symmetric(vertical: 20),
          ),
        );
      }
    }
  }

  Future<void> updatePoints(int newPoints) async {
    final DocumentReference docRef =
        FirebaseFirestore.instance.collection('data').doc('vmartPay');

    try {
      final DocumentSnapshot docSnapshot = await docRef.get();
      final Map<String, dynamic>? data =
          docSnapshot.data() as Map<String, dynamic>?;

      if (data != null) {
        final int currentPoints = data['points'] as int;
        final int updatedPoints = currentPoints + newPoints;

        await docRef.update({'points': updatedPoints});
      }
    } catch (e) {
      print('Error updating points: $e');
    }
  }

  void checkAnswerAndUpdate(bool value) {
    if (isAlreadySelected) {
      return;
    } else {
      if (value == true) {
        score += 100;
        updatePoints(100); 
      }
      setState(() {
        isPressed = true;
        isAlreadySelected = true;
      });
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      score = 0;
      isPressed = false;
      isAlreadySelected = false;
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
              backgroundColor: primaryColor,
              appBar: AppBar(
                title: Text('Kuis'),
                backgroundColor: primaryColor,
                shadowColor: Colors.transparent,
                actions: [
                  Padding(
                    padding: EdgeInsets.all(18),
                    child: Text(
                      'Nilai: $score',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    QuestionWidget(
                      question: extractedData[index].title,
                      indexAction: index,
                      totalQuestions: extractedData.length,
                    ),
                    Divider(
                      color: neutral,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    for (int i = 0;
                        i < extractedData[index].options.length;
                        i++)
                      GestureDetector(
                        onTap: () => checkAnswerAndUpdate(
                            extractedData[index].options.values.toList()[i]),
                        child: OptionCard(
                          option: extractedData[index].options.keys.toList()[i],
                          color: isPressed
                              ? extractedData[index]
                                          .options
                                          .values
                                          .toList()[i] ==
                                      true
                                  ? correct
                                  : incorrect
                              : neutral,
                        ),
                      ),
                  ],
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: NextButton(),
                ),
              ),
              floatingActionButtonLocation:
                  FloatingActionButtonLocation.centerFloat,
            );
          }
        } else {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Harap Tunggu sementara pertanyaan sedang dimuat..',
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    decoration: TextDecoration.none,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          );
        }
        return Center(
          child: Text('Tidak ada  data'),
        );
      },
    );
  }
}
