import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_builder_controller.dart';
import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_material_controller.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/add_material_dialog.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/content_presentation_section.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/upload_button.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MaterialsSection extends StatelessWidget {
  MaterialsSection({super.key});
  final controller = Get.find<LessonBuilderController>();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RoundContainer(
          width: double.infinity,
          padding: 20,
          color: Colors.blue.shade50.withOpacity(0.5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Materials',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              ToolsRow(
                title: 'Lesson materials',
                addLinkTap: () => showDialog(
                  context: context,
                  builder: (context) => AddMaterialDialog(
                    lessonId: controller.lessonId.value!,
                    materialType: 1,
                    type: 2,
                    title: 'Add lesson material (link)',
                  ),
                ),
                addTextTap: () => showDialog(
                  context: context,
                  builder: (context) => AddMaterialDialog(
                    lessonId: controller.lessonId.value!,
                    materialType: 1,
                    type: 3,
                    title: 'Add lesson material (text)',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.lessonMaterials.length,
                  itemBuilder: (context, index) {
                    final material = controller.lessonMaterials[index];
                    return PresentationItem(
                      path: material.path,
                      type: material.type,
                      title: material.title,
                      optionlNote: material.description,
                      link: material.link,
                      onDeleteTap: () {
                        controller.removeLessonMaterial(material);
                      },
                      onEditTap: () {},
                    );
                  },
                ),
              ),

              Obx(
                () => UploadButton(
                  show: controller.lessonMaterials.isNotEmpty,
                  onPress: () => controller.insertLessonMaterial(),
                  isLoading: controller.insertingLessonMaterial.value,
                  uploaded: controller.lessonMaterialInserted.value,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Divider(),
              ),
              ToolsRow(
                title: 'Prior knowledge materials',
                addTextTap: () => showDialog(
                  context: context,
                  builder: (context) => AddMaterialDialog(
                    lessonId: controller.lessonId.value!,
                    materialType: 2,
                    type: 3,
                    title: 'Add Prior knowledge material (text)',
                  ),
                ),
                addLinkTap: () => showDialog(
                  context: context,
                  builder: (context) => AddMaterialDialog(
                    lessonId: controller.lessonId.value!,
                    materialType: 2,
                    type: 2,
                    title: 'Add Prior knowledge material (link)',
                  ),
                ),
              ),

              SizedBox(height: 10),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.knowledges.length,
                  itemBuilder: (context, index) {
                    final knowledge = controller.knowledges[index];
                    return PresentationItem(
                      path: knowledge.path,
                      type: knowledge.type,
                      title: knowledge.title,
                      optionlNote: knowledge.description,
                      link: knowledge.link,
                      onDeleteTap: () {
                        controller.removePriorKnowledge(knowledge);
                      },
                      onEditTap: () {},
                    );
                  },
                ),
              ),
              Obx(
                () => UploadButton(
                  show: controller.knowledges.isNotEmpty,
                  onPress: () => controller.insertKnowledge(),
                  isLoading: controller.insertingKnowledge.value,
                  uploaded: controller.knowledgeInserted.value,
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Divider(),
              ),
              ToolsRow(
                title: 'Differentiation materials',
                addTextTap: () => showDialog(
                  context: context,
                  builder: (context) => AddMaterialDialog(
                    lessonId: controller.lessonId.value!,
                    materialType: 3,
                    type: 3,
                    title: 'Add Differentiation material (text)',
                  ),
                ),
                addLinkTap: () => showDialog(
                  context: context,
                  builder: (context) => AddMaterialDialog(
                    lessonId: controller.lessonId.value!,
                    materialType: 3,
                    type: 2,
                    title: 'Add Differentiation material (link)',
                  ),
                ),
              ),
              SizedBox(height: 10),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.differentials.length,
                  itemBuilder: (context, index) {
                    final differential = controller.differentials[index];
                    return PresentationItem(
                      path: differential.path,
                      type: differential.type,
                      title: differential.title,
                      optionlNote: differential.description,
                      link: differential.link,
                      onDeleteTap: () {
                        controller.removeDifferentials(differential);
                      },
                      onEditTap: () {},
                    );
                  },
                ),
              ),
              Obx(
                () => UploadButton(
                  show: controller.differentials.isNotEmpty,
                  onPress: () => controller.insertDifferential(),
                  isLoading: controller.insertingDifferential.value,
                  uploaded: controller.differentialInserted.value,
                ),
              ),
            ],
          ),
        ),
        Obx(
          () => controller.isLocked.value
              ? Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
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
