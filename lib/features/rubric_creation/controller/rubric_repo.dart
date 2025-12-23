import 'package:dpng_staff/features/rubric_creation/models/rubric.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RubricRepo {
  final supabase = Supabase.instance.client;

  Future<int> insertRubric(Rubric rubric) async {
    final response = await supabase
        .from('district_rubric_library')
        .insert(rubric.toMap())
        .select('drlid');
    return response[0]['drlid'] as int;
  }

  Future<void> insertIntegratedRubrics({
    required int drlid,
    required String emerging,
    required String capable,
    required String bridging,
    required String proficient,
    required String advanced,
  }) async {
    await supabase.from('integrated_rubrics').insert([
      {'drlid': drlid, 'dplvlid': 2, 'integrated_rubric_description': emerging},
      {'drlid': drlid, 'dplvlid': 3, 'integrated_rubric_description': capable},
      {'drlid': drlid, 'dplvlid': 4, 'integrated_rubric_description': bridging},
      {
        'drlid': drlid,
        'dplvlid': 5,
        'integrated_rubric_description': proficient,
      },
      {'drlid': drlid, 'dplvlid': 6, 'integrated_rubric_description': advanced},
    ]);
  }

  insertCompetecy(int drlid, int dpcid) async {
    await supabase.from('integrated_rubrics_dpc').insert([
      {'dpcid': dpcid, 'drlid': drlid},
    ]);
  }

  insertScienceStandards(int drlid, int ngpeid) async {
    await supabase.from('district_rubrics_ngss_pes').insert([
      {'ngpeid': ngpeid, 'drlid': drlid},
    ]);
  }

  insertStandards(int drlid, int pStandid) async {
    await supabase.from('district_rubrics_p_standards').insert([
      {'p_standid': pStandid, 'drlid': drlid},
    ]);
  }
}
