import 'dart:convert';

class FinanceTransactionInput {
  final String category;
  final String typeByCategory;
  final double value;
  final String date;
  final String description;
  FinanceTransactionInput({
    required this.category,
    required this.typeByCategory,
    required this.value,
    required this.date,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'typeByCategory': typeByCategory,
      'value': value,
      'date': date,
      'description': description,
    };
  }

  factory FinanceTransactionInput.fromMap(Map<String, dynamic> map) {
    return FinanceTransactionInput(
      category: map['category'],
      typeByCategory: map['typeByCategory'],
      value: map['value'],
      date: map['date'],
      description: map['description'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FinanceTransactionInput.fromJson(String source) => FinanceTransactionInput.fromMap(json.decode(source));
}
