// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RosterStudent {
  final int userId;
  final String? first;
  final String? last;
  final String? email;
  RosterStudent({required this.userId, this.first, this.last, this.email});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'userid': userId,
      'first': first,
      'last': last,
      'email': email,
    };
  }

  factory RosterStudent.fromMap(Map<String, dynamic> map) {
    return RosterStudent(
      userId: map['userid'],
      first: map['first'] != null ? map['first'] as String : null,
      last: map['last'] != null ? map['last'] as String : null,
      email: map['email'] != null ? map['email'] as String : null,
    );
  }
}
