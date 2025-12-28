import 'package:dpng_staff/features/assessment_center/controller/assessment_center_controller.dart';
import 'package:dpng_staff/features/assessment_center/models/summative_assessment.dart';
import 'package:dpng_staff/features/assessment_center/widgets/assessment_item.dart';
import 'package:dpng_staff/features/course/widgets/summatives_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class PendingSummativeList extends StatelessWidget {
  //final List<SummativeAssessment> items;
  PendingSummativeList({super.key});
  final controller = Get.find<AssessmentCenterController>();

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 200),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              // Header title
              Row(
                children: const [
                  Text(
                    'Pending Summatives',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 12),

              // List of items
              Obx(() {
                if (controller.fetchingSummativeAssessments.value) {
                  return SummativesShimmer(height: 80, quantity: 2);
                }

                if (controller.fetchSummativeError.isNotEmpty) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Column(
                      children: [
                        Text(
                          controller.fetchSummativeError.value,
                          style: const TextStyle(
                            color: Colors.redAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 12),
                        OutlinedButton(
                          onPressed: controller.fetchSummativeAssessments,
                          child: const Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                if (controller.summativeAssessments.isEmpty) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 30),
                    child: Text(
                      'No pending summatives!',
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  );
                }

                return ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.summativeAssessments.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 10),
                  itemBuilder: (context, index) {
                    return AssessmentItemWidget(
                      item: controller.summativeAssessments[index],
                      index: index,
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
