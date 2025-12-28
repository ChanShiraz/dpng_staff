// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PastFromative {
  final int fsubpastid;
  final DateTime date;
  final int status;
  final DateTime? assessed;
  PastFromative({
    required this.fsubpastid,
    required this.date,
    required this.status,
    required this.assessed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fsubpastid': fsubpastid,
      'date': date.millisecondsSinceEpoch,
      'status': status,
    };
  }

  factory PastFromative.fromMap(Map<String, dynamic> map) {
    return PastFromative(
      fsubpastid: map['fsubpastid'] as int,
      date: DateTime.parse(map['date']),
      status: map['status'] as int,
      assessed: map['assessed'] != null
          ? DateTime.parse(map['assessed'])
          : null,
    );
  }
}
