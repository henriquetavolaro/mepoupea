
import 'dart:convert';



class AnswerModel {
  final AnswerModelBody answers;
  AnswerModel({
    required this.answers,
  });

  Map<String, dynamic> toMap() {
    return {
      'answers': answers.toMap(),
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      answers: AnswerModelBody.fromMap(map['answers']),
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) => AnswerModel.fromMap(json.decode(source));
}

class AnswerModelBody {
  final String pageId;

  AnswerModelBody({required this.pageId});

  Map<String, dynamic> toMap() {
    return {
      'pageId': pageId,
    };
  }

  factory AnswerModelBody.fromMap(Map<String, dynamic> map) {
    return AnswerModelBody(
      pageId: map['pageId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModelBody.fromJson(String source) =>
      AnswerModelBody.fromMap(json.decode(source));
}
