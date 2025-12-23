import 'dart:math';

import 'package:dpng_staff/features/%20district_rubric_library/controllers/rubric_library_repo.dart';
import 'package:dpng_staff/features/%20district_rubric_library/models/competency.dart';
import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../models/rubric_model.dart';

class DistrictRubricController extends GetxController {
  final repo = RubricLibraryRepo();
  final supabase = Supabase.instance.client;
  final userId = Get.find<UserController>().currentUser.value!.userId!;
  var rubrics = <RubricModel>[].obs;
  var selectedRubric = Rxn<RubricModel>();
  RxBool fetchingRubrics = false.obs;

  RxBool hasMoreRubrics = true.obs;

  RxBool loadingMore = false.obs;
  RxBool hasMore = true.obs;

  final int _limit = 15;
  int _offset = 0;

  // void fetchRubrics() async {
  //   fetchingRubrics.value = true;
  //   try {
  //     final response = await supabase
  //         .from('district_rubric_library')
  //         .select('drlid,ccid,title,course_content_category(cc_category)')
  //         .or(
  //           '''and(active.eq.1,instructor_created.eq.0),and(active.eq.1,instructor_created.eq.1,instructor_userid.eq.$userId),and(active.eq.0,instructor_created.eq.1,instructor_userid.eq.$userId,instructor_draft_status.eq.1)''',
  //         )
  //         .limit(10);
  //     for (var element in response) {
  //       int drlid = element['drlid'];
  //       List<Competency>? competencies = await fetchCompetencies(drlid);
  //       List<String>? standards = element['ccid'] == 4
  //           ? await fetchSciencStandards(drlid)
  //           : await fetchStandards(drlid);
  //       rubrics.add(RubricModel.fromMap(element, competencies, standards));
  //     }
  //     print(rubrics[1].drlid);
  //   } catch (e) {
  //     print('Error fetching rubrics $e');
  //   }
  //   fetchingRubrics.value = false;
  // }

  Future<void> fetchRubrics({bool loadMore = false}) async {
    if (fetchingRubrics.value || loadingMore.value) return;

    loadMore ? loadingMore.value = true : fetchingRubrics.value = true;

    try {
      final response = await supabase
          .from('district_rubric_library')
          .select('drlid,ccid,title,course_content_category(cc_category)')
          .or(
            '''and(active.eq.1,instructor_created.eq.0),and(active.eq.1,instructor_created.eq.1,instructor_userid.eq.$userId),and(active.eq.0,instructor_created.eq.1,instructor_userid.eq.$userId,instructor_draft_status.eq.1)''',
          )
          .range(_offset, _offset + _limit - 1)
          .order('drlid', ascending: false);

      if (response.isEmpty) {
        hasMore.value = false;
        return;
      }

      for (var element in response) {
        int drlid = element['drlid'];

        final competencies = await repo.fetchCompetencies(drlid);
        final standards = element['ccid'] == 4
            ? await repo.fetchSciencStandards(drlid)
            : await repo.fetchStandards(drlid);

        rubrics.add(RubricModel.fromMap(element, competencies, standards));
      }

      _offset += _limit;

      if (response.length < _limit) {
        hasMore.value = false;
      }
    } catch (e) {
      print('Error fetching rubrics: $e');
    } finally {
      fetchingRubrics.value = false;
      loadingMore.value = false;
    }
  }

  RxBool fetchingRubricText = false.obs;
  // RxString rubricText = ''.obs;
  Future<String> fetchRubricText(int dpcid, int dplvlid) async {
    fetchingRubricText.value = true;
    try {
      final response = await supabase
          .from('dp_rubrics')
          .select('rubric_description')
          .eq('dpcid', dpcid)
          .eq('dplvlid', dplvlid)
          .single();

      return response['rubric_description'] as String;
    } catch (e) {
      print('error fetching rubric text $e');
      return '';
    } finally {
      fetchingRubricText.value = false;
    }
  }

  void selectRubric(RubricModel rubric) {
    selectedRubric.value = rubric;
  }

  RxInt selectedScore = 2.obs;
  void selectScore(int score) {
    selectedScore.value = score;
  }

  bool isSelected(int score) {
    return selectedScore.value == score;
  }

  Future<String> fetchIntegratedText(int drlid, int dplvlid) async {
    try {
      final response = await supabase
          .from('integrated_rubrics')
          .select('integrated_rubric_description')
          .eq('drlid', drlid)
          .eq('dplvlid', dplvlid)
          .single();

      return response['integrated_rubric_description'] as String;
    } catch (e) {
      print('error fetching rubric description text $e');
      return '';
    }
  }
}
