import 'package:dpng_staff/utils/grade_helper.dart';
import 'package:flutter/material.dart';

class SummativeGradeWidget extends StatelessWidget {
  const SummativeGradeWidget({super.key, required this.grade});
  final int grade;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: GradeHelper.getGradeColor(grade),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          GradeHelper.getGradeLabel(grade),
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 10,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
