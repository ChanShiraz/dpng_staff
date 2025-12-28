import 'package:dpng_staff/features/assess_formative/view/assess_formative_page.dart';
import 'package:dpng_staff/features/assess_summative/view/assess_summative_page.dart';
import 'package:dpng_staff/features/assessment_center/models/summative_assessment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class AssessmentItemWidget extends StatelessWidget {
  final SummativeAssessment item;
  const AssessmentItemWidget({
    super.key,
    required this.item,
    required this.index,
  });
  final int index;

  Widget smallChip(String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      margin: const EdgeInsets.only(right: 8),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Text(text, style: const TextStyle(fontSize: 12)),
    );
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat df = DateFormat('yyyy-MM-dd');
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade200),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      child: Row(
        children: [
          // left text block
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    // smallChip(item.author),
                    smallChip(item.title1),
                    smallChip(item.course_type == 4 ? 'Track A' : 'Track B'),
                    smallChip(df.format(item.date)),
                    const Spacer(),
                  ],
                ),
              ],
            ),
          ),

          // Action
          ElevatedButton(
            onPressed: () {
              Get.to(AssessSummativePage(summativeAssessment: item));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF081328),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
              elevation: 0,
            ),
            child: const Text('ASSESS'),
          ),
        ],
      ),
    );
  }
}
