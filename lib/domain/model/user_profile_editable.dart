import 'dart:convert';

class UserProfileEditable {
  final String name;
  final String email;
  final String phone;
  UserProfileEditable({
    required this.name,
    required this.email,
    required this.phone,
  });


  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
    };
  }

  factory UserProfileEditable.fromMap(Map<String, dynamic> map) {
    return UserProfileEditable(
      name: map['name'],
      email: map['email'],
      phone: map['phone'],
    );
  }

  String toJson() => json.encode(toMap());

  factory UserProfileEditable.fromJson(String source) => UserProfileEditable.fromMap(json.decode(source));
}
