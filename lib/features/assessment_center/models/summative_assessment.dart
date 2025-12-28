class SummativeAssessment {
  final int subid;
  final int userid;
  final String title;
  final DateTime date;
  final int a_cid;
  final int type;
  final String? pathLink;
  final String? text;
  final int dmod_sum_id; // <-- nullable
  final int assessed_by; // <-- nullable
  final String first;
  final String last;
  final String title1;
  final int course_type;
  final int drlid;
  final int ccid;

  SummativeAssessment({
    required this.subid,
    required this.userid,
    required this.title,
    required this.date,
    required this.type,
    required this.a_cid,
    this.pathLink,
    this.text,
    required this.first,
    required this.last,
    required this.title1,
    required this.course_type,
    required this.drlid,
    required this.ccid,
    required this.dmod_sum_id,
    required this.assessed_by,
  });

  factory SummativeAssessment.fromMap(Map<String, dynamic> map) {
    return SummativeAssessment(
      subid: map['subid'] as int,
      userid: map['userid'] as int,
      type: map['type'] as int,
      title: map['title'] as String,
      pathLink: map['path_link'] != null ? map['path_link'] as String : null,
      text: map['text'] != null ? map['text'] as String : null,
      date: DateTime.parse(map['date'].toString()),
      a_cid: map['a_cid'] as int,
      dmod_sum_id: map['dmod_sum_id'] as int,
      assessed_by: map['assessed_by'] as int,
      first: map['users']['first'] as String,
      last: map['users']['last'] as String,
      title1: map['alt_courses']['title1'] as String,
      ccid: map['alt_courses']['ccid'] as int,
      course_type: map['alt_courses']['course_type'] as int,
      drlid: map['alt_mod_summatives']['drlid'] as int,
    );
  }
}
