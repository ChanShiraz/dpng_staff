import 'package:dpng_staff/features/student_summative_work/controller/summative_work_detail_controller.dart';
import 'package:dpng_staff/features/student_summative_work/models/summative_submission.dart';
import 'package:flutter/material.dart';

class RubricSection extends StatelessWidget {
  final List<String> rubricLevels;
  final String currentRubricLevel;
  // final bool open;
  final VoidCallback onToggle;
  final SummativeWorkDetailController summativeDetailController;
  final SummativeSubmission submission;

  const RubricSection({
    super.key,
    required this.rubricLevels,
    required this.currentRubricLevel,
    required this.summativeDetailController,
    //required this.open,
    required this.onToggle,
    required this.submission,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Header row (tap to toggle)
        InkWell(
          onTap: onToggle,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: const BoxDecoration(
              border: Border(bottom: BorderSide(color: Color(0xffe2e8f0))),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Rubric Information",
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 6,
                        runSpacing: 6,
                        children: rubricLevels.map((level) {
                          final isActive = level == currentRubricLevel;
                          return InkWell(
                            onTap: () =>
                                summativeDetailController.selectedRubric.value =
                                    level,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 10,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                color: isActive
                                    ? Colors.indigo
                                    : const Color(0xfff1f5f9),
                                borderRadius: BorderRadius.circular(18),
                              ),
                              child: Text(
                                level,
                                style: TextStyle(
                                  fontSize: 11,
                                  letterSpacing: 1,
                                  color: isActive
                                      ? Colors.white
                                      : Colors.grey.shade700,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                // Icon(
                //   open ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                //   color: Colors.grey,
                // ),
              ],
            ),
          ),
        ),
        // Panel
        // if (open)
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          child: Text(
            rubricDescription(),
            style: TextStyle(fontSize: 14.5, height: 1.4),
          ),
        ),
      ],
    );
  }

  String rubricDescription() {
    final selected = summativeDetailController.selectedRubric.value;

    if (selected == summativeDetailController.rubricLevels[0]) {
      return submission.emerging_rubric;
    } else if (selected == summativeDetailController.rubricLevels[1]) {
      return submission.capable_rubric;
    } else if (selected == summativeDetailController.rubricLevels[2]) {
      return submission.bridging_rubric;
    } else if (selected == summativeDetailController.rubricLevels[3]) {
      return submission.proficient_rubric;
    } else if (selected == summativeDetailController.rubricLevels[4]) {
      return submission.bridging_rubric;
    } else if (selected == summativeDetailController.rubricLevels[5]) {
      return submission.advanced_rubric;
    }

    return "";
  }
}
