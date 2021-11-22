import 'dart:convert';

class WealthSelfie {
  final WealthSelfieWonDetails won;
  final SpentValue spent;
  final InvestedDetails invested;
  WealthSelfie({
    required this.won,
    required this.spent,
    required this.invested,
  });

  Map<String, dynamic> toMap() {
    return {
      'won': won.toMap(),
      'spent': spent.toMap(),
      'invested': invested.toMap(),
    };
  }

  factory WealthSelfie.fromMap(Map<String, dynamic> map) {
    return WealthSelfie(
      won: WealthSelfieWonDetails.fromMap(map['won']),
      spent: SpentValue.fromMap(map['spent']),
      invested: InvestedDetails.fromMap(map['invested']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WealthSelfie.fromJson(String source) => WealthSelfie.fromMap(json.decode(source));
}

class WealthSelfieWonDetails {
  final double value;
  final BanksDetails banks;
  WealthSelfieWonDetails({
    required this.value,
    required this.banks,
  });

  Map<String, dynamic> toMap() {
    return {
      'value': value,
      'banks': banks.toMap(),
    };
  }

  factory WealthSelfieWonDetails.fromMap(Map<String, dynamic> map) {
    return WealthSelfieWonDetails(
      value: map['value'],
      banks: BanksDetails.fromMap(map['banks']),
    );
  }

  String toJson() => json.encode(toMap());

  factory WealthSelfieWonDetails.fromJson(String source) =>
      WealthSelfieWonDetails.fromMap(json.decode(source));
}

class BanksDetails {
  final String bankId;
  final String icon;
  BanksDetails({
    required this.bankId,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'bankId': bankId,
      'icon': icon,
    };
  }

  factory BanksDetails.fromMap(Map<String, dynamic> map) {
    return BanksDetails(
      bankId: map['bankId'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BanksDetails.fromJson(String source) =>
      BanksDetails.fromMap(json.decode(source));
}

class SpentValue {
  final double value;
  SpentValue({
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'value': value,
    };
  }

  factory SpentValue.fromMap(Map<String, dynamic> map) {
    return SpentValue(
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SpentValue.fromJson(String source) =>
      SpentValue.fromMap(json.decode(source));
}

class InvestedDetails {
  final double total;
  final List<StockbrokersDetails> stockbrokers;
  InvestedDetails({
    required this.total,
    required this.stockbrokers,
  });

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'stockbrokers': stockbrokers.map((x) => x.toMap()).toList(),
    };
  }

  factory InvestedDetails.fromMap(Map<String, dynamic> map) {
    return InvestedDetails(
      total: map['total'],
      stockbrokers: List<StockbrokersDetails>.from(
          map['stockbrokers']?.map((x) => StockbrokersDetails.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory InvestedDetails.fromJson(String source) =>
      InvestedDetails.fromMap(json.decode(source));
}

class StockbrokersDetails {
  final String stockbrokerId;
  final String icon;
  StockbrokersDetails({
    required this.stockbrokerId,
    required this.icon,
  });

  Map<String, dynamic> toMap() {
    return {
      'stockbrokerId': stockbrokerId,
      'icon': icon,
    };
  }

  factory StockbrokersDetails.fromMap(Map<String, dynamic> map) {
    return StockbrokersDetails(
      stockbrokerId: map['stockbrokerId'],
      icon: map['icon'],
    );
  }

  String toJson() => json.encode(toMap());

  factory StockbrokersDetails.fromJson(String source) =>
      StockbrokersDetails.fromMap(json.decode(source));
}
