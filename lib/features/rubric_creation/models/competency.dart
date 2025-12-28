// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Competency {
  final int dpcid;
  final String dpc_label;
  final String dpc_heading;
  final String dpc_description;
  int? selectedLevel;
  String scope;
  Competency({
    required this.dpcid,
    required this.dpc_label,
    required this.dpc_heading,
    required this.dpc_description,
    required this.scope,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'dpcid': dpcid,
      'dpc_label': dpc_label,
      'dpc_heading': dpc_heading,
      'dpc_description': dpc_description,
    };
  }

  factory Competency.fromMap(Map<String, dynamic> map, String scope) {
    return Competency(
      scope: scope,
      dpcid: map['dpcid'] as int,
      dpc_label: map['dpc_label'] as String,
      dpc_heading: map['dpc_heading'] as String,
      dpc_description: map['dpc_description'] as String,
    );
  }
}
