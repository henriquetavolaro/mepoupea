import 'dart:convert';

class CategoricalNathLimitsCosts {
  final double total;
  final double budget;
  final CategoricalNathCostsDetails live;
  final CategoricalNathCostsDetails eat;
  final CategoricalNathCostsDetails health;
  final CategoricalNathCostsDetails transport;
  final CategoricalNathCostsDetails entertainment;
  CategoricalNathLimitsCosts({
    required this.total,
    required this.budget,
    required this.live,
    required this.eat,
    required this.health,
    required this.transport,
    required this.entertainment,
  });

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'budget': budget,
      'live': live.toMap(),
      'eat': eat.toMap(),
      'health': health.toMap(),
      'transport': transport.toMap(),
      'entertainment': entertainment.toMap(),
    };
  }

  factory CategoricalNathLimitsCosts.fromMap(Map<String, dynamic> map) {
    return CategoricalNathLimitsCosts(
      total: map['total'],
      budget: map['budget'],
      live: CategoricalNathCostsDetails.fromMap(map['live']),
      eat: CategoricalNathCostsDetails.fromMap(map['eat']),
      health: CategoricalNathCostsDetails.fromMap(map['health']),
      transport: CategoricalNathCostsDetails.fromMap(map['transport']),
      entertainment: CategoricalNathCostsDetails.fromMap(map['entertainment']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoricalNathLimitsCosts.fromJson(String source) => CategoricalNathLimitsCosts.fromMap(json.decode(source));
}

class CategoricalNathCostsDetails {
  final double value;
  final double percentage;
  final double limit;
  CategoricalNathCostsDetails({
    required this.value,
    required this.percentage,
    required this.limit,
  });

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'percentage': percentage,
      'limit': limit,
    };
  }

  factory CategoricalNathCostsDetails.fromMap(Map<String, dynamic> map) {
    return CategoricalNathCostsDetails(
      value: map['value'],
      percentage: map['percentage'],
      limit: map['limit'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoricalNathCostsDetails.fromJson(String source) =>
      CategoricalNathCostsDetails.fromMap(json.decode(source));
}
