// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class FormativeAssessment {
  final int fsubid;
  final int userid;
  final String title;
  final DateTime date;
  final int a_cid;
  final int type;
  final String? pathLink;
  final String? text;
  final String? description;
  final int assessed_by;
  final String first;
  final String last;
  final String title1;
  final int ccid;
  final int course_type;

  FormativeAssessment({
    required this.fsubid,
    required this.userid,
    required this.title,
    required this.date,
    required this.a_cid,
    required this.type,
    this.pathLink,
    this.text,
    this.description,
    required this.assessed_by,
    required this.first,
    required this.last,
    required this.title1,
    required this.ccid,
    required this.course_type,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fsubid': fsubid,
      'userid': userid,
      'title': title,
      'date': date.millisecondsSinceEpoch,
      'a_cid': a_cid,
      'type': type,
      'pathLink': pathLink,
      'text': text,
      'assessed_by': assessed_by,
      'first': first,
      'last': last,
      'title1': title1,
      'ccid': ccid,
      'course_type': course_type,
    };
  }

  factory FormativeAssessment.fromMap(Map<String, dynamic> map) {
    return FormativeAssessment(
      fsubid: map['fsubid'] as int,
      userid: map['userid'] as int,
      title: map['title'] as String,
      date: DateTime.parse(map['date'].toString()),
      a_cid: map['a_cid'] as int,
      type: map['type'] as int,
      pathLink: map['path_link'] != null ? map['path_link'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      assessed_by: map['assessed_by'] as int,
      first: map['users']['first'] as String,
      last: map['users']['last'] as String,
      title1: map['alt_courses']['title1'] as String,
      ccid: map['alt_courses']['ccid'] as int,
      course_type: map['alt_courses']['course_type'] as int,
    );
  }
}
