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

class SummativeResultPage extends StatelessWidget {
  final GradesController ctrl = Get.find();
  final Course course;
  final Student student;
  final Summative record;
  SummativeResultPage({
    super.key,
    required this.course,
    required this.student,
    required this.record,
  });

  @override
  Widget build(BuildContext context) {
    return DCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DCardHeader(
            title: Row(
              children: [
                Icon(Icons.remove_red_eye, color: Colors.blueAccent),
                SizedBox(width: 8),
                Text('Student Summative Results'),
              ],
            ),
            subtitle: '${student.name} — ${course.name}',
            action: OutlinedButton.icon(
              onPressed: () => ctrl.openStudentWork(student),
              icon: Icon(Icons.chevron_left),
              label: Text('Back'),
            ),
          ),
          SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // summary grid (stacked)
              Text(
                'Summative Assessment',
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
              SizedBox(height: 6),
              Text(
                record.title,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Student Summative Title',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          record.studentTitle,
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
                          'Description',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(record.description),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date Submitted',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(record.dateSubmitted),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Date Assessed',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontSize: 12,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(record.dateAssessed),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Text(
                    'Proficiency Assessment:',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                  SizedBox(width: 10),
                  DBadge(
                    text: record.grade,
                    colorKey: ctrl.gradeColorKey(record.grade),
                  ),
                ],
              ),
              SizedBox(height: 12),

              DCard(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'DP Competency Assessment',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'DP Competency',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '${record.competency.code} — ${record.competency.title}',
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 4),
                              Text(
                                record.competency.desc,
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: [
                              LinearProgressIndicator(value: 1.0),
                              SizedBox(height: 8),
                              DBadge(
                                text: record.competency.level,
                                colorKey: ctrl.gradeColorKey(
                                  record.competency.level,
                                ),
                              ),
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
                      'State Standard Assessment',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'State Standard',
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 12,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                record.standard.code,
                                style: TextStyle(fontWeight: FontWeight.w600),
                              ),
                              SizedBox(height: 4),
                              Text(
                                record.standard.desc,
                                style: TextStyle(color: Colors.grey[700]),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            children: [
                              LinearProgressIndicator(value: 1.0),
                              SizedBox(height: 8),
                              DBadge(
                                text: record.standard.level,
                                colorKey: ctrl.gradeColorKey(record.standard.level),
                              ),
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
                      'Instructor Provided Information',
                      style: TextStyle(fontWeight: FontWeight.w700),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Teacher comment for this summative assessment: —',
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(height: 12),
                    DBadge(text: 'SUMMATIVE ACCEPTED', colorKey: 'green'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
