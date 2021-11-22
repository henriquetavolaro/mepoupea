import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {

  final String id;
  final String? name;
  final String? email;
  final String? photoUrl;

  @override
  List<Object?> get props => throw UnimplementedError();

  const UserModel({
    required this.id,
    this.name,
    this.email,
    this.photoUrl,
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'email': email,
    'photoURL': photoUrl,
  };

  String toJson() => jsonEncode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(id: map['id'], name: map['name'], email: map['email'], photoUrl: map['photoURL'], );
  }

  factory UserModel.fromJson(String json) =>
      UserModel.fromMap(jsonDecode(json));
}
