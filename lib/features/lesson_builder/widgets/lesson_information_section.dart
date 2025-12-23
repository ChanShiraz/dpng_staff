import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_builder_controller.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class LessonInformationSection extends StatelessWidget {
  LessonInformationSection({super.key, required this.formKey});
  final controller = Get.find<LessonBuilderController>();
  final formKey;

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      padding: 20,
      color: Colors.white,
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'Lesson information',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
            Divider(),
            SizedBox(height: 10),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lesson title',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Lesson 3'),
                        controller: controller.titleController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please add title';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Summative link',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(hintText: 'Economic Terms'),
                        controller: controller.summativeLinkController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please add summative link';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 5),
                      Text(
                        'This lesson will appear in the learning journey for the selected summative assessment.',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lesson description',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        minLines: 3,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText: 'Lesson description',
                        ),
                        controller: controller.descriptionController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please add lesson description';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 15),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Objective(s)',
                        style: TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        minLines: 3,
                        maxLines: null,
                        decoration: InputDecoration(
                          hintText:
                              'Understand fundamental economic principles and how they influence political systems and historical events.',
                        ),
                        controller: controller.objectiveController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please add summative objective(s)';
                          }
                          return null;
                        },
                      ),
                      SizedBox(height: 5),
                      Text(
                        'These are teacher-facing and will not be visible in the student journey.',
                        style: TextStyle(fontSize: 11, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Lesson order', style: TextStyle(fontWeight: FontWeight.w500)),
            SizedBox(height: 10),
            SizedBox(
              width: 100,
              child: DropdownButtonFormField<int>(
                value: controller.selectedNumber,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                items: const [
                  DropdownMenuItem(value: 1, child: Text('1')),
                  DropdownMenuItem(value: 2, child: Text('2')),
                  DropdownMenuItem(value: 3, child: Text('3')),
                  DropdownMenuItem(value: 4, child: Text('4')),
                  DropdownMenuItem(value: 5, child: Text('5')),
                ],
                onChanged: (value) {
                  controller.selectedNumber = value!;
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
