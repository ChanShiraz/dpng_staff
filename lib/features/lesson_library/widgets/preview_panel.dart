import 'package:dpng_staff/features/district_summative_library/controller/dis_summative_lib_controller.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/rubric_row.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/rubric_row_summative.dart';
import 'package:dpng_staff/features/lesson_library/models/demo_lesson.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/summative_library/controllers/summative_library_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class LessonPreviewPanel extends StatelessWidget {
  final DemoLesson? lesson;
  //final controller = Get.find<DisSummativeLibController>();
  final controller;
  bool? archive;
  LessonPreviewPanel({
    super.key,
    required this.lesson,
    required this.controller,
    this.archive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundContainer(
        color: Colors.white,
        circular: 20,
        //  margin: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
        padding: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Lesson Viewer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            lesson == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Select a lesson to preview details",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            lesson!.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            lesson!.course,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

