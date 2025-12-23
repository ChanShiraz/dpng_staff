import 'package:dpng_staff/features/district_summative_library/widgets/summative_card.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/summative_creation/controller/rubric_level_controller.dart';
import 'package:dpng_staff/features/summative_creation/controller/summative_creation_controller.dart';
import 'package:dpng_staff/features/summative_creation/models/rubric.dart';
import 'package:dpng_staff/features/summative_creation/widgets/instructional_material_dialog.dart';
import 'package:dpng_staff/features/summative_creation/widgets/resource_section.dart';
import 'package:dpng_staff/features/summative_creation/widgets/rubric_level_chip.dart';
import 'package:dpng_staff/features/summative_creation/widgets/summative_link_dialog.dart';
import 'package:dpng_staff/features/summative_creation/widgets/summative_text_dialog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';
import 'section_card.dart';

class Step3Details extends StatelessWidget {
  final int? openStep;
  final SummativeRubric? selectedRubric;
  final bool step2Complete;
  final bool step3Ready;
  final Map<String, Color> Function(String) levelColors;
  final controller = Get.find<SummativeCreationController>();
  final rubricLevelController = Get.find<RubricLevelController>();

  Step3Details({
    super.key,
    required this.openStep,
    required this.selectedRubric,
    required this.step2Complete,
    required this.step3Ready,
    required this.levelColors,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      index: 3,
      title: "Step 3 — Finalize Summative Details",
      subtitle:
          "Title, deliverable, course association, scaffolded rubric text.",
      locked: !step2Complete,
      completed: step3Ready,
      // isOpen: openStep == 3,
      // onToggle: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          SizedBox(height: 15),
          RoundContainer(padding: 25, circular: 20, child: _textFieldRow()),
          const SizedBox(height: 16),
          IntrinsicHeight(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Obx(
                    () => ResourceSection(
                      title: 'Summative Resources Available',
                      subtitle:
                          'Add teacher provided items learners can access during the summative.',
                      primaryButtonText: 'Add Text',
                      secondaryButtonText: 'Add Link',
                      primaryIcon: Icons.sticky_note_2_outlined,
                      secondaryIcon: Icons.link_outlined,
                      rows: controller.resourcecsAvailable.value,
                      onPrimaryTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => SummativeTextDialog(),
                        );
                      },
                      onSecondaryTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => SummativeLinkDialog(),
                        );
                      },
                    ),
                  ),
                ),
                SizedBox(width: 24),
                Expanded(
                  child: ResourceSection(
                    title: 'Approved Instructional Materials',
                    subtitle:
                        'Add teacher provided items learners can access during the summative.',
                    primaryButtonText: 'Add Resource',
                    primaryIcon: Icons.note_add_outlined,
                    rows: [],
                    onPrimaryTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => InstructionalMaterialDialog(),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          RubricLevelChip(),
          const SizedBox(height: 16),
          // _rubricInfo(),
          const SizedBox(height: 16),
          ScafolddingEntry(),
          const SizedBox(height: 16),
          _footerButtons(context),
        ],
      ),
    );
  }

  Widget _textFieldRow() {
    return Row(
      children: [
        Expanded(
          child: _input(
            "Title",
            'e.g., Systems of Equations Performance Task',

            rubricLevelController.titleController,
            //onTitleChange,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _input(
            "Deliverable/ Product / Task",
            'e.g. Collaborative investigation + written analysis',

            rubricLevelController.taskController,
            // onDeliverableChange,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _input(
            "Common Course Association",
            'e.g. Math1, Unit 3, Module M01',

            rubricLevelController.courseAssociationController,
            //onCourseChange,
          ),
        ),
      ],
    );
  }

  Widget _input(String label, String hint, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(color: Colors.black87)),
          SizedBox(height: 5),
          TextField(
            decoration: InputDecoration(
              hint: Text(hint, style: TextStyle(color: Colors.black54)),
              border: const OutlineInputBorder(),
              isDense: true,
            ),
            controller: controller,
            // onChanged: onChange,
          ),
        ],
      ),
    );
  }

  // Widget _rubricInfo() {
  //   return IntrinsicHeight(
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Expanded(
  //           child: Container(
  //             padding: const EdgeInsets.all(12),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               border: Border.all(color: Colors.grey.shade300),
  //               borderRadius: BorderRadius.circular(8),
  //             ),
  //             child: selectedRubric.isNotEmpty
  //                 ? Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: [
  //                       Text(
  //                         'Competency & Standards (from step 2)',
  //                         // "${selectedRubric['competency']['code']} — ${selectedRubric['competency']['desc']}",
  //                         style: const TextStyle(fontWeight: FontWeight.w500),
  //                       ),
  //                       SizedBox(height: 5),
  //                       ...List.generate(
  //                         (selectedRubric['standards'] as List).length,
  //                         (i) => Text(
  //                           selectedRubric['standards'][i],
  //                           style: const TextStyle(
  //                             fontSize: 12,
  //                             color: Colors.black54,
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   )
  //                 : const Text("Select a rubric in Step 2 to display details."),
  //           ),
  //         ),
  //         const SizedBox(width: 8),
  //         Expanded(
  //           child: Container(
  //             padding: const EdgeInsets.all(12),
  //             decoration: BoxDecoration(
  //               color: Colors.white,
  //               border: Border.all(color: Colors.grey.shade300),
  //               borderRadius: BorderRadius.circular(8),
  //             ),
  //             child: Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 Text(
  //                   'Example of Integrated Rubric Language',
  //                   style: TextStyle(fontWeight: FontWeight.w500),
  //                 ),
  //                 SizedBox(height: 5),
  //                 Text(
  //                   selectedRubric.isNotEmpty
  //                       ? "Students collaboratively model and solve a real-world task related to “${selectedRubric['summary']}”."
  //                       : "Choose a rubric in Step 2 to auto-generate example language.",
  //                   style: const TextStyle(fontSize: 13, color: Colors.black54),
  //                 ),
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _footerButtons(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              step3Ready ? Icons.check_circle : Icons.lock,
              color: step3Ready ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              step3Ready
                  ? "Ready to submit."
                  : "Fill in all fields to enable submission.",
            ),
          ],
        ),
        Row(
          children: [
            OutlinedButton(
              onPressed: step3Ready ? () {} : null,
              child: const Text("Save Draft"),
            ),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: step3Ready
                  ? controller.insertingSummative.value
                        ? null
                        : () async {
                            await controller.insertSummative();
                            Get.delete<RubricLevelController>();
                            showDesktopToast(context, 'Summmative added!');
                          }
                  : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: step3Ready
                    ? Colors.green
                    : Colors.grey.shade400,
              ),
              child: Obx(
                () => controller.insertingSummative.value
                    ? Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 52),
                        child: SizedBox(
                          height: 20,
                          width: 20,
                          child: CircularProgressIndicator(
                            color: Colors.white,
                            strokeWidth: 2,
                          ),
                        ),
                      )
                    : const Text("Submit Summative"),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
