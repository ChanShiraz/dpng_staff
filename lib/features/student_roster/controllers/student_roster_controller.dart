import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:dpng_staff/features/student_roster/models/roster_course.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class StudentRosterController extends GetxController {
  final supbase = Supabase.instance.client;
  final currentUser = Get.find<UserController>().currentUser.value;
  final learningYear = Get.find<UserController>().learningYear.value;
  final searhTextController = TextEditingController();
  RxBool isLoading = false.obs;
  RxList<RosterCourse> roasterCourses = <RosterCourse>[].obs;
  RxList<RosterCourse> filteredRoasterCourses = <RosterCourse>[].obs;
  RxString selectedTrack = 'All'.obs;

  @override
  void onInit() {
    super.onInit();
    loadRoasterCourses();
  }

  loadRoasterCourses() async {
    isLoading.value = true;
    roasterCourses.clear();
    filteredRoasterCourses.clear();
    try {
      final response = await supbase
          .from('alt_courses')
          .select('a_cid,title1,course_type,alyid')
          .eq('active', 1)
          .eq('userid_assigned', currentUser!.userId!)
          .eq('schoolid', currentUser!.schoolId!)
          .eq('alyid', learningYear);
      for (var element in response) {
        RosterCourse course = RosterCourse.fromMap(element);
        roasterCourses.add(course);
      }
      filteredRoasterCourses.value = roasterCourses;

      print('roaster courses ${roasterCourses.length}');
    } catch (e) {
      print('error student roaster courses $e');
    }
    isLoading.value = false;
  }

  void trackChange(String? value) {
    if (value != null) {
      switch (value) {
        case 'All':
          selectedTrack.value = 'All';
          filteredRoasterCourses.value = roasterCourses;
          break;
        case 'Track A':
          selectedTrack.value = 'Track A';
          filteredRoasterCourses.value = roasterCourses
              .where((p0) => p0.course_type == 4)
              .toList();
          break;
        case 'Track B':
          selectedTrack.value = 'Track B';
          filteredRoasterCourses.value = roasterCourses
              .where((p0) => p0.course_type == 5)
              .toList();
          break;
        default:
      }
    }
  }

  void searchCourses(String query) {
    final searchText = query.toLowerCase();

    List<RosterCourse> baseList;
    if (selectedTrack.value == 'Track A') {
      baseList = roasterCourses.where((p0) => p0.course_type == 4).toList();
    } else if (selectedTrack.value == 'Track B') {
      baseList = roasterCourses.where((p0) => p0.course_type == 5).toList();
    } else {
      baseList = roasterCourses;
    }

    if (searchText.isEmpty) {
      filteredRoasterCourses.value = baseList;
      return;
    }

    filteredRoasterCourses.value = baseList
        .where(
          (course) => (course.title1 ?? '').toLowerCase().contains(searchText),
        )
        .toList();
  }
}
