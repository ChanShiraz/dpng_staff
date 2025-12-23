import 'package:dpng_staff/features/grades/models/competency.dart'
    hide Competency;
import 'package:dpng_staff/features/rubric_creation/models/competency.dart';
import 'package:dpng_staff/features/rubric_creation/models/course_category.dart';
import 'package:dpng_staff/features/rubric_creation/models/non_science_standard.dart';
import 'package:dpng_staff/features/rubric_creation/models/science_standard.dart';
import 'package:dpng_staff/features/summative_creation/models/resource_row_data.dart';
import 'package:dpng_staff/features/summative_creation/models/rubric.dart'
    show RubricModel, SummativeRubric;
import 'package:dpng_staff/features/summative_creation/models/summative_inst_model.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SummativeCreationRepo {
  final supabase = Supabase.instance.client;
  Future<List<CourseCategory>> fetchCategories() async {
    final response = await supabase
        .from('course_content_category')
        .select('ccid,cc_category')
        .eq('active', true);

    return response
        .map<CourseCategory>((e) => CourseCategory.fromMap(e))
        .toList();
  }

  Future<List<SummativeRubric>> fetchRubrics({
    required int ccid,
    required int userId,
  }) async {
    final response = await supabase
        .from('district_rubric_library')
        .select('drlid,title')
        .eq('ccid', ccid)
        .eq('active', 1)
        .eq('approved', 1)
        .or('instructor_created.eq.0,instructor_userid.eq.$userId');

    return Future.wait(
      response.map((e) async {
        final competency = await fetchCompetency(e['drlid']);
        if (ccid == 4) {
          final scienceStandard = await fetchScienceStandards(e['drlid']);
          return SummativeRubric.fromMap(e, competency, null, scienceStandard);
        }
        final nonScienceStandard = await fetchNonScienceStandards(e['drlid']);
        return SummativeRubric.fromMap(e, competency, nonScienceStandard, null);
      }),
    );
  }

  Future<List<Competency>> fetchCompetency(int drlid) async {
    final response = await supabase
        .from('integrated_rubrics_dpc')
        .select(
          'dp_competencies(dpcid,dpc_label,dpc_heading,dpc_description,ccid)',
        )
        .eq('drlid', drlid)
        .eq('dp_competencies.active', true);
    return response
        .map<Competency>((e) => Competency.fromMap(e['dp_competencies'], ''))
        .toList();
  }

  Future<List<NonScienceStandard>> fetchNonScienceStandards(int drlid) async {
    final response = await supabase
        .from('district_rubrics_p_standards')
        .select(
          'parent_state_standards(p_standid,standard_label,standard_description)',
        )
        .eq('drlid', drlid)
        .eq('parent_state_standards.active', 1);
    return response
        .map<NonScienceStandard>(
          (e) => NonScienceStandard.fromMap(e['parent_state_standards'], ''),
        )
        .toList();
  }

  Future<List<ScienceStandard>> fetchScienceStandards(int drlid) async {
    final response = await supabase
        .from('district_rubrics_ngss_pes')
        .select(
          'parent_state_standards(p_standid,standard_label,standard_description)',
        )
        .eq('drlid', drlid)
        .eq('parent_state_standards.active', 1);
    return response
        .map<ScienceStandard>(
          (e) => ScienceStandard.fromMap(e['parent_state_standards']),
        )
        .toList();
  }

  Future<int> insertSummative(SummativeInstModel summative) async {
    final data = await supabase
        .from('inst_mod_summatives')
        .insert(summative.toMap())
        .select('dmod_sum_id')
        .single();
    return data['dmod_sum_id'] as int;
  }

  insertResources(List<ResourceRowData> resources, final int dumsumId) async {
    for (var element in resources) {
      await supabase
          .from('inst_mod_summative_resources')
          .insert(element.toMap(dumsumId));
    }
  }
}
