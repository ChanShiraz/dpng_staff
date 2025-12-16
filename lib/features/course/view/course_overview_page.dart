import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/assess_formative/widgets/topbar.dart';
import 'package:dpng_staff/features/course/controller/course_overview_controller.dart';
import 'package:dpng_staff/features/course/widgets/calendar_card.dart';
import 'package:dpng_staff/features/course/widgets/course_header_card.dart';
import 'package:dpng_staff/features/course/widgets/course_summative_table.dart';
import 'package:dpng_staff/features/course/widgets/course_tabs.dart';
import 'package:dpng_staff/features/course/widgets/course_topbar.dart';
import 'package:dpng_staff/features/course/widgets/grading_overview_card.dart';
import 'package:dpng_staff/features/course/widgets/messages_card.dart';
import 'package:dpng_staff/features/home/models/course_model.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';

class CourseOverviewPage extends StatefulWidget {
  CourseOverviewPage({super.key, required this.course});
  final CourseModel course;
  late CourseOverviewController controller;

  @override
  State<CourseOverviewPage> createState() => _CourseOverviewPageState();
}

class _CourseOverviewPageState extends State<CourseOverviewPage> {
  @override
  void initState() {
    widget.controller = Get.put(CourseOverviewController());
    widget.controller.fetchSummatives(widget.course.a_cid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 1100;
          return SingleChildScrollView(
            //padding: const EdgeInsets.all(16),
            child: isWide
                ? Column(
                    children: [
                      TopBar(
                        title: 'Course Overview',
                        subtitle: 'Back to Dashboard',
                      ),
                      Padding(
                        padding: const EdgeInsets.all(18.0),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Left main column
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      CourseHeaderCard(course: widget.course),
                                      SizedBox(height: 16),
                                      CourseTabs(),
                                      SizedBox(height: 16),
                                      CourseSummativeTable(
                                        controller: widget.controller,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 16),
                                // Right sidebar
                                SizedBox(
                                  width: 320,
                                  child: Column(
                                    children: const [
                                      GradingOverviewCard(),
                                      SizedBox(height: 16),
                                      CalendarCard(),
                                      SizedBox(height: 16),
                                      MessagesCard(),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      CourseHeaderCard(course: widget.course),
                      SizedBox(height: 16),
                      GradingOverviewCard(),
                      SizedBox(height: 16),
                      CourseTabs(),
                      SizedBox(height: 16),
                      CourseSummativeTable(controller: widget.controller),
                      SizedBox(height: 16),
                      CalendarCard(),
                      SizedBox(height: 16),
                      MessagesCard(),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
