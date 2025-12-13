// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SummativeWork {
  final int subid;
  final String title;
  final DateTime date;
  final int status;
  final int grade;
  final DateTime assessed;
  SummativeWork({
    required this.subid,
    required this.title,
    required this.date,
    required this.status,
    required this.grade,
    required this.assessed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subid': subid,
      'title': title,
      'date': date.millisecondsSinceEpoch,
      'status': status,
      'grade': grade,
      'assessed': assessed.millisecondsSinceEpoch,
    };
  }

  factory SummativeWork.fromMap(Map<String, dynamic> map) {
    return SummativeWork(
      subid: map['subid'] as int,
      title: map['alt_mod_summatives']['title'] as String,
      date: DateTime.parse(map['date']),
      status: map['status'] as int,
      grade: map['grade'] as int,
      assessed: DateTime.parse(map['assessed']),
    );
  }
}
