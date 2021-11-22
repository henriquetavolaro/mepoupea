import 'dart:convert';

class FinanceBalance {
  final double likes;
  final double balance;
  final double total;
  final double lastHours;
  FinanceBalance({
    required this.likes,
    required this.balance,
    required this.total,
    required this.lastHours,
  });

  Map<String, dynamic> toMap() {
    return {
      'likes': likes,
      'balance': balance,
      'total': total,
      'lastHours': lastHours,
    };
  }

  factory FinanceBalance.fromMap(Map<String, dynamic> map) {
    return FinanceBalance(
      likes: map['likes'],
      balance: map['balance'],
      total: map['total'],
      lastHours: map['lastHours'],
    );
  }

  String toJson() => json.encode(toMap());

  factory FinanceBalance.fromJson(String source) => FinanceBalance.fromMap(json.decode(source));
}
