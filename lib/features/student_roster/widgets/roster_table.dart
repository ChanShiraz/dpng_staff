import 'package:dpng_staff/features/student_roster/models/roster_course.dart';
import 'package:dpng_staff/features/student_roster/view/roster_student_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:shimmer/shimmer.dart';

class RosterTable extends StatelessWidget {
  const RosterTable({super.key, required this.courses});
  final List<RosterCourse> courses;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Table Header
            Container(
              color: Colors.grey.shade100,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                children: const [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Course',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Learning Track',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'View',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Table Rows
            ...courses.map(
              (row) => Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(flex: 4, child: Text(row.title1)),

                    Expanded(
                      flex: 2,
                      child: Text(
                        row.course_type == 4
                            ? 'Track A'
                            : row.course_type == 5
                            ? 'Track B'
                            : '',
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                          ),
                          onPressed: () {
                            Get.to(
                              RosterStudentPage(
                                a_cid: row.a_cid,
                                courseTitle: row.title1,
                              ),
                            );
                          },
                          child: const Text('View'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Pagination Footer
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Text('Showing 1–8 of 12'),
            //     Row(
            //       children: [
            //         OutlinedButton(
            //           onPressed: () {},
            //           child: const Text(
            //             'Prev',
            //             style: TextStyle(color: Colors.black),
            //           ),
            //         ),
            //         const SizedBox(width: 8),
            //         const Text('Page 1 / 2'),
            //         const SizedBox(width: 8),
            //         OutlinedButton(
            //           onPressed: () {},
            //           style: FilledButton.styleFrom(),
            //           child: const Text(
            //             'Next',
            //             style: TextStyle(color: Colors.black),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
          ],
        ),
      ),
    );
  }
}

class RosterTableShimmer extends StatelessWidget {
  const RosterTableShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Card(
        elevation: 1,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              // HEADER
              Container(
                color: Colors.grey.shade100,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 8,
                ),
                child: Row(
                  children: const [
                    Expanded(
                      flex: 4,
                      child: _ShimmerBox(width: 100, height: 16),
                    ),
                    Expanded(
                      flex: 2,
                      child: _ShimmerBox(width: 80, height: 16),
                    ),
                    Expanded(
                      flex: 1,
                      child: _ShimmerBox(width: 40, height: 16),
                    ),
                  ],
                ),
              ),

              const Divider(height: 1),

              // ROWS (5 skeletons)
              ...List.generate(
                5,
                (_) => Container(
                  padding: const EdgeInsets.symmetric(
                    vertical: 14,
                    horizontal: 8,
                  ),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(color: Colors.grey.shade200),
                    ),
                  ),
                  child: Row(
                    children: const [
                      Expanded(flex: 4, child: _ShimmerBox(height: 16)),
                      Expanded(flex: 2, child: _ShimmerBox(height: 16)),
                      Expanded(
                        flex: 1,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: _ShimmerBox(width: 60, height: 30),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 16),

              // PAGINATION FOOTER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  _ShimmerBox(width: 120, height: 16),
                  Row(
                    children: [
                      _ShimmerBox(width: 60, height: 30),
                      SizedBox(width: 12),
                      _ShimmerBox(width: 80, height: 16),
                      SizedBox(width: 12),
                      _ShimmerBox(width: 60, height: 30),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ShimmerBox extends StatelessWidget {
  final double? width;
  final double height;

  const _ShimmerBox({super.key, this.width, this.height = 14});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6),
      ),
    );
  }
}
