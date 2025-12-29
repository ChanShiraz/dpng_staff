import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:dpng_staff/utils/date_helper.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SummativeController extends GetxController {
  final supbase = Supabase.instance.client;
  final currentUser = Get.find<UserController>().currentUser.value;
  //final learningYear = Get.find<UserController>().learningYear.value;
  RxBool isLoading = false.obs;
  int y = 0;
  int x = 0;

  // void getToGrade() async {
  //   toGrade.value = 0;
  //   isLoading.value = true;
  //   try {
  //     final query = supbase
  //         .from('summative_student_submissions')
  //         .select('subid,a_cid, alt_courses(active)')
  //         .eq('assessed_by', currentUser!.userId!)
  //         .eq('alt_courses.active', 1)
  //         .eq('learning_year', learningYear)
  //         .eq('status', 0)
  //         .eq('grade', 7);
  //     final result = await query;
  //     toGrade.value = result.length;
  //     calWeekProgress();
  //   } catch (e) {
  //     print('error fetching summatives $e');
  //   }
  //   isLoading.value = false;
  // }

  void calWeekProgress() async {
    isLoading.value = true;
    try {
      final xQuery = supbase
          .from('summative_student_submissions')
          .select('subid,a_cid, alt_courses(active),status,grade')
          .eq('assessed_by', currentUser!.userId!)
          .eq('alt_courses.active', 1)
          .eq('learning_year', Get.find<UserController>().learningYear.value)
          .gte('date', DateHelper.weekStart())
          .lte('date', DateHelper.weekEnd());

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
    }
    isLoading.value = false;
  }
}
