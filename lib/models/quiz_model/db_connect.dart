import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:vmart/models/quiz_model/question_model.dart';

class DBconnect {
  final url = Uri.parse(
      'https://quiz2-51aac-default-rtdb.asia-southeast1.firebasedatabase.app/questions.json');

  Future<List<Question>> fetchQuestions() async {
    return http.get(url).then((response) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion = Question(
          id: key,
          title: value['title'],
          options: Map.castFrom(
            value['options'],
          ),
        );
        newQuestions.add(newQuestion);
      });
      return newQuestions;
    });
  }
}
