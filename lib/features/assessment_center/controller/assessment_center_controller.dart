import 'package:dpng_staff/features/assessment_center/controller/assessment_center_repo.dart';
import 'package:dpng_staff/features/assessment_center/models/formative_assessment.dart';
import 'package:dpng_staff/features/assessment_center/models/summative_assessment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AssessmentCenterController extends GetxController {
  final repo = AssessmentCenterRepo();

  RxList<SummativeAssessment> summativeAssessments =
      <SummativeAssessment>[].obs;

  RxBool fetchingSummativeAssessments = false.obs;
  RxString fetchSummativeError = ''.obs;
  RxString selected = 'Summatives'.obs;

  @override
  void onInit() {
    super.onInit();
    fetchSummativeAssessments();
    fetchFormativeAssessments();
  }

  Future<void> fetchSummativeAssessments() async {
    try {
      fetchingSummativeAssessments.value = true;
      fetchSummativeError.value = '';

      final assessments = await repo.fetchSummativeAssessments();
      summativeAssessments.assignAll(assessments);
    } catch (e, s) {
      fetchSummativeError.value = 'Failed to load summative assessments';
      debugPrint('Fetch summatives error: $e');
      debugPrintStack(stackTrace: s);
    } finally {
      fetchingSummativeAssessments.value = false;
    }
  }

  RxBool fetchingFormativeAssessments = false.obs;
  RxString fetchFormativeError = ''.obs;
  final formativeAssessments = <FormativeAssessment>[].obs;
  Future<void> fetchFormativeAssessments() async {
    try {
      fetchingFormativeAssessments.value = true;
      fetchFormativeError.value = '';

      final assessments = await repo.fetchFormativeAssessments();
      formativeAssessments.assignAll(assessments);
    } catch (e, s) {
      fetchFormativeError.value = 'Failed to load formative assessments';
      debugPrint('Fetch formatives error: $e');
      debugPrintStack(stackTrace: s);
    } finally {
      fetchingFormativeAssessments.value = false;
    }
  }

  // RxInt selectedToggleIndex = 0.obs;

  // void onTogglePressed(int index) {
  //   selectedToggleIndex.value = index;
  // }
}
