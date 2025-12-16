import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:dpng_staff/features/rubric_creation/widgets/aligned_competencies_card.dart';
import 'package:dpng_staff/features/rubric_creation/widgets/levels_section.dart';
import 'package:dpng_staff/features/rubric_creation/widgets/state_standard_card.dart';
import 'package:dpng_staff/features/summative_creation/controller/summative_creation_controller.dart'
    show levelColors;
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class Step5RubricLevels extends GetView<RubricController> {
  const Step5RubricLevels({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(child: AlignedCompetenciesCard()),
                SizedBox(width: 15),
                Expanded(child: StateStandardCard()),
              ],
            ),
          ),

          LevelsSection(),
          const SizedBox(height: 16),

          /// COMPLETION STATUS
          RoundContainer(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      controller.step5Ready.value
                          ? Icons.check_circle
                          : Icons.lock,
                      color: controller.step5Ready.value
                          ? Colors.green
                          : Colors.grey,
                      size: 18,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      controller.step5Ready.value
                          ? 'All rubric levels completed'
                          : 'Complete all levels to continue enable preview and submission.',
                      style: TextStyle(
                        color: controller.step5Ready.value
                            ? Colors.black
                            : Colors.grey,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: controller.step5Ready.value ? () {} : null,
                      child: Text('Save Draft'),
                    ),
                    SizedBox(width: 10),
                    OutlinedButton(
                      onPressed: controller.step5Ready.value ? () {} : null,
                      child: Text('Preview'),
                    ),
                    SizedBox(width: 10),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      onPressed: controller.step5Ready.value ? () {} : null,
                      child: Text(
                        'Submit Rubric',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  /// ---------------- HELPERS ----------------
}

class RoundContainer extends StatelessWidget {
  const RoundContainer({
    super.key,
    required this.child,
    this.color,
    this.padding = 10,
    this.circular = 10
  });
  final Widget child;
  final Color? color;
  final double padding;
  final double circular;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(circular),
      ),
      child: child,
    );
  }
}
