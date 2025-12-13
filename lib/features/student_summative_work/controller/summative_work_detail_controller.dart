import 'dart:io';

import 'package:dpng_staff/features/student_summative_work/models/summative_submission.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SummativeWorkDetailController extends GetxController {
  final supbase = Supabase.instance.client;
  RxBool isLoading = false.obs;
  RxString selectedRubric = 'PROFICIENT'.obs;

  Rx<SummativeSubmission?> submission = Rx<SummativeSubmission?>(null);

  void loadSummativeSubmission(int subid) async {
    isLoading.value = true;
    try {
      final query = supbase
          .from('summative_student_submissions')
          .select(
            '*,alt_mod_summatives(task,advanced_rubric,proficient_rubric,bridging_rubric,capable_rubric,emerging_rubric),users(first,last)',
          )
          .eq('subid', subid)
          .single();
      final response = await query;
      if (response.isNotEmpty) {
        submission.value = SummativeSubmission.fromJson(response);
      }
    } catch (e) {
      print('Error loading summative submission $e');
    }
    isLoading.value = false;
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
