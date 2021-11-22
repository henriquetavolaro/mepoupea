import 'dart:convert';

class RecommendationsCardsCategorical {
  final String category;
  final String text;
  final List<String> details;
  final String recommendationId;
  RecommendationsCardsCategorical({
    required this.category,
    required this.text,
    required this.details,
    required this.recommendationId,
  });

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'text': text,
      'details': details,
      'recommendationId': recommendationId,
    };
  }

  factory RecommendationsCardsCategorical.fromMap(Map<String, dynamic> map) {
    return RecommendationsCardsCategorical(
      category: map['category'],
      text: map['text'],
      details: List<String>.from(map['details']),
      recommendationId: map['recommendationId'],
    );
  }

  String toJson() => json.encode(toMap());

  factory RecommendationsCardsCategorical.fromJson(String source) => RecommendationsCardsCategorical.fromMap(json.decode(source));
}