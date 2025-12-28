import 'dart:io';

import 'package:dpng_staff/features/assess_summative/widgets/final_submission_card.dart';
import 'package:dpng_staff/features/student_summative_work/controller/summative_work_repo.dart';
import 'package:dpng_staff/features/student_summative_work/models/graded_competency.dart';
import 'package:dpng_staff/features/student_summative_work/models/summative_submission.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SummativeWorkDetailController extends GetxController {
  final supbase = Supabase.instance.client;
  RxBool fetchingSummative = false.obs;
  RxString selectedRubric = 'PROFICIENT'.obs;
  final repo = SummativeWorkRepo();

  Rx<SummativeSubmission?> submission = Rx<SummativeSubmission?>(null);

  void fetchSummativeSubmission(int subid) async {
    fetchingSummative.value = true;
    try {
      final query = supbase
          .from('summative_student_submissions')
          .select(
            '*,alt_mod_summatives(task,advanced_rubric,proficient_rubric,bridging_rubric,capable_rubric,emerging_rubric),users!summative_student_submissions_assessed_by_fkey(first,last)',
          )
          .eq('subid', subid)
          .single();
      final response = await query;
      if (response.isNotEmpty) {
        debugPrint('object');
        List<GradedCompetency> competencies = await repo.fetchCompetencyWork(
          subid,
        );
        for (var element in competencies) {
          debugPrint('subid $subid competencies ${element.dpc_heading}');
        }
        submission.value = SummativeSubmission.fromJson(response, competencies);
      }
    } catch (e) {
      debugPrint('Error loading summative submission $e');
    }
    fetchingSummative.value = false;
  }

  final List<String> rubricLevels = [
    "EMERGING",
    "CAPABLE",
    "BRIDGING",
    "PROFICIENT",
    "METACOGNITION",
    "ADVANCED",
  ];
}
