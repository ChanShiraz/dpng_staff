// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LessonObjective {
  final int modnum;
  final int dmod_lesson_id;
  final String objective;
  LessonObjective({
    required this.modnum,
    required this.dmod_lesson_id,
    required this.objective,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'modnum': modnum,
      'dmod_lesson_id': dmod_lesson_id,
      'objective': objective,
    };
  }

  factory LessonObjective.fromMap(Map<String, dynamic> map) {
    return LessonObjective(
      modnum: map['modnum'] as int,
      dmod_lesson_id: map['dmod_lesson_id'] as int,
      objective: map['objective'] as String,
    );
  }
}
