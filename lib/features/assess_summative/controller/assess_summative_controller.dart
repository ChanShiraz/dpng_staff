// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dpng_staff/features/home/controller/courses_controller.dart';
import 'package:dpng_staff/features/home/controller/summative_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:dpng_staff/features/assess_summative/controller/assess_summative_repo.dart';
import 'package:dpng_staff/features/assess_summative/models/past_summative.dart';
import 'package:dpng_staff/features/assessment_center/controller/assessment_center_controller.dart';
import 'package:dpng_staff/features/assessment_center/models/summative_assessment.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/summative_card.dart';
import 'package:dpng_staff/features/rubric_creation/models/competency.dart';
import 'package:dpng_staff/features/rubric_creation/models/non_science_standard.dart';
import 'package:dpng_staff/features/rubric_creation/models/science_standard.dart';

class AssessSummativeController extends GetxController {
  AssessSummativeController({required this.a_cid});

  final int a_cid;
  final assementCenterController = Get.find<AssessmentCenterController>();
  final coursesController = Get.find<CoursesController>();
  final summativeController = Get.find<SummativeController>();
  final commentController = TextEditingController();
  final repo = AssessSummativeRepo();
  RxList<PastSummative> pastSummatives = <PastSummative>[].obs;
  RxBool fetchingPastSummatives = false.obs;
  RxString fetchPastSummativesError = ''.obs;

  void fetchPastSummatives(int subid) async {
    fetchingPastSummatives.value = true;
    fetchPastSummativesError.value = '';
    try {
      final summatives = await repo.fetchPastSummatives(subid);
      pastSummatives.value = summatives;
      debugPrint('past summatives ${pastSummatives.length}');
    } catch (e) {
      fetchPastSummativesError.value = 'Failed to fetch past summatives';
      debugPrint('error fetchig past summatives: $e');
    } finally {
      fetchingPastSummatives.value = false;
    }
  }

  //competencies
  RxList<Competency> competencies = <Competency>[].obs;
  RxBool fetchingCompetencies = false.obs;
  RxString fetchCompetenciesError = ''.obs;

  void fetchCompetencies(int drlid) async {
    fetchingCompetencies.value = true;
    fetchCompetenciesError.value = '';
    try {
      final response = await repo.fetchCompetencies(drlid);
      competencies.value = response;
      debugPrint('competencies ${competencies.length}');
    } catch (e) {
      fetchCompetenciesError.value = 'Failed to fetch competencies';
      debugPrint('error fetching competencies: $e');
    } finally {
      fetchingCompetencies.value = false;
    }
    selectedCompetencyLevels.addAll(
      competencies.map((c) => CompetencySelection(c.dpcid, 6)).toList(),
    );
  }

  RxList<CompetencySelection> selectedCompetencyLevels =
      <CompetencySelection>[].obs;

  void selectCompetencyLevel(int dpcid, int level) {
    final existing = selectedCompetencyLevels.firstWhereOrNull(
      (element) => element.dpcid == dpcid,
    );
    if (existing != null) {
      existing.selectedLevel = level;
      selectedCompetencyLevels.refresh();
    } else {
      selectedCompetencyLevels.add(CompetencySelection(dpcid, level));
    }
  }

  //science standards
  RxList<ScienceStandard> scienceStandards = <ScienceStandard>[].obs;
  RxBool fetchingScienceStandards = false.obs;
  RxString fetchScienceStandardsError = ''.obs;

  void fetchScienceStandards(int drlid) async {
    fetchingScienceStandards.value = true;
    fetchScienceStandardsError.value = '';
    try {
      final response = await repo.fetchScienceStandards(drlid);
      scienceStandards.value = response;
      debugPrint('science standards ${scienceStandards.length}');
    } catch (e) {
      fetchScienceStandardsError.value = 'Failed to fetch science standards';
      debugPrint('error fetching science standards: $e');
    } finally {
      fetchingScienceStandards.value = false;
    }
    selectedScienceStandardLevels.addAll(
      scienceStandards
          .map((c) => ScienceStandardSelection(c.ngpeid, 6))
          .toList(),
    );
  }

  RxList<ScienceStandardSelection> selectedScienceStandardLevels =
      <ScienceStandardSelection>[].obs;

  void selectScienceStandardLevel(int ngpeid, int level) {
    final existing = selectedScienceStandardLevels.firstWhereOrNull(
      (element) => element.ngpeid == ngpeid,
    );
    if (existing != null) {
      existing.selectedLevel = level;
      selectedScienceStandardLevels.refresh();
    } else {
      selectedScienceStandardLevels.add(
        ScienceStandardSelection(ngpeid, level),
      );
    }
  }

