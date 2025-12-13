import 'dart:ui';

import 'package:flutter/material.dart';

class GradeHelper {
  static String getGradeLabel(int grade) {
    if (grade == 8) return "PASS";
    if (grade < 0.5) return "NO EVIDENCE";
    if (grade < 1.5) return "EMERGING";
    if (grade < 2.5) return "CAPABLE";
    if (grade < 3.5) return "BRIDGING";
    if (grade < 4.5) return "PROFICIENT";
    if (grade <= 5) return "METACOGNITION";

    return "";
  }

  static Color getGradeColor(int grade) {
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

class StatusHelper {
  static String statusText(int status) {
    switch (status) {
      case 0:
        return 'NOT ASSESSED';
      case 1:
        return 'ASSESSED-ACCEPTED';
      case 2:
        return 'RESUBMIT';
      default:
        return 'NOT ASSESSED';
    }
  }

  static Color statusColor(int status) {
    switch (status) {
      case 0:
        return Colors.red;
      case 1:
        return Colors.green;
      case 2:
        return Colors.yellow.shade500;

      default:
        return Colors.red;
    }
  }
}
