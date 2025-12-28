import 'package:dpng_staff/features/student_summative_work/models/graded_competency.dart';
import 'package:flutter/widgets.dart';

class SummativeSubmission {
  final int subid;
  final int dmodSumId;
  final int userid;
  final int assessedBy;
  final String title;
  final String description;
  final DateTime date;
  final int status;
  final int grade;
  final int weight;
  final int resubmit;
  final int type;
  final String pathLink;
  final String page;
  final DateTime assessed;
  final int aCid;
  final int learningYear;
  final int track;
  final String comment;
  final int studentViewed;
  final String reflection;
  final String? text;
  List<GradedCompetency> competencies;
  //other tables
  final String task;
  final String emerging_rubric;
  final String capable_rubric;
  final String bridging_rubric;
  final String proficient_rubric;
  final String advanced_rubric;
  final String teacherName;

  SummativeSubmission({
    required this.subid,
    required this.dmodSumId,
    required this.userid,
    required this.assessedBy,
    required this.title,
    required this.description,
    required this.date,
    required this.status,
    required this.grade,
    required this.weight,
    required this.resubmit,
    required this.type,
    required this.pathLink,
    required this.page,
    required this.assessed,
    required this.aCid,
    required this.learningYear,
    required this.track,
    required this.comment,
    required this.studentViewed,
    required this.reflection,
    this.text,
    required this.task,
    required this.advanced_rubric,
    required this.bridging_rubric,
    required this.capable_rubric,
    required this.emerging_rubric,
    required this.proficient_rubric,
    required this.teacherName,
    required this.competencies,
  });

  factory SummativeSubmission.fromJson(
    Map<String, dynamic> json,
    List<GradedCompetency> competencies,
  ) {
    return SummativeSubmission(
      subid: json['subid'],
      dmodSumId: json['dmod_sum_id'],
      userid: json['userid'],
      assessedBy: json['assessed_by'],
      title: json['title'],
      description: json['description'],
      date: DateTime.parse(json['date']),
      status: json['status'],
      grade: json['grade'],
      weight: json['weight'],
      resubmit: json['resubmit'],
      type: json['type'],
      pathLink: json['path_link'],
      page: json['page'],
      assessed: DateTime.parse(json['assessed']),
      aCid: json['a_cid'],
      learningYear: json['learning_year'],
      track: json['track'],
      comment: json['comment'],
      studentViewed: json['student_viewed'],
      reflection: json['reflection'],
      text: json['text'],
      task: json['alt_mod_summatives']['task'],
      advanced_rubric: json['alt_mod_summatives']['advanced_rubric'],
      bridging_rubric: json['alt_mod_summatives']['bridging_rubric'],
      capable_rubric: json['alt_mod_summatives']['capable_rubric'],
      emerging_rubric: json['alt_mod_summatives']['emerging_rubric'],
      proficient_rubric: json['alt_mod_summatives']['proficient_rubric'],
      teacherName: '${json['users']['first']} ${json['users']['last']}',
      competencies: competencies
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "subid": subid,
      "dmod_sum_id": dmodSumId,
      "userid": userid,
      "assessed_by": assessedBy,
      "title": title,
      "description": description,
      "date": date,
      "status": status,
      "grade": grade,
      "weight": weight,
      "resubmit": resubmit,
      "type": type,
      "path_link": pathLink,
      "page": page,
      "assessed": assessed,
      "a_cid": aCid,
      "learning_year": learningYear,
      "track": track,
      "comment": comment,
      "student_viewed": studentViewed,
      "reflection": reflection,
      "text": text,
    };
  }
}
