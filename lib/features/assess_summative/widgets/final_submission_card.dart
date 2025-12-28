import 'package:dpng_staff/features/assess_summative/controller/assess_summative_controller.dart';
import 'package:dpng_staff/features/assessment_center/models/summative_assessment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class FinalSubmissionCard extends StatelessWidget {
  FinalSubmissionCard({super.key, required this.summative});
  final SummativeAssessment summative;
  final controller = Get.find<AssessSummativeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Final Submission Information",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Divider(),
          ),
          const Text("Guidelines", style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 8),
          const Text(
            "Please input a comment for the student regarding their performance on the summative:",
          ),
          const SizedBox(height: 8),

          TextField(
            minLines: 4,
            keyboardType: TextInputType.multiline,
            maxLines: null,
            controller: controller.commentController,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.black38),
              ),
              hintText: "Type feedback...",
              hintStyle: TextStyle(color: Colors.black54),
            ),
          ),
          const SizedBox(height: 16),
          const Text("Select Summative Acceptance Status:"),
          const SizedBox(height: 8),
          Obx(
            () => Wrap(
              spacing: 8,
              children: [
                _statusButton(
                  "SUMMATIVE ACCEPTED",
                  controller.resubmitStatus.value == 1,
                  () {
                    controller.resubmitStatus.value = 1;
                  },
                ),
                _statusButton(
                  "SUMMATIVE RESUBMIT",
                  controller.resubmitStatus.value == 2,
                  () {
                    controller.resubmitStatus.value = 2;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                controller.submitAssessment(summative);
              },
              child: Obx(
                () => controller.submittingAssessment.value
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 58),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 3,
                          ),
                        ),
                      )
                    : const Text("Submit Assessment"),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _statusButton(String text, bool selected, VoidCallback onTap) =>
      selected
      ? ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
          child: Text(text, style: TextStyle(color: Colors.white)),
        )
      : OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.black,
            side: const BorderSide(color: Colors.black26),
          ),
          onPressed: onTap,
          child: Text(text),
        );
}
