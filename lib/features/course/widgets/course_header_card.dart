import 'package:dpng_staff/features/home/models/course_model.dart';
import 'package:flutter/material.dart';

class CourseHeaderCard extends StatelessWidget {
  const CourseHeaderCard({super.key, required this.course});
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
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
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Text(course.overview1, style: TextStyle(color: Colors.black54)),

            const SizedBox(height: 16),
            Row(
              children: const [
                Icon(Icons.access_time, size: 18, color: Colors.black54),
                SizedBox(width: 6),
                Text(
                  'Tue, Thu · 11:00 AM–12:30 PM',
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(width: 16),
                Icon(
                  Icons.people_alt_outlined,
                  size: 18,
                  color: Colors.black54,
                ),
                SizedBox(width: 6),
                Text('34 students', style: TextStyle(color: Colors.black54)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
