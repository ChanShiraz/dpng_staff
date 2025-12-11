import 'package:flutter/material.dart';

class StatusBadge extends StatelessWidget {
  final String text;
  const StatusBadge({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    Color color = text == "COMPLETED"
        ? Colors.green
        : text == "NO STUDENTS"
        ? Colors.grey
        : Colors.orange;
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      ),
    );
  }
}
