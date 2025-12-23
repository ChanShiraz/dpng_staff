
import '../../ district_rubric_library/models/competency.dart' show Competency;

class SummativeModel {
  final int dmod_sum_id;
  final int ccid;
  final int modnum;
  final int altid;
  final int aCid;
  final String title;
  final String task;
  final String emergingRubric;
  final String capableRubric;
  final String bridgingRubric;
  final String proficientRubric;
  final String advancedRubric;
  final int drlid;
  final String course;
  final int userId;
  final int archived;
  final int active;
  List<String> standards;
  List<Competency> competencies;
  final String subject;

  SummativeModel({
    required this.dmod_sum_id,
    required this.modnum,
    required this.altid,
    required this.aCid,
    required this.title,
    required this.task,
    required this.emergingRubric,
    required this.capableRubric,
    required this.bridgingRubric,
    required this.proficientRubric,
    required this.advancedRubric,
    required this.drlid,
    required this.ccid,
    required this.course,
    required this.userId,
    required this.archived,
    required this.active,
    required this.competencies,
    required this.standards,
    required this.subject
  });

  /// Convert model → Supabase insert map
  Map<String, dynamic> toMap() {
    return {
      'modnum': modnum,
      'altid': altid,
      'a_cid': aCid,
      'title': title,
      'task': task,
      'emerging_rubric': emergingRubric,
      'capable_rubric': capableRubric,
      'bridging_rubric': bridgingRubric,
      'proficient_rubric': proficientRubric,
      'advanced_rubric': advancedRubric,
      'drlid': drlid,
      'ccid': ccid,
      'course': course,
      'userid': userId,
      'archived': archived,
      'active': active,
    };
  }

  /// Optional: Supabase row → model
  factory SummativeModel.fromMap(
    Map<String, dynamic> map,
    List<Competency> competencies,
    List<String> standards,
  ) {
    return SummativeModel(
      competencies: competencies,
      standards: standards,
      modnum: map['modnum'],
      dmod_sum_id: map['dmod_sum_id'],
      altid: map['altid'],
      aCid: map['a_cid'],
      title: map['title'],
      task: map['task'],
      emergingRubric: map['emerging_rubric'],
      capableRubric: map['capable_rubric'],
      bridgingRubric: map['bridging_rubric'],
      proficientRubric: map['proficient_rubric'],
      advancedRubric: map['advanced_rubric'],
      drlid: map['drlid'],
      ccid: map['ccid'],
      course: map['course'],
      userId: map['userid'],
      archived: map['archived'],
      active: map['active'],
      subject: map['course_content_category']['cc_category'],
    );
  }
}
