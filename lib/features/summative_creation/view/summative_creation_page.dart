import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/assess_formative/widgets/topbar.dart';
import 'package:dpng_staff/features/summative_creation/controller/summative_creation_controller.dart';
import 'package:dpng_staff/features/summative_creation/widgets/progress_bar.dart';
import 'package:dpng_staff/features/summative_creation/widgets/rubric_level_chip.dart';
import 'package:dpng_staff/features/summative_creation/widgets/step1_scope.dart';
import 'package:dpng_staff/features/summative_creation/widgets/step2_rubric.dart';
import 'package:dpng_staff/features/summative_creation/widgets/step3_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummativeCreationSingleView extends StatefulWidget {
  const SummativeCreationSingleView({super.key});

  @override
  State<SummativeCreationSingleView> createState() =>
      _SummativeCreationSingleViewState();
}

class _SummativeCreationSingleViewState
    extends State<SummativeCreationSingleView> {
  final controller = Get.put(SummativeCreationController());
  @override
  void initState() {
    controller.fetchCategories();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              HeaderSection(
                step1Complete: controller.step1Complete.value,
                step2Complete: controller.step2Complete.value,
                step3Complete: controller.step3Complete.value,
                openStep: controller.openStep.value,
                onStepChange: controller.handleStepChange,
              ),

              Expanded(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      children: [
                        const SizedBox(height: 20),
                        Step1Scope(
                          // selectedScope: controller.selectedScope.value,
                          // onSelect: controller.handleScopeSelect,
                          openStep: controller.openStep.value,
                        ),
                        const SizedBox(height: 16),

                        Step2Rubric(
                          selectedRubricId: controller.selectedRubric.value,
                          step1Complete: controller.step1Complete.value,
                          openStep: controller.openStep.value,
                          onSelect: controller.handleRubricSelect,
                        ),
                        const SizedBox(height: 16),

                        Step3Details(
                          openStep: controller.openStep.value,
                          selectedRubric: controller.selectedRubric.value,
                          step2Complete: controller.step2Complete.value,
                          step3Ready: controller.step3Complete.value,
                          levelColors: levelColors,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  final bool step1Complete;
  final bool step2Complete;
  final bool step3Complete;
  final int? openStep;
  final Function(int) onStepChange;

  const HeaderSection({
    super.key,
    required this.step1Complete,
    required this.step2Complete,
    required this.step3Complete,
    required this.openStep,
    required this.onStepChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(12),
      child: Column(
        children: [
          TopBar(
            type: 2,
            title: 'Add ISL Summative',
            subtitle: 'Live creation • Steps unlock as you go.',
            trailing: Row(
              children: [
                _headerButton("Go to Step 1", 1, enabled: true),
                const SizedBox(width: 8),
                _headerButton("Go to Step 2", 2, enabled: step1Complete),
                const SizedBox(width: 8),
                _headerButton("Go to Step 3", 3, enabled: step2Complete),
              ],
            ),
          ),

          const SizedBox(height: 10),
          ProgressBar(
            openStep: openStep,
            step1Complete: step1Complete,
            step2Complete: step2Complete,
            step3Complete: step3Complete,
            onStepTap: onStepChange,
          ),
        ],
      ),
    );
  }

  Widget _headerButton(String label, int step, {required bool enabled}) {
    return OutlinedButton(
      onPressed: enabled ? () => onStepChange(step) : null,
      style: OutlinedButton.styleFrom(
        backgroundColor: enabled ? Colors.white : Colors.grey.shade100,
        foregroundColor: enabled ? Colors.black87 : Colors.grey,
      ),
      child: Text(label, style: const TextStyle(fontSize: 13)),
    );
  }
}
