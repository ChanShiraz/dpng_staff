import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:dpng_staff/utils/date_helper.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class FormativeCotroller extends GetxController {
  final supbase = Supabase.instance.client;
  final currentUser = Get.find<UserController>().currentUser.value;
  //final learningYear = Get.find<UserController>().learningYear.value;
  RxBool isLoading = false.obs;
  int y = 0;
  int x = 0;

  void calWeekProgress() async {
    isLoading.value = true;
    x = 0;
    try {
      final query = supbase
          .from('formative_student_submissions')
          .select('fsubid,alt_courses(active),status')
          .eq('assessed_by', currentUser!.userId!)
          .eq('learning_year', Get.find<UserController>().learningYear.value)
          .eq('alt_courses.active', 1)
          .gte('date', DateHelper.weekStart())
          .lte('date', DateHelper.weekEnd());
      final response = await query;
      print('formative weekly $response');
      y = response.length;
      for (var element in response) {
        if (element['status'] != 0) {
          x++;
        }
      }
    } catch (e) {
      print('error loading formatives $e');
    }
    isLoading.value = false;
  }
}
