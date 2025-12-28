import 'package:dpng_staff/features/assessment_center/view/assessment_center_page.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:shimmer/shimmer.dart';

class AssessmentCard extends StatelessWidget {
  final String title;
  final int toGrade;
  final int submissions;
  final int total;
  final bool? formatives;
  const AssessmentCard({
    super.key,
    required this.title,
    required this.toGrade,
    required this.submissions,
    required this.total,
    this.formatives,
  });

  @override
  Widget build(BuildContext context) {
    final double progress = total == 0 ? 0 : (submissions / total);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: InkWell(
        onTap: () => Get.to(AssessmentCenterPage(formatives: formatives)),
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

class AssessmentCardShimmer extends StatelessWidget {
  const AssessmentCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Title skeleton
              Container(height: 18, width: 180, color: Colors.white),
              const SizedBox(height: 12),

              // Large number
              Container(height: 26, width: 100, color: Colors.white),
              const SizedBox(height: 6),

              // Subtext
              Container(height: 16, width: 140, color: Colors.white),
              const SizedBox(height: 12),

              // Progress bar skeleton
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Container(
                  height: 10,
                  width: double.infinity,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
