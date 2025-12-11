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
          color: _getColor(),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          _getLabel(),
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

  String _getLabel() {
    if (grade == 8) return "PASS";

    if (grade < 0.5) return "NO EVIDENCE";
    if (grade < 1.5) return "EMERGING";
    if (grade < 2.5) return "CAPABLE";
    if (grade < 3.5) return "BRIDGING";
    if (grade < 4.5) return "PROFICIENT";
    if (grade <= 5) return "METACOGNITION";

    return "UNKNOWN";
  }

  Color _getColor() {
    if (grade < 0.5) return Colors.red.shade500; // NO EVIDENCE
    if (grade == 8) return Colors.grey.shade800; // PASS
    if (grade < 1.5) return Colors.yellow.shade600; // EMERGING
    if (grade < 2.5) return Colors.blue.shade400; // CAPABLE
    if (grade < 3.5) return Colors.purple.shade400; // BRIDGING
    if (grade < 4.5) return Colors.blue.shade700; // PROFICIENT
    if (grade <= 5) return Colors.green.shade600; // METACOGNITION

    return Colors.black;
  }
}
