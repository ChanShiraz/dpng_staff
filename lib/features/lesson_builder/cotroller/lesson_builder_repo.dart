import 'package:dpng_staff/features/lesson_builder/models/ecbi.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_material.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_model.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_objective.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_tool_model.dart';
import 'package:dpng_staff/features/lesson_builder/models/tool.dart';
import 'package:dpng_staff/features/summative_assignment/models/lesson.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LessonBuilderRepo {
  final supabase = Supabase.instance.client;

  Future<int> insertLesson(LessonModel lesson) async {
    final response = await supabase
        .from('inst_mod_lessons')
        .insert(lesson.toMap())
        .select('dmod_lesson_id')
        .single();
    return response['dmod_lesson_id'];
  }

  Future<int> insertLessonObjective(LessonObjective objective) async {
    final response = await supabase
        .from('inst_mod_lesson_objectives')
        .insert(objective.toMap())
        .select('dmod_obj_id')
        .single();
    return response['dmod_obj_id'];
  }

  fetchTools() async {
    final reponse = await supabase
        .from('alt_tools')
        .select('alt_tool_id,description')
        .eq('active', 1);
    return reponse.map((e) => Tool.fromMap(e)).toList();
  }

  insertLessonTool(LessonToolModel tool) async {
    final response = await supabase
        .from('inst_mod_lesson_tools')
        .insert(tool.toMap())
        .select('dmod_tool_id')
        .single();
    debugPrint('lesson tools ${response['dmod_tool_id']}');
  }

  insertLessonMaterial(LessonMaterial material) async {
    final response = await supabase
        .from('inst_mod_lesson_material')
        .insert(material.toMap())
        .select('dmod_mat_id')
        .single();
    debugPrint('lesson material ${response['dmod_mat_id']}');
  }

  insertKnowledge(LessonMaterial knowledge) async {
    final response = await supabase
        .from('inst_mod_lesson_pmaterial')
        .insert(knowledge.toMap())
        .select('dmod_pmat_id')
        .single();
    debugPrint('prior knowledge ${response['dmod_pmat_id']}');
  }

  insertDifferential(LessonMaterial differential) async {
    final response = await supabase
        .from('inst_mod_lesson_dmaterial')
        .insert(differential.toMap())
        .select('dmod_dmat_id')
        .single();
    debugPrint('differential ${response['dmod_dmat_id']}');
  }

  insertFormative(LessonMaterial formative) async {
    final response = await supabase
        .from('inst_mod_lesson_formatives')
        .insert(formative.toMap())
        .select('dmod_form_id')
        .single();
    debugPrint('formative ${response['dmod_form_id']}');
  }

  fetchEcbi() async {
    final response = await supabase.from('ecbi').select().eq('active', 1);
    return response.map((e) => Ecbi.fromMap(e)).toList();
  }

  insertLessonEcbi(EcbiInsertModel ecbiInsert) async {
    final response = await supabase
        .from('inst_mod_lesson_ecbi')
        .insert(ecbiInsert.toMap())
        .select('dmod_ecbi_id')
        .single();
    debugPrint('lesson ecbi ${response['dmod_ecbi_id']}');
  }
}
