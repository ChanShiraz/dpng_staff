// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class LessonToolModel {
  final int modnum;
  final int dmodLessonId;
  final int altToolId;
  final String title;
  final String description;
  final int type;
  final String? link;
  final String? path;
  LessonToolModel({
    required this.modnum,
    required this.dmodLessonId,
    required this.altToolId,
    required this.title,
    required this.description,
    required this.type,
    this.link,
    this.path,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'modnum': modnum,
      'dmod_lesson_id': dmodLessonId,
      'alt_tool_id': altToolId,
      'title': title,
      'description': description,
      'type': type,
      'link': link,
      'path': path,
    };
  }

  factory LessonToolModel.fromMap(Map<String, dynamic> map) {
    return LessonToolModel(
      modnum: map['modnum'] as int,
      dmodLessonId: map['dmodLessonId'] as int,
      altToolId: map['altToolId'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      type: map['type'] as int,
      link: map['link'] != null ? map['link'] as String : null,
      path: map['path'] != null ? map['path'] as String : null,
    );
  }
}
