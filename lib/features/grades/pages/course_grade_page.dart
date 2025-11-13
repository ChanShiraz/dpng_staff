import 'package:dpng_staff/features/grades/controller/grades_controller.dart';
import 'package:dpng_staff/features/grades/models/course.dart';
import 'package:dpng_staff/features/grades/pages/grades_page.dart';
import 'package:dpng_staff/features/grades/widgets/d_badge.dart';
import 'package:dpng_staff/features/grades/widgets/d_card.dart';
import 'package:dpng_staff/features/grades/widgets/d_card_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CourseGrades extends StatelessWidget {
  final GradesController ctrl = Get.find();
  final Course course;
  CourseGrades({super.key, required this.course});

  @override
  Widget build(BuildContext context) {
    return DCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DCardHeader(
            title: Row(
              children: [
                Icon(Icons.book, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text(
                  '${course.name} — Student Grades',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
            subtitle: YEAR_LABEL,
            action: OutlinedButton.icon(
              onPressed: () => ctrl.openGradebook(),
              icon: Icon(Icons.chevron_left),
              label: Text('Back'),
            ),
          ),
          SizedBox(height: 12),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade200),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 14, vertical: 10),
                  color: Colors.grey.shade50,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          'Student Name',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(child: Text('Student Email')),
                      Expanded(child: Text('Status')),
                      Expanded(child: Text('Current Grade')),
                      SizedBox(
                        width: 140,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('Tools'),
                        ),
                      ),
                    ],
                  ),
                ),
                ...ctrl.STUDENTS.map(
                  (s) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            s.name,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            s.email,
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ),
                        Expanded(
                          child: DBadge(
                            text: s.status,
                            colorKey: ctrl.statusColorKey(s.status),
                          ),
                        ),
                        Expanded(
                          child: DBadge(
                            text: ctrl.gradeLabel(s.grade),
                            colorKey: ctrl.gradeColorKey(s.grade),
                          ),
                        ),
                        SizedBox(
                          width: 140,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () => ctrl.openStudentWork(s),
                                  icon: Icon(Icons.search),
                                ),
                                IconButton(
                                  onPressed: () => ctrl.openFinal(s),
                                  icon: Icon(Icons.school),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.refresh),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
