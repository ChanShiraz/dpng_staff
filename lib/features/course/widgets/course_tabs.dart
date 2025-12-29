import 'package:dpng_staff/features/course_summative_assignment/view/assign_course_summative_page.dart';
import 'package:dpng_staff/features/district_summative_library/view/district_summative_library_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CourseTabs extends StatefulWidget {
  const CourseTabs({super.key, required this.courseId});
  final int courseId;

  @override
  State<CourseTabs> createState() => _CourseTabsState();
}

class _CourseTabsState extends State<CourseTabs> {
  int selectedIndex = 0;
  final tabs = ['Summatives', 'Archive'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(tabs.length, (index) {
          final isSelected = index == selectedIndex;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ChoiceChip(
              label: Text(tabs[index]),
              selected: isSelected,
              onSelected: (_) => setState(() => selectedIndex = index),
              selectedColor: Colors.indigo.shade100,
            ),
          );
        }),
        const Spacer(),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {
            Get.to(
              () => CourseSummativeAssignmentPage(courseId: widget.courseId),
            );
          },
          icon: const Icon(Icons.library_add_outlined),
          label: const Text('Assign from Library'),
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}
