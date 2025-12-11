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
          color: statusColor(),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          statusText(),
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

  String statusText() {
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

  Color statusColor() {
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
