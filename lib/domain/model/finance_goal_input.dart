import 'dart:convert';

class FinanceGoalInput {
  final double actualValue;
  final double goalValue;
  final double valueToSave;
  final String goalType;
  final String importance;
  final String dateRange;
  final String icon;
  FinanceGoalInput({
    required this.actualValue,
    required this.goalValue,
    required this.valueToSave,
    required this.goalType,
    required this.importance,
    required this.dateRange,
    required this.icon,
  });


  Map<String, dynamic> toMap() {
    return {
      'actualValue': actualValue,
      'goalValue': goalValue,
      'valueToSave': valueToSave,
      'goalType': goalType,
      'importance': importance,
      'dateRange': dateRange,
      'icon': icon,
    };
  }

  factory FinanceGoalInput.fromMap(Map<String, dynamic> map) {
    return FinanceGoalInput(
      actualValue: map['actualValue'],
      goalValue: map['goalValue'],
      valueToSave: map['valueToSave'],
      goalType: map['goalType'],
      importance: map['importance'],
      dateRange: map['dateRange'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FinanceGoalInput.fromJson(String source) => FinanceGoalInput.fromMap(json.decode(source));
}
