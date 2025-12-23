import 'package:dpng_staff/features/course/view/course_overview_page.dart';
import 'package:dpng_staff/features/home/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'package:flutter/material.dart';
import 'circular_progress.dart';
import 'bubble_row.dart';

class CourseTile extends StatelessWidget {
  final CourseModel course;

  final Color completionColor;

  const CourseTile({
    super.key,
    required this.completionColor,
    required this.course,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: InkWell(
        onTap: () => Get.to(CourseOverviewPage(course: course)),
        child: Container(
          width: 280,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.06),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              /// Header
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: hexToColor(course.color),
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(16),
                  ),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          course.category.toUpperCase(),
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 11,
                            letterSpacing: 0.8,
                          ),
                        ),
                        const SizedBox(height: 4),
                        SizedBox(
                          width: 100,
                          child: Text(
                            course.title1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(width: 85),
                    CircularProgress(percent: 0, color: Colors.red),
                  ],
                ),
              ),

              /// Content
              Padding(
                padding: const EdgeInsets.all(16),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade200),
                  ),
                  child: Column(
                    children: [
                      BubbleRow(
                        label: "Summative",
                        bubbleCounts: course.summativeBubbleCounts,
                      ),
                      Divider(height: 16),
                      BubbleRow(
                        label: "Formative ",
                        bubbleCounts: course.formativeBubbleCounts,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  
}

class CourseCarousel extends StatelessWidget {
  final List<CourseModel> courses;
  const CourseCarousel({super.key, required this.courses});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: courses.isEmpty
          ? Center(child: Text('No Course Found!'))
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: courses.length,
              padding: const EdgeInsets.symmetric(horizontal: 8),
              itemBuilder: (context, index) {
                return CourseTile(
                  course: courses[index],
                  completionColor: Colors.white12,
                );
                // CourseCard(
                //   course: courses[index],
                //   highlighted: index == 0,
                // );
              },
            ),
    );
  }
}

Color hexToColor(String hex) {
    hex = hex.replaceAll('#', '');

    if (hex.length == 6) {
      hex = 'FF$hex'; // add alpha if missing
    }

    return Color(int.parse(hex, radix: 16));
  }