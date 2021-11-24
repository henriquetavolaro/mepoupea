import 'dart:convert';

class UserProfile {
  final String? name;
  final String? email;
  final String? phone;
  final bool isActive;
  final String? createdAt;
  final String? updatedAt;
  final String? testing;
  UserProfile({
    this.name,
    this.email,
    this.phone,
    required this.isActive,
    this.createdAt,
    this.updatedAt,
    this.testing,
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'isActive': isActive,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'testing': testing,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      name: map['name'] != null ? map['name'] : null,
      email: map['email'] != null ? map['email'] : null,
      phone: map['phone'] != null ? map['phone'] : null,
      isActive: map['isActive'],
      createdAt: map['createdAt'] != null ? map['createdAt'] : null,
      updatedAt: map['updatedAt'] != null ? map['updatedAt'] : null,
      testing: map['testing'] != null ? map['testing'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) => UserProfile.fromMap(json.decode(source));
}

