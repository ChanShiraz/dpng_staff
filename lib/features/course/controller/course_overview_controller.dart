import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:dpng_staff/features/course/model/lesson.dart';
import 'package:dpng_staff/features/course/model/summative.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CourseOverviewController extends GetxController {
  final currentUser = Get.find<UserController>().currentUser.value;
  final supabase = Supabase.instance.client;
  RxList<Summative> summatives = <Summative>[].obs;
  RxBool fetchingSummatives = false.obs;
  RxString fetchingSummativeError = ''.obs;
  RxInt totalStudents = 0.obs;

  void fetchSummatives(int aCid) async {
    summatives.clear();
    fetchingSummatives.value = true;
    fetchingSummativeError.value = '';
    try {
      final query = supabase
          .from('alt_mod_summatives')
          .select('dmod_sum_id,title,task')
          .eq('a_cid', aCid)
          .eq('active', 1);
      final response = await query;
      for (var element in response) {
        final countsRes = await supabase.rpc(
          'get_summative_status_counts',
          params: {'p_dmod_sum_id': element['dmod_sum_id']},
        );
        final statusCounts = countsRes.isNotEmpty
            ? SummativeStatusCounts.fromMap(countsRes.first)
            : SummativeStatusCounts(
                accepted: 0,
                pending: 0,
                resubmit: 0,
                pastDue: 0,
              );

        summatives.add(Summative.fromMap(element, statusCounts));
      }
      fetchTotalStudents(aCid);
    } catch (e) {
      fetchingSummativeError.value = 'Error fetching summatives';
      debugPrint('error fetching course summatives $e');
    }
    fetchingSummatives.value = false;
  }

  RxBool fetchingStudents = false.obs;
  void fetchTotalStudents(int aCid) async {
    fetchingStudents.value = true;
    try {
      final res = await supabase
          .from('student_course_assignment')
          .select('userid')
          .eq('a_cid', aCid)
          .eq('graduated', 0)
          .eq('learning_year', Get.find<UserController>().learningYear.value);
      totalStudents.value = res.length;
    } catch (e) {
      debugPrint('error fetching students $e');
    }
    fetchingStudents.value = false;
  }

  int y = 0;
  int x = 0;
  RxBool fetchingGradingOverview = false.obs;
  RxString fetchingGradingOverviewError = ''.obs;

  void fetchGradingOverview(int acid) async {
    fetchingGradingOverview.value = true;
    fetchingGradingOverviewError.value = '';
    try {
      final xQuery = supabase
          .from('summative_student_submissions')
          .select('subid,status,grade')
          .eq('assessed_by', currentUser!.userId!)
          .eq('a_cid', acid)
          .eq('learning_year', Get.find<UserController>().learningYear.value);
      final xResponse = await xQuery;
      y = xResponse.length;
      x = 0;
      for (var element in xResponse) {
        if (element['status'] != 0 && element['grade'] != 7) {
          x++;
        }
      }
    } catch (e) {
      print('error getting summative progress $e');
      fetchingGradingOverviewError.value = e.toString();
    }
    fetchingGradingOverview.value = false;
  }
}
