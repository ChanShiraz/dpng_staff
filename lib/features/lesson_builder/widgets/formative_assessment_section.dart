import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_builder_controller.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/add_material_dialog.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/content_presentation_section.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/upload_button.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class FormativeAssessmentSection extends StatelessWidget {
  FormativeAssessmentSection({super.key});
  final controller = Get.find<LessonBuilderController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RoundContainer(
          width: double.infinity,
          padding: 20,
          color: Colors.green.shade50.withOpacity(0.5),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Formative assessments',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(height: 7),
                      Text(
                        'These check-for-understanding points will appear as icons in the student\'s learning journey.',
                        style: TextStyle(fontSize: 12, color: Colors.black54),
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AddMaterialDialog(
                              lessonId: controller.lessonId.value!,
                              materialType: 4,
                              type: 3,
                              title: 'Add formative assessment (text)',
                            ),
                          );
                        },
                        label: Text(
                          'Add Text Formative',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        icon: Icon(
                          Icons.text_snippet_outlined,
                          color: Colors.black,
                          size: 16,
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => AddMaterialDialog(
                              lessonId: controller.lessonId.value!,
                              materialType: 4,
                              type: 2,
                              title: 'Add formative assessment (link)',
                            ),
                          );
                        },
                        label: Text(
                          'Add Link Formative',
                          style: TextStyle(color: Colors.black, fontSize: 12),
                        ),
                        icon: Icon(Icons.link, color: Colors.black, size: 16),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsetsGeometry.symmetric(vertical: 15),
                child: Divider(),
              ),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.formatives.length,
                  itemBuilder: (context, index) {
                    final formative = controller.formatives[index];
                    return PresentationItem(
                      path: formative.path,
                      type: formative.type,
                      title: formative.title,
                      optionlNote: formative.description,
                      link: formative.link,
                      onDeleteTap: () {
                        controller.removeFormative(formative);
                      },
                      onEditTap: () {},
                    );
                  },
                ),
              ),
              // Obx(
              //   () => UploadButton(
              //     show: controller.formatives.isNotEmpty,
              //     onPress: () => controller.insertFormative(),
              //     isLoading: controller.insertingFormative.value,
              //     uploaded: controller.formativeInserted.value,
              //   ),
              // ),
            ],
          ),
        ),
        Obx(
          () => controller.isLocked.value
              ? Positioned.fill(
                  child: Container(
                    // height: double.infinity,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.lock_clock_outlined),
                  ),
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}
