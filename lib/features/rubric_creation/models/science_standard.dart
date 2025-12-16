// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class ScienceStandard {
  final int ngpeid;
  final String label;
  final String expectation;
  final int domain;
  ScienceStandard({
    required this.ngpeid,
    required this.label,
    required this.expectation,
    required this.domain,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ngpeid': ngpeid,
      'label': label,
      'expectation': expectation,
      'domain': domain,
    };
  }

  factory ScienceStandard.fromMap(Map<String, dynamic> map) {
    return ScienceStandard(
      ngpeid: map['ngpeid'] as int,
      label: map['label'] as String,
      expectation: map['expectation'] as String,
      domain: map['domain'] as int,
    );
  }
}
