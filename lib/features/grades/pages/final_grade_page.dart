import 'package:dpng_staff/features/grades/controller/grades_controller.dart';
import 'package:dpng_staff/features/grades/models/course.dart';
import 'package:dpng_staff/features/grades/models/student.dart';
import 'package:dpng_staff/features/grades/models/summative.dart';
import 'package:dpng_staff/features/grades/pages/grades_page.dart';
import 'package:dpng_staff/features/grades/widgets/d_badge.dart';
import 'package:dpng_staff/features/grades/widgets/d_card.dart';
import 'package:dpng_staff/features/grades/widgets/d_card_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class IssueFinalGradePage extends StatefulWidget {
  final GradesController ctrl = Get.find();
  final Course course;
  final Student student;
  final Summative record;
  IssueFinalGradePage({
    super.key,
    required this.course,
    required this.student,
    required this.record,
  });

  @override
  State<IssueFinalGradePage> createState() => _IssueFinalGradePageState();
}

class _IssueFinalGradePageState extends State<IssueFinalGradePage> {
  String finalGrade = 'PROFICIENT';
  bool submitted = false;
  final options = ['PASS', 'BRIDGING', 'PROFICIENT', 'METACOGNITION'];

  @override
  void initState() {
    super.initState();
    finalGrade = widget.record.grade;
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = widget.ctrl;
    final recommend = 'METACOGNITION';
    return DCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DCardHeader(
            title: Row(
              children: [
                Icon(Icons.school, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text('Issue Final Grade'),
              ],
            ),
            subtitle: '${widget.student.name} — ${widget.course.name}',
            action: OutlinedButton.icon(
              onPressed: () => ctrl.openCourse(widget.course),
              icon: Icon(Icons.chevron_left),
              label: Text('Back'),
            ),
          ),
          SizedBox(height: 12),
          DCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Summary', style: TextStyle(fontWeight: FontWeight.w700)),
                SizedBox(height: 8),
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Student',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            widget.student.name,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Summative Assessed',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            widget.record.title,
                            style: TextStyle(fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Status',
                            style: TextStyle(
                              color: Colors.grey[500],
                              fontSize: 12,
                            ),
                          ),
                          SizedBox(height: 4),
                          DBadge(text: widget.record.status, colorKey: 'green'),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          SizedBox(height: 12),

          DCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'DPNG Recommended Grade',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 8),
                Row(
                  children: [
                    DBadge(text: recommend, colorKey: ctrl.gradeColorKey(recommend)),
                    SizedBox(width: 8),
                    Text(
                      '(System generated recommendation)',
                      style: TextStyle(color: Colors.grey[600], fontSize: 12),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                Text(
                  'Provide the final course grade based primarily on learning target proficiency across summatives. In some instances, an instructor may assign a higher grade than the recommendation if a student demonstrates higher proficiency via additional evidence.',
                  style: TextStyle(color: Colors.grey[600], fontSize: 12),
                ),
              ],
            ),
          ),

          SizedBox(height: 12),

          DCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Select Final Grade',
                  style: TextStyle(fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 8),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    ...options.map(
                      (opt) => ChoiceChip(
                        label: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if (finalGrade == opt) Icon(Icons.check, size: 16),
                            SizedBox(width: 6),
                            Text(opt),
                          ],
                        ),
                        selected: finalGrade == opt,
                        onSelected: (_) => setState(() => finalGrade = opt),
                      ),
                    ),
                    ActionChip(
                      label: Text('NO EVIDENCE'),
                      onPressed: () =>
                          setState(() => finalGrade = 'NO EVIDENCE'),
                    ),
                  ],
                ),
                SizedBox(height: 12),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        setState(() => submitted = true);
                        Get.find<GradesController>().submitFinalGrade(
                          finalGrade,
                        );
                      },
                      child: Text('Submit'),
                    ),
                    SizedBox(width: 10),
                    OutlinedButton.icon(
                      onPressed: () => setState(() => finalGrade = recommend),
                      icon: Icon(Icons.refresh),
                      label: Text('Reset to Recommended'),
                    ),
                  ],
                ),
                if (submitted) SizedBox(height: 12),
                if (submitted)
                  DBadge(
                    text: 'Final grade saved: $finalGrade',
                    colorKey: 'green',
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}