// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Summative {
  final int dmod_sum_id;
  final String title;
  final String task;
  DateTime? dueDate;
  final SummativeStatusCounts? statusCounts;
  Summative({
    required this.dmod_sum_id,
    required this.title,
    required this.task,
    this.dueDate,
    this.statusCounts,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'dmod_sum_id': dmod_sum_id, 'title': title};
  }

  factory Summative.fromMap(
    Map<String, dynamic> map,
    SummativeStatusCounts statusCounts,
  ) {
    return Summative(
      statusCounts: statusCounts,
      dmod_sum_id: map['dmod_sum_id'] as int,
      title: map['title'] as String,
      task: map['task'] as String,
    );
  }
}

class SummativeStatusCounts {
  final int accepted;
  final int pending;
  final int resubmit;
  final int pastDue;

  SummativeStatusCounts({
    required this.accepted,
    required this.pending,
    required this.resubmit,
    required this.pastDue,
  });

  factory SummativeStatusCounts.fromMap(Map<String, dynamic> map) {
    return SummativeStatusCounts(
      accepted: map['accepted_count'] ?? 0,
      pending: map['pending_count'] ?? 0,
      resubmit: map['resubmit_count'] ?? 0,
      pastDue: map['past_due_count'] ?? 0,
    );
  }
}
