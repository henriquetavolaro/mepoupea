import 'dart:convert';

class CategoricalCosts {
  final double total;
  final double budget;
  final CategoricalCostsDetails live;
  final CategoricalCostsDetails eat;
  final CategoricalCostsDetails health;
  final CategoricalCostsDetails transport;
  final CategoricalCostsDetails entertainment;

  CategoricalCosts({required this.total,
    required this.budget,
    required this.live,
    required this.eat,
    required this.health,
    required this.transport,
    required this.entertainment});



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

  factory CategoricalCosts.fromMap(Map<String, dynamic> map) {
    return CategoricalCosts(
      total: map['total'],
      budget: map['budget'],
      live: CategoricalCostsDetails.fromMap(map['live']),
      eat: CategoricalCostsDetails.fromMap(map['eat']),
      health: CategoricalCostsDetails.fromMap(map['health']),
      transport: CategoricalCostsDetails.fromMap(map['transport']),
      entertainment: CategoricalCostsDetails.fromMap(map['entertainment']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoricalCosts.fromJson(String source) => CategoricalCosts.fromMap(json.decode(source));
}

class CategoricalCostsDetails {
  final double value;
  final double percentage;

  CategoricalCostsDetails({required this.value, required this.percentage});

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'percentage': percentage,
    };
  }

  factory CategoricalCostsDetails.fromMap(Map<String, dynamic> map) {
    return CategoricalCostsDetails(
      value: map['value'],
      percentage: map['percentage'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoricalCostsDetails.fromJson(String source) =>
      CategoricalCostsDetails.fromMap(json.decode(source));
}
