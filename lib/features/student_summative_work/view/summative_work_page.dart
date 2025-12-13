import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/assess_formative/widgets/topbar.dart';
import 'package:dpng_staff/features/student_summative_work/controller/summative_work_controller.dart';
import 'package:dpng_staff/features/student_roster/widgets/roster_table.dart';
import 'package:dpng_staff/features/student_roster/widgets/student_tile.dart';
import 'package:dpng_staff/features/student_summative_work/widgets/summative_header.dart';
import 'package:dpng_staff/features/student_summative_work/widgets/summative_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummativeWorkPage extends StatefulWidget {
  SummativeWorkPage({
    super.key,
    required this.courseId,
    required this.studentId,
    required this.courseTitle,
    required this.student,
  });
  final int studentId;
  final int courseId;
  final String student;
  final String courseTitle;

  late SummativeWorkController summativeWorkController;

  @override
  State<SummativeWorkPage> createState() => _SummativeWorkPageState();
}

class _SummativeWorkPageState extends State<SummativeWorkPage> {
  @override
  void initState() {
    widget.summativeWorkController = Get.put(SummativeWorkController());
    widget.summativeWorkController.loadSummativeWork(
      widget.studentId,
      widget.courseId,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              TopBar(
                title:
                    '${widget.courseTitle} – Completed Summative Assessments',
                subtitle:
                    'Student Rosters by Course / Course Roster / Student Work',
              ),

              const SizedBox(height: 12),

              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                alignment: Alignment.centerLeft,
                child: const Text(
                  "View completed summative assessments and current proficiency for this course.",
                  style: TextStyle(color: Color(0xff64748b)),
                ),
              ),

              const SizedBox(height: 12),
              SummativeHeader(),
              Obx(
                () => widget.summativeWorkController.isLoading.value
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        child: StudentRosterShimmer(),
                      )
                    : Expanded(
                        child: ListView.builder(
                          shrinkWrap:
                              true, // okay when ListView's intrinsic height is desired
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemCount:
                              widget
                                  .summativeWorkController
                                  .summativeWorks
                                  .length ??
                              0,
                          itemBuilder: (context, index) {
                            final a = widget
                                .summativeWorkController
                                .summativeWorks[index];
                            return SummativeTile(
                              work: a,
                              index: index,
                              student: widget.student,
                            );
                          },
                        ),
                      ),
                // Flexible(
                //     child: Container(
                //       margin: const EdgeInsets.symmetric(horizontal: 16),
                //       decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.circular(18),
                //         border: Border.all(color: const Color(0xffe2e8f0)),
                //       ),
                //       child:
                //     ),
                //   ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
