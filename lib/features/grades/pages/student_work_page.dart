import 'package:dpng_staff/features/grades/controller/grades_controller.dart';
import 'package:dpng_staff/features/grades/models/course.dart';
import 'package:dpng_staff/features/grades/models/student.dart';
import 'package:dpng_staff/features/grades/pages/grades_page.dart';
import 'package:dpng_staff/features/grades/widgets/d_badge.dart';
import 'package:dpng_staff/features/grades/widgets/d_card.dart';
import 'package:dpng_staff/features/grades/widgets/d_card_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StudentWorkPage extends StatelessWidget {
  final GradesController ctrl = Get.find();
  final Course course;
  final Student student;
  StudentWorkPage({super.key, required this.course, required this.student});

  @override
  Widget build(BuildContext context) {
    return DCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DCardHeader(
            title: Row(
              children: [
                Icon(Icons.search, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text('${course.name} — Completed Summatives'),
              ],
            ),
            subtitle: '${student.name} • ${student.email}',
            action: Row(
              children: [
                OutlinedButton.icon(
                  onPressed: () => ctrl.openCourse(course),
                  icon: Icon(Icons.chevron_left),
                  label: Text('Back'),
                ),
                SizedBox(width: 8),
                TextButton.icon(
                  onPressed: () => ctrl.openFinal(student),
                  icon: Icon(Icons.school),
                  label: Text('Final Grade'),
                ),
              ],
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
                          'Student',
                          style: TextStyle(fontWeight: FontWeight.w700),
                        ),
                      ),
                      Expanded(child: Text('Date Assessed')),
                      Expanded(child: Text('Summative Assessed')),
                      Expanded(child: Text('Status')),
                      Expanded(child: Text('Grade')),
                      SizedBox(
                        width: 100,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text('Tools'),
                        ),
                      ),
                    ],
                  ),
                ),
                ...ctrl.SUMMATIVES.map(
                  (w) => Container(
                    padding: EdgeInsets.symmetric(horizontal: 14, vertical: 12),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            student.name,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ),
                        Expanded(child: Text(w.dateAssessed)),
                        Expanded(child: Text(w.title)),
                        Expanded(
                          child: DBadge(text: w.status, colorKey: 'green'),
                        ),
                        Expanded(
                          child: DBadge(
                            text: w.grade,
                            colorKey: ctrl.gradeColorKey(w.grade),
                          ),
                        ),
                        SizedBox(
                          width: 100,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: IconButton(
                              onPressed: () => ctrl.openSummative(w),
                              icon: Icon(Icons.remove_red_eye),
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
