// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ResponseFalseModel {
  final String ResponseStatus;
  final String ResponseCode;
  final String ResponseMessages;
  ResponseFalseModel({
    required this.ResponseStatus,
    required this.ResponseCode,
    required this.ResponseMessages,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ResponseStatus': ResponseStatus,
      'ResponseCode': ResponseCode,
      'ResponseMessages': ResponseMessages,
    };
  }

  factory ResponseFalseModel.fromMap(Map<String, dynamic> map) {
    return ResponseFalseModel(
      ResponseStatus: map['ResponseStatus'] ?? '',
      ResponseCode: map['ResponseCode'] ?? '',
      ResponseMessages: map['ResponseMessages'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ResponseFalseModel.fromJson(String source) =>
      ResponseFalseModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
