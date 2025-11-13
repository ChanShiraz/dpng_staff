import 'package:dpng_staff/features/course/widgets/calendar_card.dart';
import 'package:dpng_staff/features/course/widgets/course_header_card.dart';
import 'package:dpng_staff/features/course/widgets/course_summative_table.dart';
import 'package:dpng_staff/features/course/widgets/course_tabs.dart';
import 'package:dpng_staff/features/course/widgets/course_topbar.dart';
import 'package:dpng_staff/features/course/widgets/grading_overview_card.dart';
import 'package:dpng_staff/features/course/widgets/messages_card.dart';
import 'package:flutter/material.dart';

class CourseOverviewPage extends StatelessWidget {
  const CourseOverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 1100;
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: isWide
                ? Column(
                    children: [
                      CourseTopbar(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Left main column
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                CourseHeaderCard(),
                                SizedBox(height: 16),
                                CourseTabs(),
                                SizedBox(height: 16),
                                CourseSummativeTable(),
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
                  )
                : Column(
                    children: const [
                      CourseHeaderCard(),
                      SizedBox(height: 16),
                      GradingOverviewCard(),
                      SizedBox(height: 16),
                      CourseTabs(),
                      SizedBox(height: 16),
                      CourseSummativeTable(),
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
