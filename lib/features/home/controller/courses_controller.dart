import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:dpng_staff/features/home/models/course_model.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CoursesController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;
  RxList<CourseModel> courses = <CourseModel>[].obs;
  final user = Get.find<UserController>().currentUser.value;
  final learningYear = Get.find<UserController>().learningYear;
  RxBool loadingCourses = false.obs;
  //int learningYear = 0;
  RxInt courseType = 4.obs;

  loadCourses(int courseType) async {
    //print('year $learningYear');
    courses.clear();
    loadingCourses.value = true;
    try {
      var query = supabase
          .from('alt_courses')
          .select('a_cid,cid,ccid,title1)')
          .eq('userid_assigned', user!.userId!)
          .eq('alyid', learningYear)
          .eq('course_type', courseType)
          .eq('active', 1);
      final response = await query;
      if (response.isNotEmpty) {
        for (var element in response) {
          print(element['title1']);
          courses.add(CourseModel.fromMap(element));
        }
      }
    } catch (e) {
      print('Error loading courses $e');
    }
    loadingCourses.value = false;
  }
}
