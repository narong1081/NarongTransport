import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class AuthenModel {
  final String rollerid;
  final String username;
  final String password;
  AuthenModel({
    required this.rollerid,
    required this.username,
    required this.password,
  });


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rollerid': rollerid,
      'username': username,
      'password': password,
    };
  }

  factory AuthenModel.fromMap(Map<String, dynamic> map) {
    return AuthenModel(
      rollerid: map['rollerid'] as String,
      username: map['username'] as String,
      password: map['password'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AuthenModel.fromJson(String source) => AuthenModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
