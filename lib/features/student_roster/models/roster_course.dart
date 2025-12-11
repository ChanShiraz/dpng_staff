// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class RosterCourse {
  final int a_cid;
  final String title1;
  final int course_type;
  final int alyid;
  RosterCourse({
    required this.a_cid,
    required this.title1,
    required this.course_type,
    required this.alyid,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'a_cid': a_cid,
      'title1': title1,
      'course_type': course_type,
      'alyid': alyid,
    };
  }

  factory RosterCourse.fromMap(Map<String, dynamic> map) {
    return RosterCourse(
      a_cid: map['a_cid'] as int,
      title1: map['title1'] as String,
      course_type: map['course_type'] as int,
      alyid: map['alyid'] as int,
    );
  }
}
