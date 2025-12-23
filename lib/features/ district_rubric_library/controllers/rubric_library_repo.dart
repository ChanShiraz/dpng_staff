import 'package:dpng_staff/features/%20district_rubric_library/models/competency.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RubricLibraryRepo {
  final supabase = Supabase.instance.client;

   Future<List<Competency>> fetchCompetencies(int drlid) async {
    try {
      List<Competency>? competencies = [];
      final response = await supabase
          .from('integrated_rubrics_dpc')
          .select('dp_competencies(dpcid,dpc_label,dpc_heading)')
          .eq('drlid', drlid);
      for (var element in response) {
        competencies.add(Competency.fromMap(element['dp_competencies']));
      }
      return competencies;
    } catch (e) {
      print('error fetching competencies $e');
      return [];
    }
  }

  Future<List<String>> fetchStandards(int drlid) async {
    try {
      List<String>? standards = [];
      final response = await supabase
          .from('district_rubrics_p_standards')
          .select('parent_state_standards(standard_label,standard_description)')
          .eq('drlid', drlid);
      for (var element in response) {
        String competency = element['parent_state_standards']['standard_label'];
        standards.add(competency);
      }
      return standards;
    } catch (e) {
      print('error fetching standards $e');
      return [];
    }
  }

   Future<List<String>> fetchSciencStandards(int drlid) async {
    try {
      List<String>? standards = [];
      final response = await supabase
          .from('district_rubrics_ngss_pes')
          .select('ngss_performance_expectations(label)')
          .eq('drlid', drlid);
      for (var element in response) {
        String standard = element['ngss_performance_expectations']['label'];
        standards.add(standard);
      }
      return standards;
    } catch (e) {
      print('error fetching science standards $e');
      return [];
    }
  }
}