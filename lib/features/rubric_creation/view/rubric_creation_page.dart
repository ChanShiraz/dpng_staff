import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/assess_formative/widgets/topbar.dart';
import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step1_basics.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step2_additional_scopes.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step3_competencies.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step4_standards.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/rubric_creation/widgets/progress_bar.dart';
import 'package:dpng_staff/features/rubric_creation/widgets/section_card.dart';
import 'package:dpng_staff/features/summative_creation/widgets/progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RubricCreationPage extends StatefulWidget {
  const RubricCreationPage({super.key});

  @override
  State<RubricCreationPage> createState() => _RubricCreationPageState();
}

class _RubricCreationPageState extends State<RubricCreationPage> {
  late RubricController c;
  @override
  void initState() {
    c = Get.put(RubricController());
    c.fetchCategories();
    c.step1ExController.expand();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            _Header(),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(16),
                child: Obx(
                  () => Column(
                    children: [
                      SectionCard(
                        expansibleController: c.step1ExController,
                        index: 1,
                        title: "Step 1 — Basics",
                        subtitle: "Enter title and choose main scope",
                        completed: c.step1Complete.value,
                        locked: false,
                        onNext: c.step1Complete.value
                            ? () {
                                c.openStep.value = 2;

                                c.step2ExController.expand();
                                c.step2Complete.value = true;
                              }
                            : null,
                        child: Step1Basics(),
                      ),
                      SectionCard(
                        expansibleController: c.step2ExController,
                        index: 2,
                        title: "Step 2 — Additional Scopes",
                        subtitle:
                            "(Optional) Select any additional scopes that this rubric will integrate.",
                        completed: c.additionalSelectedScopes.isNotEmpty,
                        locked: !c.step1Complete.value,
                        child: Step2AdditionalScopes(),
                        onBack: () => c.openStep.value = 1,
                        onNext: () {
                          c.openStep.value = 3;
                          c.step3ExController.expand();
                        },
                      ),
                      SectionCard(
                        expansibleController: c.step3ExController,
                        index: 3,
                        title: "Step 3 — Choose DP Competencies",
                        subtitle:
                            "Pick one or more competencies from each relevant scope (use the tabs).",
                        completed: c.step3Complete.value,
                        locked: !c.step1Complete.value,
                        onBack: () => c.openStep.value = 2,
                        onNext: c.step3Complete.value
                            ? () {
                                c.openStep.value = 4;
                                c.step4ExController.expand();
                              }
                            : null,
                        child: Step3Competencies(),
                      ),
                      Obx(
                        () => SectionCard(
                          expansibleController: c.step4ExController,
                          index: 4,
                          title: "Step 4 — Standards",
                          subtitle: "Select related standards",
                          completed: c.step4Complete.value,
                          locked: !c.step3Complete.value,
                          onBack: () => c.openStep.value = 3,
                          onNext: c.step4Complete.value
                              ? () {
                                  c.openStep.value = 5;
                                  c.step5ExController.expand();
                                  c.step5Ready.value = true;
                                }
                              : null,
                          child: (c.selectedCategory.value?.ccid ?? 0) != 4
                              ? Step4Standards()
                              : Step4ScienceStandards(),
                        ),
                      ),
                      SectionCard(
                        expansibleController: c.step5ExController,
                        index: 5,
                        title: "Step 5 — Write Rubric Language by Level",
                        subtitle:
                            "Draft the integrated rubric text for each proficiency level (Metacognition replaces Advanced).",
                        completed: c.step5Ready.value,
                        locked: !c.step4Complete.value,
                        child: Step5RubricLevels(),
                        onBack: () => c.openStep.value = 4,
                      ),
                    ],
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

class _Header extends StatelessWidget {
  final RubricController c = Get.find<RubricController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.9),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
            child: TopBar(
              type: 2,
              title: 'Build Integrated Rubric',
              subtitle: 'Follow steps in order; each unlocks the ne',
              // trailing: Row(
              //   children: [
              //     OutlinedButton(onPressed: () {}, child: Text('Step 1')),
              //     SizedBox(width: 8),
              //     OutlinedButton(onPressed: () {}, child: Text('Step 2')),
              //     SizedBox(width: 8),
              //     OutlinedButton(onPressed: () {}, child: Text('Step 3')),
              //     SizedBox(width: 8),
              //     OutlinedButton(onPressed: () {}, child: Text('Step 4')),
              //     SizedBox(width: 8),
              //     OutlinedButton(onPressed: () {}, child: Text('Step 5')),
              //   ],
              // ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Obx(
              () => ProgressStepper(
                steps: [
                  StepData(
                    stepNumber: 1,
                    title: 'Basic',
                    subtitle: 'Title Main',
                    status: c.step1Complete.value
                        ? StepStatus.completed
                        : StepStatus.active,
                  ),
                  StepData(
                    stepNumber: 2,
                    title: 'More Scopes',
                    subtitle: 'Additional Alignments',
                    status: c.step2Complete.value
                        ? StepStatus.completed
                        : StepStatus.active,
                  ),
                  StepData(
                    stepNumber: 3,
                    title: 'Competencies',
                    subtitle: 'Pick by Scope Tabs',
                    status: c.step3Complete.value
                        ? StepStatus.completed
                        : StepStatus.active,
                  ),
                  StepData(
                    stepNumber: 4,
                    title: 'Standards',
                    subtitle: 'Select CCSS/State',
                    status: c.step4Complete.value
                        ? StepStatus.completed
                        : StepStatus.active,
                  ),
                  StepData(
                    stepNumber: 5,
                    title: 'Rubric Levels',
                    subtitle: 'Write E/C/B/P/M',
                    status: c.step5Ready.value
                        ? StepStatus.completed
                        : StepStatus.active,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
