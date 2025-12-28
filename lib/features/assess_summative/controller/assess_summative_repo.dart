import 'package:dpng_staff/features/assess_summative/models/past_summative.dart';
import 'package:dpng_staff/features/rubric_creation/models/competency.dart';
import 'package:dpng_staff/features/rubric_creation/models/non_science_standard.dart';
import 'package:dpng_staff/features/rubric_creation/models/science_standard.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AssessSummativeRepo {
  final supabase = Supabase.instance.client;

  Future<List<PastSummative>> fetchPastSummatives(int subid) async {
    final response = await supabase
        .from('summative_student_submissions_past')
        .select('ssspid, date, grade, status, assessed')
        .eq('subid', subid);
    return response.map((e) => PastSummative.fromMap(e)).toList();
  }

  Future<List<Competency>> fetchCompetencies(int drlid) async {
    final response = await supabase
        .from('integrated_rubrics_dpc')
        .select('dp_competencies(dpcid,dpc_label,dpc_heading,dpc_description)')
        .eq('drlid', drlid);
    return response
        .map((e) => Competency.fromMap(e['dp_competencies'], 'summative'))
        .toList();
  }

  Future<List<ScienceStandard>> fetchScienceStandards(int drlid) async {
    final response = await supabase
        .from('district_rubrics_ngss_pes')
        .select('ngss_performance_expectations(*)')
        .eq('drlid', drlid);
    return response
        .map((e) => ScienceStandard.fromMap(e['ngss_performance_expectations']))
        .toList();
  }

  Future<List<NonScienceStandard>> fetchStandards(int drlid) async {
    final response = await supabase
        .from('district_rubrics_p_standards')
        .select('parent_state_standards(*)')
        .eq('drlid', drlid);
    return response
        .map((e) => NonScienceStandard.fromMap(e['parent_state_standards'], ''))
        .toList();
  }
}
