
import 'dart:convert';


class AnswerModel {
  final String pageId;
  AnswerModel({
    required this.pageId,
  });

  Map<String, dynamic> toMap() {
    return {
      'pageId': pageId,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      pageId: map['pageId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) => AnswerModel.fromMap(json.decode(source));
}
