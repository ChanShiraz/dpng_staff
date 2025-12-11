// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dpng_staff/features/student_roster/models/summative_work.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:dpng_staff/features/auth/controller/user_controller.dart';

class SummativeWorkController extends GetxController {
  final supbase = Supabase.instance.client;
  final currentUser = Get.find<UserController>().currentUser.value;
  final learningYear = Get.find<UserController>().learningYear.value;
  RxBool isLoading = false.obs;
  RxList<SummativeWork> summativeWorks = <SummativeWork>[].obs;

  void loadSummativeWork(int studentId, int courseId) async {
    isLoading.value = true;
    try {
      final query = supbase
          .from('summative_student_submissions')
          .select('date,status,grade,assessed,alt_mod_summatives(title)')
          .eq('userid', studentId)
          .eq('a_cid', courseId)
          .order('date');
      final response = await query;
      if (response.isNotEmpty) {
        for (var element in response) {
          SummativeWork summativeWork = SummativeWork.fromMap(element);
          summativeWorks.add(summativeWork);
        }
      }
    } catch (e) {
      print('error loading summative work $e');
    }
    isLoading.value = false;
  }
}
