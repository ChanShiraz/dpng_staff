import 'package:dpng_staff/utils/grade_helper.dart';
import 'package:flutter/material.dart';

class SummativeStatus extends StatelessWidget {
  const SummativeStatus({super.key, required this.status});
  final int status;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: StatusHelper.statusColor(status),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          StatusHelper.statusText(status),
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
