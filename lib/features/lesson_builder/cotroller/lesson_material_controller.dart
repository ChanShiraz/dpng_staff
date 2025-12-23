import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_builder_controller.dart';
import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_builder_repo.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_material.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_tool_model.dart';
import 'package:dpng_staff/features/lesson_builder/models/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class LessonMaterialController extends GetxController {
  final QuillController quillController = QuillController.basic();
  final lessonBuilderController = Get.find<LessonBuilderController>();

  final toolTitleController = TextEditingController();
  final toolLinkController = TextEditingController();
  final descriptionController = TextEditingController();
  //lesson material
  void addLessonMaterial(int lessonId, int type) {
    final material = LessonMaterial(
      dmod_lesson_id: lessonId,
      title: toolTitleController.text,
      description: descriptionController.text,
      type: type,
      link: toolLinkController.text,
      path: type == 3 ? quillController.pastePlainText : null,
      modnum: 0,
    );
    lessonBuilderController.lessonMaterials.add(material);
    print('mmethod called');
  }

  removeLessonMaterial(LessonMaterial lessonMaterial) {
    lessonBuilderController.lessonMaterials.remove(lessonMaterial);
  }

  //prior knowledge
  void addKnowledge(int lessonId, int type) {
    final knowledge = LessonMaterial(
      dmod_lesson_id: lessonId,
      title: toolTitleController.text,
      description: descriptionController.text,
      type: type,
      link: toolLinkController.text,
      path: type == 3 ? quillController.pastePlainText : null,
      modnum: 0,
    );
    lessonBuilderController.knowledges.add(knowledge);
  }

  removeKnowledge(LessonMaterial knowledge) {
    lessonBuilderController.knowledges.remove(knowledge);
  }

  //differential
  void addDifferential(int lessonId, int type) {
    final differential = LessonMaterial(
      dmod_lesson_id: lessonId,
      title: toolTitleController.text,
      description: descriptionController.text,
      type: type,
      link: toolLinkController.text,
      path: type == 3 ? quillController.pastePlainText : null,
      modnum: 0,
    );
    lessonBuilderController.differentials.add(differential);
  }

  removeDifferentials(LessonMaterial differential) {
    lessonBuilderController.differentials.remove(differential);
  }

  //formative
  void addFormative(int lessonId, int type) {
    final formative = LessonMaterial(
      dmod_lesson_id: lessonId,
      title: toolTitleController.text,
      description: descriptionController.text,
      type: type,
      link: toolLinkController.text,
      path: type == 3 ? quillController.pastePlainText : null,
      modnum: 0,
    );
    lessonBuilderController.formatives.add(formative);
  }

  removeFormative(LessonMaterial formative) {
    lessonBuilderController.formatives.remove(formative);
  }
}
