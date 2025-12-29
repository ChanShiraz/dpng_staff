import 'package:dpng_staff/features/lesson_builder/models/lesson_model.dart';
import 'package:dpng_staff/features/lesson_builder/view/lesson_builder_page.dart';
import 'package:dpng_staff/features/lesson_library/models/demo_lesson.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';

class LessonCard extends StatelessWidget {
  //final LessonModel item;
  final DemoLesson item;
  final bool selected;
  final VoidCallback onTap;
  final bool? archive;
  final controller;

  const LessonCard({
    super.key,
    required this.item,
    required this.selected,
    required this.onTap,
    this.archive,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: const Color(0xFFF8FAFC),
      child: Container(
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF1F5F9) : Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + tags
            Expanded(
              flex: 4,
              child: Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
            ),

            Expanded(
              flex: 3,
              child: Text(
                item.course,
                style: const TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ),
            Expanded(
              flex: 3,
              child: Text(
                item.summative,
                style: const TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ),

            //        Competencies
            // Expanded(
            //   flex: 3,
            //   child: Wrap(
            //     children: item.competencies
            //         .map(
            //           (t) => TagChip(
            //             '${t.dpc_label}: ${t.dpc_heading}',

            //             showBorder: true,
            //             borderColor: Colors.grey.shade300,
            //           ),
            //         )
            //         .toList(),
            //   ),
            // ),
            // // Standards
            // Expanded(
            //   flex: 3,
            //   child: Wrap(
            //     children: item.standards
            //         .map(
            //           (t) => TagChip(
            //             t,
            //             color: Colors.blue.shade50,
            //             textColor: Colors.blue,
            //             showBorder: true,
            //             borderColor: Colors.blue.shade300,
            //           ),
            //         )
            //         .toList(),
            //   ),
            // ),
            // // Actions
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  RoundContainer(
                    padding: 8,
                    child: Icon(Icons.remove_red_eye_outlined, size: 18),
                  ),
                  SizedBox(width: 8),
                  RoundContainer(
                    padding: 8,
                    child: Icon(Icons.edit_outlined, size: 18),
                  ),
                  SizedBox(width: 8),
                  RoundContainer(padding: 8, child: Icon(Icons.copy, size: 18)),
                  SizedBox(width: 8),
                  RoundContainer(
                    // padding: 8,
                    child: Icon(Icons.delete_outline, size: 18),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
