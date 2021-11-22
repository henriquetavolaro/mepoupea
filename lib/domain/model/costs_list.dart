import 'dart:convert';

class CostsList {
  final double transactionNumber;
  final List<CostsListsDetails> costs;
  CostsList({
    required this.transactionNumber,
    required this.costs,
  });

  Map<String, dynamic> toMap() {
    return {
      'transactionNumber': transactionNumber,
      'costs': costs.map((x) => x.toMap()).toList(),
    };
  }

  factory CostsList.fromMap(Map<String, dynamic> map) {
    return CostsList(
      transactionNumber: map['transactionNumber'],
      costs: List<CostsListsDetails>.from(map['costs'].map((x) => CostsListsDetails.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory CostsList.fromJson(String source) => CostsList.fromMap(json.decode(source));
}

class CostsListsDetails {
  final String costId;
  final String icon;
  final String title;
  final String category;
  final String origin;
  final double value;
  CostsListsDetails({
    required this.costId,
    required this.icon,
    required this.title,
    required this.category,
    required this.origin,
    required this.value,
  });

  Map<String, dynamic> toMap() {
    return {
      'costId': costId,
      'icon': icon,
      'title': title,
      'category': category,
      'origin': origin,
      'value': value,
    };
  }

  factory CostsListsDetails.fromMap(Map<String, dynamic> map) {
    return CostsListsDetails(
      costId: map['costId'],
      icon: map['icon'],
      title: map['title'],
      category: map['category'],
      origin: map['origin'],
      value: map['value'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CostsListsDetails.fromJson(String source) =>
      CostsListsDetails.fromMap(json.decode(source));
}
