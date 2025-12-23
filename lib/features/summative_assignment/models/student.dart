// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Student {
  final int userid;
  final String first;
  final String last;
  final String email;
  Student({
    required this.userid,
    required this.first,
    required this.last,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userid': userid,
      'first': first,
      'last': last,
      'email': email,
    };
  }

  factory Student.fromMap(Map<String, dynamic> map) {
    return Student(
      userid: map['userid'] as int,
      first: map['first'] as String,
      last: map['last'] as String,
      email: map['email'] as String,
    );
  }
}
