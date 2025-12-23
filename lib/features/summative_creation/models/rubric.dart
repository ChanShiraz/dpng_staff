// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:dpng_staff/features/rubric_creation/models/competency.dart';
import 'package:dpng_staff/features/rubric_creation/models/non_science_standard.dart';
import 'package:dpng_staff/features/rubric_creation/models/science_standard.dart';

class SummativeRubric {
  final int drlid;
  final String title;
  final List<Competency> competency;
  final List<NonScienceStandard>? nonScienceStandard;
  final List<ScienceStandard>? scienceStandard;
  SummativeRubric({
    required this.drlid,
    required this.title,
    required this.competency,
    this.nonScienceStandard,
    this.scienceStandard,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'drlid': drlid, 'title': title};
  }

  factory SummativeRubric.fromMap(
    Map<String, dynamic> map,
    List<Competency> competency,
    List<NonScienceStandard>? nonScienceStandard,
    List<ScienceStandard>? scienceStandard,
  ) {
    return SummativeRubric(
      drlid: map['drlid'] as int,
      title: map['title'] as String,
      competency: competency,
      nonScienceStandard: nonScienceStandard,
      scienceStandard: scienceStandard,
    );
  }
}
