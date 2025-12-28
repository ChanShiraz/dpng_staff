// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class PastSummative {
  final int ssspid;
  final DateTime date;
  final double grade;
  final int status;
  final DateTime? assessed;
  PastSummative({
    required this.ssspid,
    required this.date,
    required this.grade,
    required this.status,
    required this.assessed,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ssspid': ssspid,
      'date': date.millisecondsSinceEpoch,
      'grade': grade,
      'status': status,
    };
  }

  factory PastSummative.fromMap(Map<String, dynamic> map) {
    return PastSummative(
      ssspid: map['ssspid'] as int,
      date: DateTime.parse(map['date']),
      grade: (map['grade'] as num).toDouble(),
      status: map['status'] as int,
      assessed: map['assessed'] != null
          ? DateTime.parse(map['assessed'])
          : null,
    );
  }
}
