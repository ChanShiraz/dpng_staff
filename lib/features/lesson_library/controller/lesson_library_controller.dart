import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_model.dart';
import 'package:dpng_staff/features/lesson_library/models/demo_lesson.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class LessonLibraryController extends GetxController {
  final supabase = Supabase.instance.client;
  final userid = Get.find<UserController>().currentUser.value!.userId!;
  Rxn<DemoLesson> selectedSummative = Rxn();

  Rxn<DemoLesson> selectedLesson = Rxn();
  void selectLesson(DemoLesson lesson) {
    selectedLesson.value = lesson;
  }

  RxList lessons = <LessonModel>[].obs;
  RxBool fetchingLessons = false.obs;

  void fetchLessons() async {
    final response = await supabase
        .from('inst_mod_lessons')
        .select('dmod_lesson_id')
        .single();
  }

  List<DemoLesson> demoLessons = [
    DemoLesson(
      title: 'Citing Evidence in Discussion',
      course: 'English 10',
      summative: 'Socratic Seminar Summative',
    ),
    DemoLesson(
      title: 'Introduction to Argument Writing',
      course: 'English 9',
      summative: 'Jeffs test summative',
    ),
    DemoLesson(
      title: 'Reading Informational Text: Main Ideas',
      course: 'English 9',
      summative: 'Quarter 1 Informational Text Check',
    ),
  ];
}
