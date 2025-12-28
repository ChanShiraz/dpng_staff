import 'package:dpng_staff/features/assess_formative/models/past_fromative.dart';
import 'package:dpng_staff/features/assessment_center/controller/assessment_center_controller.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/summative_card.dart';
import 'package:dpng_staff/features/home/controller/courses_controller.dart';
import 'package:dpng_staff/features/home/controller/formative_cotroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AssessFormativeController extends GetxController {
  final int aCid;
  AssessFormativeController({required this.aCid});
  final supabase = Supabase.instance.client;
  final assementCenterController = Get.find<AssessmentCenterController>();
  final coursesController = Get.find<CoursesController>();
  final formativeController = Get.find<FormativeCotroller>();

  final commentController = TextEditingController();
  RxList<PastFromative> pastFormatives = <PastFromative>[].obs;
  RxBool fetchingPastFormatives = false.obs;
  RxString fetchPastFormativesError = ''.obs;

  fetchPastFormatives(int fsubid) async {
    fetchingPastFormatives.value = true;
    fetchPastFormativesError.value = '';
    try {
      final response = await supabase
          .from('formative_student_submissions_past')
          .select('fsubpastid, date, status, assessed')
          .eq('fsubid', fsubid);
      pastFormatives.value = response
          .map((e) => PastFromative.fromMap(e))
          .toList();
    } catch (e) {
      fetchPastFormativesError.value = e.toString();
    }
    fetchingPastFormatives.value = false;
  }

  RxInt finalStatus = 0.obs;

  RxBool assessingFormative = false.obs;
  RxString assessingFormativeError = ''.obs;
  
  void assessFormative(int fsubid) async {
    assessingFormative.value = true;
    assessingFormativeError.value = '';
    try {
      await supabase
          .from('formative_student_submissions')
          .update({
            'status': finalStatus.value,
            'comment': commentController.text.trim(),
            'assessed': DateTime.now().toUtc().toIso8601String(),
            'student_viewed': 0,
          })
          .eq('fsubid', fsubid);

      assementCenterController.fetchFormativeAssessments();
      coursesController.updateFormativeBubbleCounts(aCid: aCid);
      formativeController.calWeekProgress();
      Get.back();
      showDesktopToast2('Assessment Submitted Successfully!');
    } catch (e) {
      assessingFormativeError.value = e.toString();
      showDesktopToast2('Some error occured! Please try again');
      print('error assessing formative $e');
    }
    assessingFormative.value = false;
  }
}
