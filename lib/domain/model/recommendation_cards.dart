import 'dart:convert';

class RecommendationsCards {
  final String text;
  final double costValue;
  final double savedValue;
  final String icon;
  final String recommendationId;
  RecommendationsCards({
    required this.text,
    required this.costValue,
    required this.savedValue,
    required this.icon,
    required this.recommendationId,
  });

  Map<String, dynamic> toMap() {
    return {
      'text': text,
      'costValue': costValue,
      'savedValue': savedValue,
      'icon': icon,
      'recommendationId': recommendationId,
    };
  }

  factory RecommendationsCards.fromMap(Map<String, dynamic> map) {
    return RecommendationsCards(
      text: map['text'],
      costValue: map['costValue'],
      savedValue: map['savedValue'],
      icon: map['icon'],
      recommendationId: map['recommendationId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RecommendationsCards.fromJson(String source) => RecommendationsCards.fromMap(json.decode(source));
}
