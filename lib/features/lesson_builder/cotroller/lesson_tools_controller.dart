import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_builder_controller.dart';
import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_builder_repo.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_tool_model.dart';
import 'package:dpng_staff/features/lesson_builder/models/tool.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class LessonToolsController extends GetxController {
  final QuillController quillController = QuillController.basic();
  final lessonBuilderController = Get.find<LessonBuilderController>();
  Rxn<Tool> selectedTool = Rxn();
  addTool(LessonToolModel tool) {
    lessonBuilderController.lessonTools.add(tool);
  }

  removeTool(LessonToolModel tool) {
    lessonBuilderController.lessonTools.remove(tool);
  }

  //link dialog
  final toolTitleController = TextEditingController();
  final toolLinkController = TextEditingController();
  final noteController = TextEditingController();

  void addLessonTool(int lessonId, int type) {
    final tool = LessonToolModel(
      dmodLessonId: lessonId,
      altToolId: selectedTool.value!.alt_tool_id,
      title: toolTitleController.text,
      description: noteController.text,
      type: type,
      link: toolLinkController.text,
      path: type == 3 ? quillController.pastePlainText : null,
      modnum: 0,
    );
    lessonBuilderController.lessonTools.add(tool);
  }
}
