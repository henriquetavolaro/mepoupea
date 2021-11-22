import 'dart:convert';

class FinanceSelfie {
  final SelfieResult alone;
  final SelfieResult withNath;
  FinanceSelfie({
    required this.alone,
    required this.withNath,
  });

  Map<String, dynamic> toMap() {
    return {
      'alone': alone.toMap(),
      'withNath': withNath.toMap(),
    };
  }

  factory FinanceSelfie.fromMap(Map<String, dynamic> map) {
    return FinanceSelfie(
      alone: SelfieResult.fromMap(map['alone']),
      withNath: SelfieResult.fromMap(map['withNath']),
    );
  }

  String toJson() => json.encode(toMap());

  factory FinanceSelfie.fromJson(String source) => FinanceSelfie.fromMap(json.decode(source));
}

class SelfieResult {
  final double likes;
  final TotalSelfie won;
  final TotalValueSelfie spent;
  final TotalValueSelfie invested;
  SelfieResult({
    required this.likes,
    required this.won,
    required this.spent,
    required this.invested,
  });

  Map<String, dynamic> toMap() {
    return {
      'likes': likes,
      'won': won.toMap(),
      'spent': spent.toMap(),
      'invested': invested.toMap(),
    };
  }

  factory SelfieResult.fromMap(Map<String, dynamic> map) {
    return SelfieResult(
      likes: map['likes'],
      won: TotalSelfie.fromMap(map['won']),
      spent: TotalValueSelfie.fromMap(map['spent']),
      invested: TotalValueSelfie.fromMap(map['invested']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SelfieResult.fromJson(String source) =>
      SelfieResult.fromMap(json.decode(source));
}

class TotalSelfie {
  final double total;
  TotalSelfie({
    required this.total,
  });

  Map<String, dynamic> toMap() {
    return {
      'total': total,
    };
  }

  factory TotalSelfie.fromMap(Map<String, dynamic> map) {
    return TotalSelfie(
      total: map['total'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalSelfie.fromJson(String source) =>
      TotalSelfie.fromMap(json.decode(source));
}

class TotalValueSelfie {
  final double total;
  final double value;
  TotalValueSelfie({
    required this.total,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'value': value,
    };
  }

  factory TotalValueSelfie.fromMap(Map<String, dynamic> map) {
    return TotalValueSelfie(
      total: map['total'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TotalValueSelfie.fromJson(String source) =>
      TotalValueSelfie.fromMap(json.decode(source));
}
