// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LessonMaterial {
  final int modnum;
  final int dmod_lesson_id;
  final String title;
  final String description;
  final int type;
  final String? link;
  final String? path;
  LessonMaterial({
    required this.modnum,
    required this.dmod_lesson_id,
    required this.title,
    required this.description,
    required this.type,
    this.link,
    this.path,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'modnum': modnum,
      'dmod_lesson_id': dmod_lesson_id,
      'title': title,
      'description': description,
      'type': type,
      'link': link,
      'path': path,
    };
  }

  factory LessonMaterial.fromMap(Map<String, dynamic> map) {
    return LessonMaterial(
      modnum: map['modnum'] as int,
      dmod_lesson_id: map['dmod_lesson_id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      type: map['type'] as int,
      link: map['link'] != null ? map['link'] as String : null,
      path: map['path'] != null ? map['path'] as String : null,
    );
  }
}
