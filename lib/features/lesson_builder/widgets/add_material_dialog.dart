import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_material_controller.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/summative_creation/widgets/summative_text_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class AddMaterialDialog extends StatelessWidget {
  AddMaterialDialog({
    super.key,
    required this.type,
    required this.title,
    required this.materialType,
    required this.lessonId
  });
  final formKey = GlobalKey<FormState>();
  final int materialType;
  final int type;
  final String title;
  final int lessonId;
  final controller = Get.put(LessonMaterialController());

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            title,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            'This will not appear in the list until you click save, Cancel will discard.',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          ),
                        ],
                      ),
                      IconButton(
                        onPressed: () => Navigator.of(context).pop(),
                        icon: Icon(Icons.cancel_outlined),
                      ),
                    ],
                  ),

                  SizedBox(height: 20),
                  Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Title'),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: controller.toolTitleController,
                              decoration: InputDecoration(hintText: ''),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Add link';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: 10),
                      Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(type == 2 ? 'Link URL' : 'Description'),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: type == 2
                                  ? controller.toolLinkController
                                  : controller.descriptionController,

                              decoration: InputDecoration(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Add link';
                                }
                                return null;
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  type == 2
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Optional description'),
                            SizedBox(height: 5),
                            TextFormField(
                              controller: controller.descriptionController,
                              minLines: 3,
                              maxLines: null,
                              //controller: linkController.descriptionController,
                              decoration: InputDecoration(),
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Add description';
                                }
                                return null;
                              },
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RichTextInput(
                              controller: controller.quillController,
                              label: 'Text and instructions',
                            ),
                          ],
                        ),

                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('Cancel'),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (materialType == 1) {
                            controller.addLessonMaterial(lessonId, type);
                          } else if (materialType == 2) {
                            controller.addKnowledge(lessonId, type);
                          } else if (materialType == 3) {
                            controller.addDifferential(lessonId, type);
                          } else if (materialType == 4) {
                            controller.addFormative(lessonId, type);
                          }

                          Navigator.of(context).pop();
                          Get.delete<LessonMaterialController>();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                        ),
                        child: Text(
                          'Save',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
