import 'package:dpng_staff/features/course/controller/course_overview_controller.dart';
import 'package:dpng_staff/features/home/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CourseHeaderCard extends StatelessWidget {
  const CourseHeaderCard({
    super.key,
    required this.course,
    required this.color,
    required this.controller,
  });
  final CourseModel course;
  final Color color;
  final CourseOverviewController controller;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              children: [
                Chip(
                  label: Text(
                    course.course_type == 4 ? 'Track A' : 'Track B',
                    style: TextStyle(color: Colors.white),
                  ),
                  backgroundColor: Colors.black,
                ),
                Chip(label: Text(course.category)),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              '${course.title1} – Course Overview',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(course.overview1, style: TextStyle(color: Colors.white54)),

            const SizedBox(height: 16),
            Row(
              children: [
                Icon(Icons.people_alt_outlined, size: 18, color: Colors.white),
                SizedBox(width: 6),
                Obx(
                  () => controller.fetchingStudents.value
                      ? SizedBox()
                      : Text(
                          '${controller.totalStudents.value} students',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