  //standards
  RxList<NonScienceStandard> standards = <NonScienceStandard>[].obs;
  RxBool fetchingStandards = false.obs;
  RxString fetchStandardsError = ''.obs;

  void fetchStandards(int drlid) async {
    fetchingStandards.value = true;
    fetchStandardsError.value = '';
    try {
      final response = await repo.fetchStandards(drlid);
      standards.value = response;
      debugPrint('standards ${standards.length}');
    } catch (e) {
      fetchStandardsError.value = 'Failed to fetch standards';
      debugPrint('error fetching standards: $e');
    } finally {
      fetchingStandards.value = false;
    }
    selectedStandardLevels.addAll(
      standards.map((c) => StandardSelection(c.p_standid, 6)).toList(),
    );
  }

  RxList<StandardSelection> selectedStandardLevels = <StandardSelection>[].obs;

  void selectStandardLevel(int pStandid, int level) {
    final existing = selectedStandardLevels.firstWhereOrNull(
      (element) => element.p_standid == pStandid,
    );
    if (existing != null) {
      existing.selectedLevel = level;
      selectedStandardLevels.refresh();
    } else {
      selectedStandardLevels.add(StandardSelection(pStandid, level));
    }
  }

  RxInt resubmitStatus = (-1).obs;
  RxBool submittingAssessment = false.obs;

  void submitAssessment(SummativeAssessment summative) async {
    final error = validateBeforeSubmit(summative);
    if (error != null) {
      Get.rawSnackbar(message: error);
      return;
    }
    try {
      submittingAssessment.value = true;
      final List<Map<String, dynamic>> dpPayload = selectedCompetencyLevels
          .map((c) => {'dpcid': c.dpcid, 'assessment': c.selectedLevel})
          .toList();
      final List<Map<String, dynamic>> statePayload = summative.ccid == 4
          ? selectedScienceStandardLevels
                .map((c) => {'pid': c.ngpeid, 'assessment': c.selectedLevel})
                .toList()
          : selectedStandardLevels
                .map((c) => {'pid': c.p_standid, 'assessment': c.selectedLevel})
                .toList();
      final response = await repo.supabase.rpc(
        'process_summative_assessment_v1',
        params: {
          'p_subid': summative.subid,
          'p_dmod_sum_id': summative.dmod_sum_id,
          'p_a_cid': summative.a_cid,
          'p_course_ccid': summative.ccid,
          'p_student_userid': summative.userid,
          'p_assessed_by': summative.assessed_by,
          'p_acceptance': resubmitStatus.value,
          'p_comment': commentController.text,
          'p_dp': dpPayload,
          'p_state': statePayload,
        },
      );
      debugPrint('submission response: $response');
      assementCenterController.fetchSummativeAssessments();
      coursesController.updateSummativeBubbleCounts(aCid: summative.a_cid);
      summativeController.calWeekProgress();
      showDesktopToast2('Assessment Submitted Successfully!');
      Get.back();
    } catch (e) {
      debugPrint('error submitting assessment: $e');
      Get.rawSnackbar(message: 'Something went wrong! Please try again');
    }
    submittingAssessment.value = false;
  }

  String? validateBeforeSubmit(SummativeAssessment summative) {
    if (commentController.text.trim().isEmpty) {
      return 'Comment is required';
    }
    if (resubmitStatus.value == -1) {
      return 'Acceptance status is required';
    }
    if (selectedCompetencyLevels.isEmpty) {
      return 'At least one DP competency is required';
    }
    if (selectedCompetencyLevels.any((e) => e.selectedLevel <= 0)) {
      return 'All DP competencies must have an assessment';
    }
    final allDpNotAssessed = selectedCompetencyLevels.every(
      (e) => e.selectedLevel == 6,
    );
    if (allDpNotAssessed) {
      return 'At least one DP competency must be assessed';
    }
    final hasStateStandards = summative.ccid == 4
        ? selectedScienceStandardLevels.isNotEmpty
        : selectedStandardLevels.isNotEmpty;
    if (!hasStateStandards) {
      return 'At least one State standard is required';
    }
    final invalidState = summative.ccid == 4
        ? selectedScienceStandardLevels.any((e) => e.selectedLevel <= 0)
        : selectedStandardLevels.any((e) => e.selectedLevel <= 0);

    if (invalidState) {
      return 'All State standards must have an assessment';
    }
    return null;
  }
}

class CompetencySelection {
  final int dpcid;
  int selectedLevel;
  CompetencySelection(this.dpcid, this.selectedLevel);
}

class ScienceStandardSelection {
  final int ngpeid;
  int selectedLevel;
  ScienceStandardSelection(this.ngpeid, this.selectedLevel);
}

class StandardSelection {
  final int p_standid;
  int selectedLevel;
  StandardSelection(this.p_standid, this.selectedLevel);
}
