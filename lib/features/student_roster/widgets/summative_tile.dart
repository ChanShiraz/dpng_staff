import 'package:dpng_staff/common/round_icon_button.dart';
import 'package:dpng_staff/features/student_roster/models/summative_work.dart';
import 'package:dpng_staff/features/student_roster/view/summative_work_page.dart';
import 'package:dpng_staff/features/student_roster/widgets/summative_grade_widget.dart';
import 'package:dpng_staff/features/student_roster/widgets/summative_status.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SummativeTile extends StatelessWidget {
  SummativeTile({
    super.key,
    required this.student,
    required this.work,
    required this.index,
  });
  final String student;
  final int index;
  final SummativeWork work;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 14),
        decoration: BoxDecoration(
          color: index.isEven ? Colors.white : const Color(0xfff8fafc),
          border: const Border(bottom: BorderSide(color: Color(0xfff1f5f9))),
        ),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Text(
                student,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  color: Color(0xff0f172a),
                ),
              ),
            ),
            Expanded(flex: 1, child: Text(dateFormat.format(work.assessed))),
            Expanded(flex: 2, child: Text(work.title)),
            SummativeStatus(status: work.status),

            SummativeGradeWidget(grade: work.grade),
            roundIconButton(Icons.search, () {}),
          ],
        ),
      ),
    );
  }

  DateFormat dateFormat = DateFormat('yyyy-MM-dd');
}
