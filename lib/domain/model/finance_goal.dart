import 'dart:convert';

class FinanceGoal {
  final String goalId;
  final double presentValue;
  final double goalValue;
  final String date;
  final String icon;
  FinanceGoal({
    required this.goalId,
    required this.presentValue,
    required this.goalValue,
    required this.date,
    required this.icon,
  });


  Map<String, dynamic> toMap() {
    return {
      'goalId': goalId,
      'presentValue': presentValue,
      'goalValue': goalValue,
      'date': date,
      'icon': icon,
    };
  }

  factory FinanceGoal.fromMap(Map<String, dynamic> map) {
    return FinanceGoal(
      goalId: map['goalId'],
      presentValue: map['presentValue'],
      goalValue: map['goalValue'],
      date: map['date'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FinanceGoal.fromJson(String source) => FinanceGoal.fromMap(json.decode(source));
}
