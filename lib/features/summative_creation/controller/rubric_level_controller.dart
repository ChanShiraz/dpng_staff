import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class RubricLevelController extends GetxController {
  final titleController = TextEditingController();
  final taskController = TextEditingController();
  final courseAssociationController = TextEditingController();

  final emergingTextController = TextEditingController();
  final capableTextController = TextEditingController();
  final bridgingTextController = TextEditingController();
  final proficientTextController = TextEditingController();
  final metacognitionTextController = TextEditingController();

  var activeLevel = "Proficient".obs;
  void handleLevelSelect(String lvl) {
    activeLevel.value = lvl;
  }

  TextEditingController getTextController() {
    switch (activeLevel.value) {
      case 'Emerging':
        return emergingTextController;
      case 'Capable':
        return capableTextController;
      case 'Bridging':
        return bridgingTextController;
      case 'Proficient':
        return proficientTextController;
      case 'Metacognition':
        return metacognitionTextController;
    }
    return proficientTextController;
  }

  RxBool rubricReady = false.obs;
  RxBool rubricLevelsReady = false.obs;
  @override
  void onInit() {
    super.onInit();
    titleController.addListener(_validate);
    taskController.addListener(_validate);
    courseAssociationController.addListener(_validate);
    emergingTextController.addListener(_validate);
    capableTextController.addListener(_validate);
    bridgingTextController.addListener(_validate);
    proficientTextController.addListener(_validate);
    metacognitionTextController.addListener(_validate);
  }

  void _validate() {
    rubricReady.value =
        titleController.text.isNotEmpty &&
        taskController.text.isNotEmpty &&
        courseAssociationController.text.isNotEmpty &&
        emergingTextController.text.isNotEmpty &&
        capableTextController.text.isNotEmpty &&
        bridgingTextController.text.isNotEmpty &&
        proficientTextController.text.isNotEmpty &&
        metacognitionTextController.text.isNotEmpty;

    rubricLevelsReady.value =
        emergingTextController.text.isNotEmpty &&
        capableTextController.text.isNotEmpty &&
        bridgingTextController.text.isNotEmpty &&
        proficientTextController.text.isNotEmpty &&
        metacognitionTextController.text.isNotEmpty;
  }

  @override
  void onClose() {
    titleController.dispose();
    taskController.dispose();
    courseAssociationController.dispose();
    emergingTextController.dispose();
    capableTextController.dispose();
    bridgingTextController.dispose();
    proficientTextController.dispose();
    metacognitionTextController.dispose();
    super.onClose();
  }
}
