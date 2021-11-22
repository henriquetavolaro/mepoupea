import 'dart:convert';

class OnboardModel {
  final String pageId;
  final int cardType;
  final List<Texts> texts;
  final List<AnswerOption> answerOptions;
  OnboardModel({
    required this.pageId,
    required this.cardType,
    required this.texts,
    required this.answerOptions,
  });

  Map<String, dynamic> toMap() {
    return {
      'pageId': pageId,
      'cardType': cardType,
      'texts': texts.map((x) => x.toMap()).toList(),
      'answerOptions': answerOptions.map((x) => x.toMap()).toList(),
    };
  }

  factory OnboardModel.fromMap(Map<String, dynamic> map) {
    return OnboardModel(
      pageId: map['pageId'],
      cardType: map['cardType'],
      texts: List<Texts>.from(map['texts']?.map((x) => Texts.fromMap(x))),
      answerOptions: List<AnswerOption>.from(map['answerOptions']?.map((x) => AnswerOption.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory OnboardModel.fromJson(String source) => OnboardModel.fromMap(json.decode(source));
}

class AnswerOption {
  final String answerId;
  final String text;
  final int fieldType;
  final String url;
  AnswerOption({
    required this.answerId,
    required this.text,
    required this.fieldType,
    required this.url,
  });

  Map<String, dynamic> toMap() {
    return {
      'answerId': answerId,
      'text': text,
      'fieldType': fieldType,
      'url': url,
    };
  }

  factory AnswerOption.fromMap(Map<String, dynamic> map) {
    return AnswerOption(
      answerId: map['answerId'],
      text: map['text'],
      fieldType: map['fieldType'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerOption.fromJson(String source) =>
      AnswerOption.fromMap(json.decode(source));
}

class Texts {
  final String text;
  final double fontSize;
  final String marker;
  final String textPosition;
  Texts({
    required this.text,
    required this.fontSize,
    required this.marker,
    required this.textPosition,
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'fontSize': fontSize,
      'marker': marker,
      'textPosition': textPosition,
    };
  }

  factory Texts.fromMap(Map<String, dynamic> map) {
    return Texts(
      text: map['text'],
      fontSize: map['fontSize'],
      marker: map['marker'],
      textPosition: map['textPosition'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Texts.fromJson(String source) => Texts.fromMap(json.decode(source));
}

