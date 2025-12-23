// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LessonModel {
  final int modnum;
  final int dmod_sum_id;
  final int altid;
  final int a_cid;
  final int number;
  final String title;
  final String description;
  final int active;
  final int summative_status;
  LessonModel({
    required this.modnum,
    required this.dmod_sum_id,
    required this.altid,
    required this.a_cid,
    required this.number,
    required this.title,
    required this.description,
    required this.active,
    required this.summative_status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'modnum': modnum,
      'dmod_sum_id': dmod_sum_id,
      'altid': altid,
      'a_cid': a_cid,
      'number': number,
      'title': title,
      'description': description,
      'active': active,
      'summative_status': summative_status,
    };
  }

  factory LessonModel.fromMap(Map<String, dynamic> map) {
    return LessonModel(
      modnum: map['modnum'] as int,
      dmod_sum_id: map['dmod_sum_id'] as int,
      altid: map['altid'] as int,
      a_cid: map['a_cid'] as int,
      number: map['number'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      active: map['active'] as int,
      summative_status: map['summative_status'] as int,
    );
  }
}
