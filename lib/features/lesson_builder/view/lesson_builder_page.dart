import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/district_summative_library/models/summative_model.dart';
import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_builder_controller.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_model.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/content_presentation_section.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/formative_assessment_section.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/lesson_information_section.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/materiels_section.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/stadards_section.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';

class LessonBuilderPage extends StatefulWidget {
  const LessonBuilderPage({super.key, required this.summative});
  final SummativeModel summative;

  @override
  State<LessonBuilderPage> createState() => _LessonBuilderPageState();
}

class _LessonBuilderPageState extends State<LessonBuilderPage> {
  late LessonBuilderController controller;
  final informationFormKey = GlobalKey<FormState>();
  @override
  void initState() {
    controller = Get.put(LessonBuilderController());
    controller.summativeLinkController.text = widget.summative.title;
    controller.fetchTools();
    controller.fetchEcbi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TopBar(
              type: 2,
              title: 'Design a Lesson',
              subtitle:
                  'Build your lesson resources and preview how they appear in the student learning journey.',
              trailing: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xfff8fafc),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.visibility, color: Colors.black),
                        SizedBox(width: 5),
                        Text(
                          'Student View',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 10),
                  Obx(
                    () => ElevatedButton(
                      onPressed: controller.lessonInserted.value
                          ? null
                          : () {
                              if (informationFormKey.currentState!.validate()) {
                                final lesson = LessonModel(
                                  modnum: 1,
                                  dmod_sum_id: widget.summative.dmod_sum_id,
                                  altid: 1,
                                  a_cid: widget.summative.aCid,
                                  number: controller.selectedNumber,
                                  title: controller.titleController.text,
                                  description:
                                      controller.descriptionController.text,
                                  active: 1,
                                  summative_status: 1,
                                );
                                controller.insertLesson(lesson);
                              }
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.black,
                      ),
                      child: controller.insertingLesson.value
                          ? Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 30,
                              ),
                              child: SizedBox(
                                height: 20,
                                width: 20,
                                child: CircularProgressIndicator(
                                  color: Colors.white,
                                  strokeWidth: 3,
                                ),
                              ),
                            )
                          : controller.lessonInserted.value
                          ? Row(
                              children: [
                                Icon(Icons.check, color: Colors.white),
                                SizedBox(width: 5),
                                Text('Saved'),
                              ],
                            )
                          : Text('Save lesson'),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      LessonInformationSection(formKey: informationFormKey),
                      SizedBox(height: 20),
                      StadardsSection(
                        standards: widget.summative.standards,
                        competencies: widget.summative.competencies,
                      ),
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 1,
                            child: ContentPresentationSection(),
                          ),
                          SizedBox(width: 20),
                          Expanded(flex: 1, child: MaterialsSection()),
                        ],
                      ),
                      SizedBox(height: 20),
                      FormativeAssessmentSection(),
                      SizedBox(height: 20),
                      Obx(() {
                        if (controller.errorMessage.isEmpty) return SizedBox();
                        return RoundContainer(
                          child: Row(
                            children: [
                              Icon(Icons.error_outline, color: Colors.red),
                              SizedBox(width: 10),
                              Text(
                                controller.errorMessage.value,
                                style: TextStyle(fontSize: 13),
                              ),
                            ],
                          ),
                        );
                      }),
                      SizedBox(height: 10),
                      Align(
                        alignment: Alignment.topRight,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {
                            controller.saveLesson();
                          },
                          child: Obx(
                            () => controller.savingLesson.value
                                ? Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 98,
                                    ),
                                    child: SizedBox(
                                      height: 20,
                                      width: 20,
                                      child: CircularProgressIndicator(
                                        strokeWidth: 3,
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                                : Text('Save Lesson Material and Finish'),
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
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
