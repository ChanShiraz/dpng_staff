// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

class CourseModel {
  final int a_cid;
  final int cid;
  final int ccid;
  final String title1;
  CourseModel({
    required this.a_cid,
    required this.cid,
    required this.ccid,
    required this.title1,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'a_cid': a_cid,
      'cid': cid,
      'ccid': ccid,
      'title1': title1,
    };
  }

  factory CourseModel.fromMap(Map<String, dynamic> map) {
    return CourseModel(
      a_cid: map['a_cid'] as int,
      cid: map['cid'] as int,
      ccid: map['ccid'] as int,
      title1: map['title1'] as String,
    );
  }
}
