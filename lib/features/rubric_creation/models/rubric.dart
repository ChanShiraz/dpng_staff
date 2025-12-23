// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Rubric {
  final int ccid;
  final String title;
  final int type;
  final int active;
  final int approved;
  final int assigned;
  final int instructor_created;
  final int instructor_userid;
  final int instructor_draft_status;
  Rubric({
    required this.ccid,
    required this.title,
    required this.type,
    required this.active,
    required this.approved,
    required this.assigned,
    required this.instructor_created,
    required this.instructor_userid,
    required this.instructor_draft_status,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ccid': ccid,
      'title': title,
      'type': type,
      'active': active,
      'approved': approved,
      'assigned': assigned,
      'instructor_created': instructor_created,
      'instructor_userid': instructor_userid,
      'instructor_draft_status': instructor_draft_status,
    };
  }

  factory Rubric.fromMap(Map<String, dynamic> map) {
    return Rubric(
      ccid: map['ccid'] as int,
      title: map['title'] as String,
      type: map['type'] as int,
      active: map['active'] as int,
      approved: map['approved'] as int,
      assigned: map['assigned'] as int,
      instructor_created: map['instructor_created'] as int,
      instructor_userid: map['instructor_userid'] as int,
      instructor_draft_status: map['instructor_draft_status'] as int,
    );
  }
}
