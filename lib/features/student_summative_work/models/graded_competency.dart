// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GradedCompetency {
  final int subid;
  final int dpcid;
  final int assessment;
  final String dpc_label;
  final String dpc_heading;
  final String dpc_description;
  GradedCompetency({
    required this.subid,
    required this.dpcid,
    required this.assessment,
    required this.dpc_label,
    required this.dpc_heading,
    required this.dpc_description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'subid': subid,
      'dpcid': dpcid,
      'assessment': assessment,
      'dpc_label': dpc_label,
      'dpc_heading': dpc_heading,
    };
  }

  factory GradedCompetency.fromMap(Map<String, dynamic> map) {
    return GradedCompetency(
      subid: map['subid'] as int,
      dpcid: map['dpcid'] as int,
      assessment: map['assessment'] as int,
      dpc_label: map['dp_competencies']['dpc_label'] as String? ?? '',
      dpc_heading: map['dp_competencies']['dpc_heading'] as String? ?? '',
      dpc_description: map['dp_competencies']['dpc_description'] as String? ?? '',
    );
  }
}
