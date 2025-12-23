// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dpng_staff/features/%20district_rubric_library/models/competency.dart';


class RubricModel {
  final int drlid;
  final int ccid;
  final String title;
  final String category;
  final List<Competency> competencies;
  final List<String> standards;
  RubricModel({
    required this.drlid,
    required this.ccid,
    required this.title,
    required this.category,
    required this.competencies,
    required this.standards,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'drlid': drlid,
      'ccid': ccid,
      'title': title,
      'category': category,
    };
  }

  factory RubricModel.fromMap(
    Map<String, dynamic> map,
    List<Competency> competencies,
    List<String> standards,
  ) {
    return RubricModel(
      standards: standards,
      competencies: competencies,
      drlid: map['drlid'] as int,
      ccid: map['ccid'] as int,
      title: map['title'] as String,
      category: map['course_content_category']['cc_category'] as String,
    );
  }
}
