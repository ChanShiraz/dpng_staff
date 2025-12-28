import 'package:dpng_staff/features/student_summative_work/models/graded_competency.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SummativeWorkRepo {
  final supabase = Supabase.instance.client;

  Future<List<GradedCompetency>> fetchCompetencyWork(int subid) async {
    final response = await supabase
        .from('summative_dpcid')
        .select(
          'subid,dpcid,assessment,dp_competencies(dpcid,dpc_label,dpc_heading,dpc_description)',
        )
        .eq('subid', subid);
    return response.map((e) => GradedCompetency.fromMap(e)).toList();
  }
}
