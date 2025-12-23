import 'package:dpng_staff/features/%20district_rubric_library/controllers/rubric_library_repo.dart';
import 'package:dpng_staff/features/%20district_rubric_library/models/competency.dart';
import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:dpng_staff/features/course/controller/course_overview_controller.dart';
import 'package:dpng_staff/features/district_summative_library/models/summative_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AssignCourseSummativeController extends GetxController {
  final supabase = Supabase.instance.client;
  final userid = Get.find<UserController>().currentUser.value!.userId!;
  final rubricRepo = RubricLibraryRepo();
  RxList<SummativeModel> summatives = <SummativeModel>[].obs;
  RxList<SummativeModel> selectedSummatives = <SummativeModel>[].obs;

  final CourseOverviewController courseOverviewController =
      Get.find<CourseOverviewController>();

  RxBool fetchingSummatives = false.obs;
  RxBool hasMoreSummmatives = true.obs;

  RxBool loadingMore = false.obs;
  RxBool hasMore = true.obs;

  final int _limit = 15;
  int _offset = 0;

  void fetchSummatives({bool loadMore = false}) async {
    if (fetchingSummatives.value || loadingMore.value) return;
    loadMore ? loadingMore.value = true : fetchingSummatives.value = true;
    //fetchingSummatives.value = true;
    try {
      final response = await supabase
          .from('inst_mod_summatives')
          .select('*,course_content_category(cc_category)')
          .eq('userid', userid)
          .eq('active', 1)
          .order('dmod_sum_id', ascending: false)
          .range(_offset, _offset + _limit - 1);

      if (response.isEmpty) {
        hasMore.value = false;
        return;
      }
      for (var element in response) {
        final drlid = element['drlid'];
        final List<Competency> competencies = await rubricRepo
            .fetchCompetencies(drlid);
        final standards = element['ccid'] == 4
            ? await rubricRepo.fetchSciencStandards(drlid)
            : await rubricRepo.fetchStandards(drlid);
        summatives.add(
          SummativeModel.fromMap(element, competencies, standards),
        );
      }
      _offset += _limit;

      if (response.length < _limit) {
        hasMore.value = false;
      }
    } catch (e) {
      debugPrint('error fetching summatives $e');
    } finally {
      fetchingSummatives.value = false;
      loadingMore.value = false;
    }
    // fetchingSummatives.value = false;
  }

  void toggleSummative(SummativeModel summative) {
    if (selectedSummatives.contains(summative)) {
      selectedSummatives.remove(summative);
    } else {
      selectedSummatives.add(summative);
    }
  }

  void clearSelectedSummatives() {
    selectedSummatives.clear();
  }

  void toggleAddAllSummatives() {
    if (selectedSummatives.length == summatives.length) {
      selectedSummatives.clear();
    } else {
      selectedSummatives.clear();
      selectedSummatives.assignAll(summatives);
    }
  }

  RxBool assigningSummatives = false.obs;
  Future<void> assignCourseSummative(int courseId) async {
    assigningSummatives.value = true;
    try {
      final res = await Supabase.instance.client.rpc(
        'assign_inst_summatives_to_course',
        params: {
          'p_dmod_sum_ids': selectedSummatives
              .map((e) => e.dmod_sum_id)
              .toList(),
          'p_a_cid': courseId,
        },
      );
      courseOverviewController.fetchSummatives(courseId);
      debugPrint('Assign summative response dumsumId $res');
    } catch (e) {
      debugPrint('Assign summative response error: $e');
    }
    assigningSummatives.value = false;
  }
}
