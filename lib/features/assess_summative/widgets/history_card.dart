import 'package:dpng_staff/features/assess_summative/controller/assess_summative_controller.dart';
import 'package:dpng_staff/features/assessment_center/models/summative_assessment.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatelessWidget {
  HistoryCard({super.key, this.error, required this.subid});
  final controller = Get.find<AssessSummativeController>();
  final int subid;
  final bool? error;

  @override
  Widget build(BuildContext context) {
    return _cardWrapper(
      title: "History",
      // content:
      //     "Previous submission graded on 2025-10-12 (BRIDGING). Student resubmitted with revisions.",
    );
  }

  Widget _cardWrapper({
    required String title,
    //required String content
  }) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Divider(),
        ),
        error == true
            ? Center(
                child: Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.fetchPastSummatives(subid);
                      },
                      icon: Icon(Icons.replay_outlined),
                    ),
                    Text(
                      'Error loading history',
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.pastSummatives.length,
                itemBuilder: (context, index) => Text(
                  '• Previous submission graded on ${DateFormat('yyyy-MM-dd').format(controller.pastSummatives[index].assessed!)} (${getGradeLabel(controller.pastSummatives[index].grade)}). Student resubmitted with revisions.',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
      ],
    ),
  );
}

String getGradeLabel(double grade) {
  if (grade == 0) {
    return 'INCOMPLETE';
  }
  if (grade == 8) {
    return 'PASS';
  }
  if (grade >= 0.5 && grade < 1.50) {
    return 'EMERGING';
  }
  if (grade >= 1.5 && grade < 2.5) {
    return 'CAPABLE';
  }
  if (grade >= 2.5 && grade < 3.5) {
    return 'BRIDGING';
  }
  if (grade >= 3.5 && grade < 4.5) {
    return 'PROFICIENT';
  }
  if (grade >= 4.5 && grade <= 5) {
    return 'METACOGNITION';
  }
  return '';
}
