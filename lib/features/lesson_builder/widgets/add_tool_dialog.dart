import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_builder_controller.dart';
import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_tools_controller.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_tool_model.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/summative_creation/widgets/summative_text_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';

class AddToolDialogLink extends StatelessWidget {
  AddToolDialogLink({super.key, required this.type, required this.lessonId});
  final formKey = GlobalKey<FormState>();
  final int type;
  final controller = Get.put(LessonToolsController());
  final lessonBuilderController = Get.find<LessonBuilderController>();
  final int lessonId;

  @override
  Widget build(BuildContext context) {
    String typeText = type == 2 ? '(Link)' : '(Text)';
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
                            'Add Tools or media $typeText',
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
                  Text('Tool type'),
                  SizedBox(width: 10),
                  Obx(
                    () => lessonBuilderController.fetchingTools.value
                        ? SizedBox()
                        : DropdownButtonFormField(
                            hint: Text('Select tool type'),
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                            isExpanded: true,
                            items: lessonBuilderController.tools
                                .map(
                                  (element) => DropdownMenuItem(
                                    value: element,
                                    child: Text(
                                      element.description,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              controller.selectedTool.value = value!;
                            },
                            validator: (value) {
                              if (value == null) {
                                return 'Select tool type';
                              }
                              return null;
                            },
                          ),
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
                                  : controller.noteController,
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
                            Text('Optional teacher note'),
                            SizedBox(height: 5),
                            TextFormField(
                              minLines: 3,
                              maxLines: null,
                              controller: controller.noteController,
                              decoration: InputDecoration(),
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
                          if (formKey.currentState!.validate()) {
                            controller.addLessonTool(lessonId, type);
                            Get.back();
                            Get.delete<LessonToolsController>();
                          }
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
