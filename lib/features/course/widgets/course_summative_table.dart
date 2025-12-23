import 'package:dpng_staff/features/course/controller/course_overview_controller.dart';
import 'package:dpng_staff/features/course/widgets/summatives_shimmer.dart';
import 'package:dpng_staff/features/home/models/course_model.dart';
import 'package:dpng_staff/features/student_roster/widgets/roster_table.dart';
import 'package:dpng_staff/features/student_roster/widgets/student_tile.dart';
import 'package:dpng_staff/features/summative_assignment/view/summative_assignment_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:shimmer/shimmer.dart';

class CourseSummativeTable extends StatelessWidget {
  const CourseSummativeTable({
    super.key,
    required this.controller,
    required this.course,
  });
  final CourseOverviewController controller;
  final CourseModel course;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Course Summatives',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 12),
            Obx(
              () => controller.fetchingSummatives.value
                  ? SummativesShimmer()
                  // StudentRosterShimmer(qty: 4)
                  : SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        headingRowColor: WidgetStatePropertyAll(
                          Colors.grey.shade100,
                        ),
                        columns: const [
                          DataColumn(label: Text('Title')),
                          DataColumn(label: Text('Assessed/Accepted')),
                          DataColumn(label: Text('Pending')),
                          DataColumn(label: Text('Resubmits')),
                          DataColumn(label: Text('Past Due')),
                          DataColumn(label: Text('Not Assigned')),
                          DataColumn(label: Text('Tools')),
                        ],
                        rows: controller.summatives
                            .map(
                              (e) => DataRow(
                                cells: [
                                  DataCell(Text(e.title)),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '1',
                                        style: const TextStyle(
                                          color: Colors.green,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '2',
                                        style: const TextStyle(
                                          color: Colors.blue,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '3',
                                        style: TextStyle(color: Colors.orange),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Center(
                                      child: Text(
                                        '4',
                                        style: TextStyle(color: Colors.red),
                                      ),
                                    ),
                                  ),
                                  DataCell(Center(child: Text('5'))),
                                  DataCell(
                                    Center(
                                      child: Center(
                                        child: Row(
                                          children: [
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Edit',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            OutlinedButton(
                                              onPressed: () {},
                                              child: Text(
                                                'Grade',
                                                style: TextStyle(
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            SizedBox(width: 10),
                                            ElevatedButton(
                                              style: ElevatedButton.styleFrom(
                                                backgroundColor: Colors.black,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadiusGeometry.circular(
                                                        10,
                                                      ),
                                                ),
                                              ),
                                              onPressed: () {
                                                Get.to(
                                                  SummativeAssignmentPage(
                                                    summative: e,
                                                    course: course,
                                                  ),
                                                );
                                              },
                                              child: Text(
                                                'Assign',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
