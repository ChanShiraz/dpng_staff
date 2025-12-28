import 'package:dpng_staff/features/assessment_center/models/formative_assessment.dart';
import 'package:dpng_staff/features/assessment_center/models/summative_assessment.dart';
import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AssessmentCenterRepo {
  final supabase = Supabase.instance.client;
  final userId = Get.find<UserController>().currentUser.value!.userId!;

  Future<List<SummativeAssessment>> fetchSummativeAssessments() async {
    final response = await supabase
        .from('summative_student_submissions')
        .select(
          '*,users!summative_student_submissions_userid_fkey(first,last),alt_courses(title1,course_type,ccid),alt_mod_summatives(drlid)',
        )
        .eq('assessed_by', userId)
        .eq('status', 0);
    //debugPrint('summative response $response');
    return response.map((e) => SummativeAssessment.fromMap(e)).toList();
  }

  Future<List<FormativeAssessment>> fetchFormativeAssessments() async {
    final response = await supabase
        .from('formative_student_submissions')
        .select(
          '*,users!formative_student_submissions_userid_fkey(first,last),alt_courses(title1,course_type,ccid)',
        )
        .eq('assessed_by', userId)
        .eq('status', 0);
    // debugPrint('formative response $response');
    return response.map((e) => FormativeAssessment.fromMap(e)).toList();
  }
}
