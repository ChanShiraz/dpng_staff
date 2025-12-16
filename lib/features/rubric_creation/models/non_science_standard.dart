// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class NonScienceStandard {
  final int p_standid;
  final String standard_label;
  final String standard_description;
  final String scope;
  NonScienceStandard({
    required this.p_standid,
    required this.standard_label,
    required this.standard_description,
    required this.scope,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'p_standid': p_standid,
      'standard_label': standard_label,
      'standard_description': standard_description,
    };
  }

  factory NonScienceStandard.fromMap(Map<String, dynamic> map, String scope) {
    return NonScienceStandard(
      p_standid: map['p_standid'] as int,
      standard_label: map['standard_label'] as String,
      standard_description: map['standard_description'] as String,
      scope: scope,
    );
  }
}
