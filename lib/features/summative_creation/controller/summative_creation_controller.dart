import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SummativeCreationController extends GetxController {
  var openStep = 1.obs;

  // Step 1
  var selectedScope = RxnString();
  var step1Complete = false.obs;

  // Step 2
  var selectedRubricId = RxnString();
  var selectedRubric = Rxn<Map<String, dynamic>>({});
  var step2Complete = false.obs;

  // Step 3
  var title = "".obs;
  var deliverable = "".obs;
  var courseAssoc = "".obs;
  var scaffoldText = "".obs;
  var activeLevel = "".obs;

  final List<String> scopes = [
    "Mathematics",
    "Science",
    "Individuals & Societies",
    "Language & Literature",
    "Design",
    "Arts",
  ];

  final List<Map<String, dynamic>> rubricRows = [
    {
      "id": "r1",
      "title": "Scientific Inquiry and Analysis",
      "standards": ["Criterion A", "Criterion B"],
      "competency": {
        "code": "SC1",
        "desc": "Applies scientific methods to real-world problems.",
      },
      "summary": "scientific inquiry and data-driven evaluation",
    },
    {
      "id": "r2",
      "title": "Creative Design Thinking",
      "standards": ["Criterion C", "Criterion D"],
      "competency": {
        "code": "DS3",
        "desc": "Develops innovative design solutions.",
      },
      "summary": "design process and creative solutions",
    },
  ];

  // ---------------- Logic ----------------
  void handleScopeSelect(String s) {
    selectedScope.value = s;
    step1Complete.value = true;
    if (!step2Complete.value) openStep.value = 2;
  }

  void handleRubricSelect(String id) {
    selectedRubricId.value = id;
    step2Complete.value = true;
    selectedRubric.value = rubricRows.firstWhere(
      (r) => r["id"] == id,
      orElse: () => {},
    );
    openStep.value = 3;
  }

  void handleStepChange(int i) {
    openStep.value = i;
  }

  void handleLevelSelect(String lvl) {
    activeLevel.value = lvl;
  }

  bool get step3Ready =>
      title.value.isNotEmpty &&
      deliverable.value.isNotEmpty &&
      courseAssoc.value.isNotEmpty &&
      scaffoldText.value.isNotEmpty &&
      activeLevel.value.isNotEmpty;

  Map<String, Color> levelColors(String level) {
    switch (level) {
      case "Emerging":
        return {"bg": Colors.orange.shade100, "text": Colors.orange.shade800};
      case "Capable":
        return {"bg": Colors.yellow.shade100, "text": Colors.yellow.shade800};
      case "Bridging":
        return {"bg": Colors.blue.shade100, "text": Colors.blue.shade800};
      case "Proficient":
        return {"bg": Colors.green.shade100, "text": Colors.green.shade800};
      case "Metacognition":
        return {"bg": Colors.purple.shade100, "text": Colors.purple.shade800};
      default:
        return {"bg": Colors.grey.shade200, "text": Colors.grey.shade600};
    }
  }
}

Map<String, Color> levelColors(String level) {
    switch (level) {
      case "Emerging":
        return {"bg": Colors.orange.shade100, "text": Colors.orange.shade800};
      case "Capable":
        return {"bg": Colors.yellow.shade100, "text": Colors.yellow.shade800};
      case "Bridging":
        return {"bg": Colors.blue.shade100, "text": Colors.blue.shade800};
      case "Proficient":
        return {"bg": Colors.green.shade100, "text": Colors.green.shade800};
      case "Metacognition":
        return {"bg": Colors.purple.shade100, "text": Colors.purple.shade800};
      default:
        return {"bg": Colors.grey.shade200, "text": Colors.grey.shade600};
    }
  }
