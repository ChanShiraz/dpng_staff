// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dpng_staff/features/district_summative_library/widgets/summative_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:dpng_staff/features/course/model/summative.dart';
import 'package:dpng_staff/features/summative_assignment/controller/repo.dart';
import 'package:dpng_staff/features/summative_assignment/models/lesson.dart';
import 'package:dpng_staff/features/summative_assignment/models/student.dart';

class SummativeAssingnmentController extends GetxController {
  final supabase = Supabase.instance.client;
  final repo = CourseSummativeAssignmentRepo();
  final Summative summative;
  final int aCid;
  SummativeAssingnmentController({required this.summative, required this.aCid});

  @override
  void onInit() {
    super.onInit();

    // Recalculate whenever lessons change
    ever<List<Lesson>>(lessons, (_) => _updateReadyStatus());

    // Recalculate whenever selected students change
    ever<List<Student>>(selectedStudents, (_) => _updateReadyStatus());

    // Initial calculation
    _updateReadyStatus();
  }

  void _updateReadyStatus() {
    readyToAssign.value =
        summative.dueDate != null &&
        lessons.isNotEmpty &&
        lessons.every((lesson) => lesson.dueDate != null) &&
        selectedStudents.isNotEmpty;
  }

  RxList<Lesson> lessons = <Lesson>[].obs;
  RxBool fetchingLessons = false.obs;

  void fetchLessons(int dumSumId) async {
    fetchingLessons.value = true;
    try {
      lessons.value = await repo.fetchLessons(dumSumId);
      print('lessons $lessons');
    } catch (e) {
      debugPrint('Error fetching lessons $e');
    }
    fetchingLessons.value = false;
  }

  RxList<Student> students = <Student>[].obs;
  RxBool fetchingStudents = false.obs;

  void fetchStudents(int acid) async {
    fetchingStudents.value = true;
    try {
      students.value = await repo.fetchStudents(acid);
    } catch (e) {
      debugPrint('error fetching students $e');
    }
    fetchingStudents.value = false;
  }

  RxList<Student> selectedStudents = <Student>[].obs;

  void selectStudent(Student student) {
    if (selectedStudents.contains(student)) {
      selectedStudents.remove(student);
    } else {
      selectedStudents.add(student);
    }
  }

  RxBool readyToAssign = false.obs;

  RxBool assingingSummative = false.obs;
  Future<void> assignSummative(
    int aCid,
    int dmodSumId,
    BuildContext context,
  ) async {
    assingingSummative.value = true;
    try {
      final response = await supabase.rpc(
        'assign_due_dates_summative',
        params: {
          'p_a_cid': aCid,
          'p_dmod_sum_id': dmodSumId,
          'p_summative_due_date': summative.dueDate!
              .toIso8601String()
              .substring(0, 10),
          'p_lesson_ids': lessons.map((l) => l.dmod_lesson_id).toList(),
          'p_lesson_due_dates': lessons
              .map((d) => d.dueDate!.toIso8601String().substring(0, 10))
              .toList(),
          'p_student_ids': selectedStudents.map((s) => s.userid).toList(),
        },
      );
      print('dates assigned $response');
      showDesktopToast(context, 'Due dates assigned successfully');
      Get.back();
    } catch (e) {
      showDesktopToast(context, 'Some error occured! Please try again.');
      debugPrint('error assigning summative $e');
    }
    assingingSummative.value = false;
  }
}
