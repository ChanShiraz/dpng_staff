// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Summative {
  final int dmod_sum_id;
  final String title;
  final String task;
  DateTime? dueDate;
  Summative({
    required this.dmod_sum_id,
    required this.title,
    required this.task,
    this.dueDate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'dmod_sum_id': dmod_sum_id, 'title': title};
  }

  factory Summative.fromMap(Map<String, dynamic> map) {
    return Summative(
      dmod_sum_id: map['dmod_sum_id'] as int,
      title: map['title'] as String,
      task: map['task'] as String,
    );
  }
}
