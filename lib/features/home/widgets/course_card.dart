import 'package:dpng_staff/features/course/view/course_overview_page.dart';
import 'package:dpng_staff/features/home/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;
  final bool highlighted;
  const CourseCard({super.key, required this.course, this.highlighted = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(CourseOverviewPage()),
      child: Container(
        width: 260,
        height: 120,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: course.color,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Color(0x11000000),
              blurRadius: 8,
              offset: Offset(0, 6),
            ),
          ],
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              course.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              course.schedule,
              style: const TextStyle(color: Colors.white70),
            ),
          ],
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
      height: 140,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: courses.length,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return CourseCard(course: courses[index], highlighted: index == 0);
        },
      ),
    );
  }
}
