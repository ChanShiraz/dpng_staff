import 'dart:math';

import 'package:dpng_staff/common/round_icon_button.dart';
import 'package:dpng_staff/features/grades/models/student.dart';
import 'package:dpng_staff/features/student_roster/models/roster_student.dart';
import 'package:dpng_staff/features/student_summative_work/view/summative_work_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:shimmer/shimmer.dart';

class StudentTile extends StatelessWidget {
  const StudentTile({
    super.key,
    required this.entry,
    required this.courseId,
    required this.courseTitle,
  });
  final MapEntry<int, RosterStudent> entry;
  final int courseId;
  final String courseTitle;

  @override
  Widget build(BuildContext context) {
    final index = entry.key;
    final student = entry.value;
    final bg = index.isEven ? Colors.white : const Color(0xfff8fafc);
    return Container(
      decoration: BoxDecoration(
        color: bg,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),

      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(
              '${student.first} ${student.last}',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                color: Color(0xff0f172a),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              student.email ?? '',
              style: const TextStyle(color: Color(0xff475569)),
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                roundIconButton(Icons.search, () {
                  Get.to(
                    SummativeWorkPage(
                      studentId: student.userId,
                      courseId: courseId,
                      courseTitle: courseTitle,
                      student: '${student.first} ${student.last}',
                    ),
                  );
                }),
                const SizedBox(width: 6),
                roundIconButton(Icons.key, () {}),
                const SizedBox(width: 6),
                roundIconButton(Icons.arrow_forward, () {}),
                const SizedBox(width: 6),
                roundIconButton(Icons.bar_chart, () {}),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StudentRosterShimmer extends StatelessWidget {
  const StudentRosterShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // HEADER SHIMMER
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: const Color(0xfff8fafc),
              border: const Border(
                bottom: BorderSide(color: Color(0xffe2e8f0)),
              ),
            ),
            child: Row(
              children: const [
                Expanded(flex: 2, child: _ShimmerBox(width: 80, height: 12)),
                Expanded(flex: 2, child: _ShimmerBox(width: 100, height: 12)),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: _ShimmerBox(width: 60, height: 12),
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 6),

          // LIST ROW SHIMMERS (10 rows)
          ...List.generate(10, (index) {
            final bg = index.isEven ? Colors.white : const Color(0xfff8fafc);
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              decoration: BoxDecoration(
                color: bg,
                borderRadius: BorderRadius.circular(20),
              ),
              margin: const EdgeInsets.only(bottom: 4),
              child: Row(
                children: [
                  const Expanded(flex: 2, child: _ShimmerBox(height: 14)),
                  const Expanded(flex: 2, child: _ShimmerBox(height: 14)),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: List.generate(
                        4,
                        (_) => Padding(
                          padding: const EdgeInsets.only(left: 6),
                          child: Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xffe2e8f0)),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: const _ShimmerBox(height: 16, width: 16),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}

/// SHIMMER BOX WIDGET
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
