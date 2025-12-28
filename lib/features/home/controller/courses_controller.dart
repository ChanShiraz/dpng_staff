import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:dpng_staff/features/home/models/course_model.dart';
import 'package:dpng_staff/features/home/models/summative_bubble_counts.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CoursesController extends GetxController {
  final SupabaseClient supabase = Supabase.instance.client;
  RxList<CourseModel> courses = <CourseModel>[].obs;
  final user = Get.find<UserController>().currentUser.value;
  final learningYear = Get.find<UserController>().learningYear;

  RxBool fetchingCourses = false.obs;
  RxString fetchingCoursesError = ''.obs;
  RxInt courseType = 4.obs;

  fetchCourses(int courseType) async {
    courses.clear();
    fetchingCourses.value = true;
    fetchingCoursesError.value = '';
    try {
      var query = supabase
          .from('alt_courses')
          .select(
            'a_cid,cid,ccid,title1,overview1,course_type,course_content_category(color,cc_category))',
          )
          .eq('userid_assigned', user!.userId!)
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
      fetchingCoursesError.value = 'Error loading courses!';
      debugPrint('Error loading courses $e');
    }
    fetchingCourses.value = false;
  }

  Future<SummativeBubbleCounts> fetchSummativeBubbleCounts({
    required int aCid,
  }) async {
    final response = await supabase
        .rpc('get_summative_bubble_counts', params: {'p_a_cid': aCid})
        .single();
    return SummativeBubbleCounts.fromJson(response);
  }

  updateSummativeBubbleCounts({required int aCid}) async {
    final response = await supabase
        .rpc('get_summative_bubble_counts', params: {'p_a_cid': aCid})
        .single();
    final index = courses.indexWhere((course) => course.a_cid == aCid);
    if (index != -1) {
      courses[index].summativeBubbleCounts = SummativeBubbleCounts.fromJson(
        response,
      );
    }
    courses.refresh();
  }

  Future<SummativeBubbleCounts> fetchFormativeBubbleCounts({
    required int aCid,
  }) async {
    final response = await supabase
        .rpc('get_formative_bubble_counts', params: {'p_a_cid': aCid})
        .single();
    return SummativeBubbleCounts.fromJson(response);
  }

  updateFormativeBubbleCounts({required int aCid}) async {
    final response = await supabase
        .rpc('get_formative_bubble_counts', params: {'p_a_cid': aCid})
        .single();
    final index = courses.indexWhere((course) => course.a_cid == aCid);
    if (index != -1) {
      courses[index].formativeBubbleCounts = SummativeBubbleCounts.fromJson(
        response,
      );
    }
    courses.refresh();
  }
}
