import 'package:dpng_staff/features/student_summative_work/widgets/section_title.dart';
import 'package:flutter/material.dart';

class TaskSection extends StatelessWidget {
  final String text;
  const TaskSection({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SectionTitle("Task"),
          const SizedBox(height: 8),
          Text(text, style: const TextStyle(fontSize: 14.5, height: 1.4)),
        ],
      ),
    );
  }
}
