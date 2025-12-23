class SummativeInstModel {
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
  final int ccid;
  final String course;
  final int userId;
  final int archived;
  final int active;

  SummativeInstModel({
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
  factory SummativeInstModel.fromMap(Map<String, dynamic> map) {
    return SummativeInstModel(
      modnum: map['modnum'],
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
    );
  }
}
