import 'dart:convert';

import 'finance_goal.dart';

class FinanceGoals {
  final List<FinanceGoal> goals;
  FinanceGoals({
    required this.goals,
  });

  Map<String, dynamic> toMap() {
    return {
      'finance': goals.map((x) => x.toMap()).toList(),
    };
  }

  factory FinanceGoals.fromMap(Map<String, dynamic> map) {
    return FinanceGoals(
      goals: List<FinanceGoal>.from(map['goals']?.map((x) => FinanceGoal.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory FinanceGoals.fromJson(String source) => FinanceGoals.fromMap(json.decode(source));
}