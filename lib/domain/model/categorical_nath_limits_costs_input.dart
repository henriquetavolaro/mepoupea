import 'dart:convert';

class CategoricalNathLimitsCostsInput {
  final Limit live;
  final Limit eat;
  final Limit health;
  final Limit transport;
  final Limit entertainment;
  CategoricalNathLimitsCostsInput({
    required this.live,
    required this.eat,
    required this.health,
    required this.transport,
    required this.entertainment,
  });

  Map<String, dynamic> toMap() {
    return {
      'live': live.toMap(),
      'eat': eat.toMap(),
      'health': health.toMap(),
      'transport': transport.toMap(),
      'entertainment': entertainment.toMap(),
    };
  }

  factory CategoricalNathLimitsCostsInput.fromMap(Map<String, dynamic> map) {
    return CategoricalNathLimitsCostsInput(
      live: Limit.fromMap(map['live']),
      eat: Limit.fromMap(map['eat']),
      health: Limit.fromMap(map['health']),
      transport: Limit.fromMap(map['transport']),
      entertainment: Limit.fromMap(map['entertainment']),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoricalNathLimitsCostsInput.fromJson(String source) => CategoricalNathLimitsCostsInput.fromMap(json.decode(source));
}

class Limit {
  final String limit;
  Limit({
    required this.limit,
  });

  Map<String, dynamic> toMap() {
    return {
      'limit': limit,
    };
  }

  factory Limit.fromMap(Map<String, dynamic> map) {
    return Limit(
      limit: map['limit'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Limit.fromJson(String source) => Limit.fromMap(json.decode(source));
}
