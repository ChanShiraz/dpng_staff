import 'package:dpng_staff/features/assess_formative/controller/assess_formative_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class AssessmentToolCard extends StatelessWidget {
  AssessmentToolCard({super.key, required this.fsubid});
  final controller = Get.find<AssessFormativeController>();
  final int fsubid;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Assessment Tool',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Divider(),
            ),
            const Text('Formative Assessment Guidance:'),
            const SizedBox(height: 4),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '• Satisfactory: ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextSpan(text: 'Meets minimum defined acceptable standards.'),
                ],
              ),
            ),

            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: '• Resubmit: ',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  TextSpan(
                    text:
                        'Does not meet standard, student must review and resubmit.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),
            Container(
              decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Overall Formative Decision',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                  ),
                  Obx(
                    () => Row(
                      children: [
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: controller.finalStatus.value == 1
                                ? Colors.black
                                : Colors.white,
                          ),
                          onPressed: () {
                            controller.finalStatus.value = 1;
                          },
                          child: Text(
                            'SATISFACTORY',
                            style: TextStyle(
                              color: controller.finalStatus.value == 1
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                        const SizedBox(width: 8),
                        OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            backgroundColor: controller.finalStatus.value == 2
                                ? Colors.black
                                : Colors.white,
                          ),
                          onPressed: () {
                            controller.finalStatus.value = 2;
                          },
                          child: Text(
                            'RESUBMIT',
                            style: TextStyle(
                              color: controller.finalStatus.value == 2
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text('Comment to student', style: TextStyle(color: Colors.black54)),
            SizedBox(height: 10),
            TextField(
              controller: controller.commentController,
              minLines: 4,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintStyle: TextStyle(color: Colors.black54),
                hintText: 'Share encouragement, next steps, or resources...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black38),
                ),
              ),
            ),
            const SizedBox(height: 12),
            Align(
              alignment: Alignment.centerRight,
              child: FilledButton(
                style: FilledButton.styleFrom(backgroundColor: Colors.black),
                onPressed: () {
                  controller.assessFormative(fsubid);
                },
                child: Obx(
                  () => controller.assessingFormative.value
                      ? Padding(
                          padding: EdgeInsetsGeometry.symmetric(horizontal: 57),
                          child: SizedBox(
                            width: 20,
                            height: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              color: Colors.white,
                            ),
                          ),
                        )
                      : const Text(
                          'Submit Assessment',
                          style: TextStyle(color: Colors.white),
                        ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
