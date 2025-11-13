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

class RubricCreationPage extends StatelessWidget {
  final RubricController c = Get.put(RubricController());

  RubricCreationPage({super.key});

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
                        index: 1,
                        title: "Step 1 — Basics",
                        subtitle: "Enter title and choose main scope",
                        completed: c.step1Complete,
                        locked: false,
                        onNext: c.step1Complete
                            ? () => c.openStep.value = 2
                            : null,
                        child: Step1Basics(),
                      ),
                      SectionCard(
                        index: 2,
                        title: "Step 2 — Additional Scopes",
                        subtitle:
                            "(Optional) Select any additional scopes that this rubric will integrate.",
                        completed: c.additionalScopes.isNotEmpty,
                        locked: !c.step1Complete,
                        child: Step2AdditionalScopes(),
                        onBack: () => c.openStep.value = 1,
                        onNext: () => c.openStep.value = 3,
                      ),
                      SectionCard(
                        index: 3,
                        title: "Step 3 — Choose DP Competencies",
                        subtitle:
                            "Pick one or more competencies from each relevant scope (use the tabs).",
                        completed: c.step3Complete,
                        locked: !c.step1Complete,
                        onBack: () => c.openStep.value = 2,
                        onNext: c.step3Complete
                            ? () => c.openStep.value = 4
                            : null,
                        child: Step3Competencies(rubricRows: c.rubricRows),
                      ),
                      SectionCard(
                        index: 4,
                        title: "Step 4 — Standards",
                        subtitle: "Select related standards",
                        completed: c.step4Complete,
                        locked: !c.step3Complete,
                        onBack: () => c.openStep.value = 3,
                        onNext: c.step4Complete
                            ? () => c.openStep.value = 5
                            : null,
                        child: Step4Standards(rubricRows: c.rubricRows),
                      ),
                      SectionCard(
                        index: 5,
                        title: "Step 5 — Write Rubric Language by Level",
                        subtitle:
                            "Draft the integrated rubric text for each proficiency level (Metacognition replaces Advanced).",
                        completed: c.step5Ready,
                        locked: !c.step4Complete,
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    IconButton(
                      onPressed: () => Get.back(),
                      icon: Icon(Icons.arrow_back_ios_new),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: const [
                        Text(
                          "Build Integrated Rubric",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Follow steps in order; each unlocks the next",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    OutlinedButton(onPressed: () {}, child: Text('Step 1')),
                    SizedBox(width: 8),
                    OutlinedButton(onPressed: () {}, child: Text('Step 2')),
                    SizedBox(width: 8),
                    OutlinedButton(onPressed: () {}, child: Text('Step 3')),
                    SizedBox(width: 8),
                    OutlinedButton(onPressed: () {}, child: Text('Step 4')),
                    SizedBox(width: 8),
                    OutlinedButton(onPressed: () {}, child: Text('Step 5')),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ProgressStepper(
              steps: [
                StepData(
                  stepNumber: 1,
                  title: 'Basic',
                  subtitle: 'Title Main',
                  status: c.step1Complete
                      ? StepStatus.completed
                      : StepStatus.active,
                ),
                StepData(
                  stepNumber: 2,
                  title: 'More Scopes',
                  subtitle: 'Additional Alignments',
                ),
                StepData(
                  stepNumber: 3,
                  title: 'Competencies',
                  subtitle: 'Pick by Scope Tabs',
                ),
                StepData(
                  stepNumber: 4,
                  title: 'Standards',
                  subtitle: 'Select CCSS/State',
                ),
                StepData(
                  stepNumber: 5,
                  title: 'Rubric Levels',
                  subtitle: 'Write E/C/B/P/M',
                ),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
