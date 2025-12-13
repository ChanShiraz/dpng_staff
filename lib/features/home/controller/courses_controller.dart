import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:dpng_staff/features/home/models/course_model.dart';
import 'package:dpng_staff/features/home/models/summative_bubble_counts.dart';
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
          .select(
            'a_cid,cid,ccid,title1,course_content_category(color,cc_category))',
          )
          // .eq('userid_assigned', user!.userId!)
          .eq('alyid', learningYear)
          .eq('course_type', courseType)
          .eq('active', 1);
      final response = await query;
      if (response.isNotEmpty) {
        for (var element in response) {
          SummativeBubbleCounts summativeBubbleCounts =
              await fetchSummativeBubbleCounts(aCid: element['a_cid']);
          SummativeBubbleCounts formativeBubbleCounts =
              await fetchFormativeBubbleCounts(aCid: element['a_cid']);
          courses.add(
            CourseModel.fromMap(
              element,
              summativeBubbleCounts,
              formativeBubbleCounts,
            ),
          );
        }
      }
    } catch (e) {
      print('Error loading courses $e');
    }
    loadingCourses.value = false;
  }

  Future<SummativeBubbleCounts> fetchSummativeBubbleCounts({
    required int aCid,
  }) async {
    final response = await supabase
        .rpc('get_summative_bubble_counts', params: {'p_a_cid': aCid})
        .single();

    return SummativeBubbleCounts.fromJson(response);
  }

  Future<SummativeBubbleCounts> fetchFormativeBubbleCounts({
    required int aCid,
  }) async {
    final response = await supabase
        .rpc('get_formative_bubble_counts', params: {'p_a_cid': aCid})
        .single();

    return SummativeBubbleCounts.fromJson(response);
  }
}
