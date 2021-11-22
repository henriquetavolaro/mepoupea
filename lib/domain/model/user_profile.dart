import 'dart:convert';

class UserProfile {
  final String name;
  final String email;
  final String phone;
  final String imgUrl;
  final String createdAt;
  final String updatedAt;
  UserProfile({
    required this.name,
    required this.email,
    required this.phone,
    required this.imgUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'imgUrl': imgUrl,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
    };
  }

  factory UserProfile.fromMap(Map<String, dynamic> map) {
    return UserProfile(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
      imgUrl: map['imgUrl'],
      createdAt: map['createdAt'],
      updatedAt: map['updatedAt'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfile.fromJson(String source) => UserProfile.fromMap(json.decode(source));
}
