// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CourseCategory {
  final int ccid;
  final String title;
  CourseCategory({required this.ccid, required this.title});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'ccid': ccid, 'title': title};
  }

  factory CourseCategory.fromMap(Map<String, dynamic> map) {
    return CourseCategory(
      ccid: map['ccid'] as int,
      title: map['cc_category'] as String,
    );
  }
}
