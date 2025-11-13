import 'package:dpng_staff/features/assessment_center/view/assessment_center_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AssessmentCard extends StatelessWidget {
  final String title;
  final int toGrade;
  final int submissions;
  final int total;
  const AssessmentCard({
    super.key,
    required this.title,
    required this.toGrade,
    required this.submissions,
    required this.total,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = total == 0 ? 0 : (submissions / total);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: InkWell(
        onTap: () => Get.to(AssessmentCenterPage()),
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '$toGrade to grade',
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '$submissions of $total submissions',
                style: const TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 12),
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: LinearProgressIndicator(value: progress, minHeight: 10),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
