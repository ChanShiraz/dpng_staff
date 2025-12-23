// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Lesson {
  final int dmod_lesson_id;
  final String title;
  final String description;
  DateTime? dueDate;
  Lesson({
    required this.dmod_lesson_id,
    required this.title,
    required this.description,
    this.dueDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dmod_lesson_id': dmod_lesson_id,
      'title': title,
      'description': description,
      'due_date': dueDate?.toIso8601String(),
    };
  }

  factory Lesson.fromMap(Map<String, dynamic> map) {
    return Lesson(
      dmod_lesson_id: map['dmod_lesson_id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
      dueDate: map['due_date'] != null ? DateTime.parse(map['due_date']) : null,
    );
  }
}
