import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class UserModel {
  final String year;
  final String gentype;
  final String phonenumber;
  final String infriendid;
  UserModel({
    required this.year,
    required this.gentype,
    required this.phonenumber,
    required this.infriendid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'year': year,
      'gentype': gentype,
      'phonenumber': phonenumber,
      'infriendid': infriendid,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      year: map['year'] as String,
      gentype: map['gentype'] as String,
      phonenumber: map['phonenumber'] as String,
      infriendid: map['infriendid'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) => UserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
