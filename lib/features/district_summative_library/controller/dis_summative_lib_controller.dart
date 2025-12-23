import 'package:dpng_staff/features/%20district_rubric_library/controllers/rubric_library_repo.dart';
import 'package:dpng_staff/features/%20district_rubric_library/models/competency.dart'
    show Competency;
import 'package:dpng_staff/features/archive_summative_library/view/archive_summative_library_page.dart';
import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:dpng_staff/features/district_summative_library/models/summative_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class DisSummativeLibController extends GetxController {
  final supabase = Supabase.instance.client;
  final userid = Get.find<UserController>().currentUser.value!.userId!;
  final rubricRepo = RubricLibraryRepo();
  RxList<SummativeModel> summatives = <SummativeModel>[].obs;
  Rxn<SummativeModel> selectedSummative = Rxn();
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

  void selectSummative(SummativeModel summative) {
    selectedSummative.value = summative;
    selectedScore.value = 2;
  }

  final RxnInt archivingId = RxnInt();

  Future<void> archiveSummative(int dumSumId) async {
    archivingId.value = dumSumId;
    try {
      await supabase
          .from('inst_mod_summatives')
          .update({'active': 0, 'archived': 1})
          .eq('dmod_sum_id', dumSumId);
      summatives.removeWhere((p0) => p0.dmod_sum_id == dumSumId);
      Get.to(ArchiveSummativeLibraryPage());
    } catch (e) {
      print('error activating summative $e');
    }
    archivingId.value = null;
  }

  RxInt selectedScore = 2.obs;
  void selectScore(int score) {
    selectedScore.value = score;
  }

  bool isSelected(int score) {
    return selectedScore.value == score;
  }

  String rubricText() {
    switch (selectedScore.value) {
      case 2:
        return selectedSummative.value!.emergingRubric;
      case 3:
        return selectedSummative.value!.capableRubric;
      case 4:
        return selectedSummative.value!.bridgingRubric;
      case 5:
        return selectedSummative.value!.proficientRubric;
      case 6:
        return selectedSummative.value!.advancedRubric;
    }
    return '';
  }
}
