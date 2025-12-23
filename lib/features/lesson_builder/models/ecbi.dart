// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Ecbi {
  final int ecbi_id;
  final String ecbi_label;
  final String heading;
  final String description;
  Ecbi({
    required this.ecbi_id,
    required this.ecbi_label,
    required this.heading,
    required this.description,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ecbi_id': ecbi_id,
      'ecbi_label': ecbi_label,
      'heading': heading,
      'description': description,
    };
  }

  factory Ecbi.fromMap(Map<String, dynamic> map) {
    return Ecbi(
      ecbi_id: map['ecbi_id'] as int,
      ecbi_label: map['ecbi_label'] as String,
      heading: map['heading'] as String,
      description: map['description'] as String,
    );
  }
}

class EcbiInsertModel {
  final int ecbi_id;
  final String heading;
  final String description;
  final int dmod_lesson_id;
  final int modnum;
  EcbiInsertModel({
    required this.ecbi_id,
    required this.heading,
    required this.description,
    required this.dmod_lesson_id,
    required this.modnum,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ecbi_id': ecbi_id,
      'heading': heading,
      'description': description,
      'dmod_lesson_id': dmod_lesson_id,
      'modnum': modnum,
    };
  }

  factory EcbiInsertModel.fromMap(Map<String, dynamic> map) {
    return EcbiInsertModel(
      ecbi_id: map['ecbi_id'] as int,
      heading: map['heading'] as String,
      description: map['description'] as String,
      dmod_lesson_id: map['dmod_lesson_id'] as int,
      modnum: map['modnum'] as int,
    );
  }
}
