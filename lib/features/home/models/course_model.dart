// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ui';

import 'package:dpng_staff/features/home/models/summative_bubble_counts.dart';

class CourseModel {
  final int a_cid;
  final int course_type;
  final int cid;
  final int ccid;
  final String title1;
  final String color;
  final String category;
  final String overview1;
  SummativeBubbleCounts summativeBubbleCounts;
  SummativeBubbleCounts formativeBubbleCounts;
  CourseModel({
    required this.a_cid,
    required this.course_type,
    required this.cid,
    required this.ccid,
    required this.title1,
    required this.color,
    required this.category,
    required this.summativeBubbleCounts,
    required this.formativeBubbleCounts,
    required this.overview1
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'a_cid': a_cid,
      'cid': cid,
      'ccid': ccid,
      'title1': title1,
    };
  }

  factory CourseModel.fromMap(
    Map<String, dynamic> map,
    SummativeBubbleCounts summativeBubbleCounts,
    SummativeBubbleCounts formativeBubbleCounts,
  ) {
    final categoryTable = map['course_content_category'];

    return CourseModel(
      a_cid: map['a_cid'] as int,
      cid: map['cid'] as int,
      course_type: map['course_type'] as int,
      ccid: map['ccid'] as int,
      title1: map['title1'] as String,
      overview1: map['overview1'] as String,
      color: categoryTable != null
          ? categoryTable['color'] as String
          : '#CCCCCC',
      category: categoryTable != null ? categoryTable['cc_category'] : '',
      summativeBubbleCounts: summativeBubbleCounts,
      formativeBubbleCounts: formativeBubbleCounts,
    );
  }
}
