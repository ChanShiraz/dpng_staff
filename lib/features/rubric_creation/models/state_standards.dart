// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class StateStandard {
  final int dprid;
  final int dplvlid;
  final String rubric_description;
  StateStandard({
    required this.dprid,
    required this.dplvlid,
    required this.rubric_description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dprid': dprid,
      'dplvlid': dplvlid,
      'rubric_description': rubric_description,
    };
  }

  factory StateStandard.fromMap(Map<String, dynamic> map) {
    return StateStandard(
      dprid: map['dprid'] as int,
      dplvlid: map['dplvlid'] as int,
      rubric_description: map['rubric_description'] as String,
    );
  }
}
