import 'package:get/get.dart';

class RubricController extends GetxController {
  // Step tracking
  var openStep = 1.obs;

  // Step 1
  final scopes = [
    "Social Science",
    "Math",
    "English",
    "Science",
    "Foreign Language",
    "Personal Development",
    "Career Technical Education",
    "Health and Fitness",
    "Technology",
    "Visual and Performing Arts",
  ];
  var rubricTitle = ''.obs;
  var mainScope = ''.obs;
  bool get step1Complete =>
      rubricTitle.trim().isNotEmpty && mainScope.isNotEmpty;

  // Step 2
  var additionalScopes = <String>[].obs;
  void toggleAdditionalScope(String s) {
    if (additionalScopes.contains(s)) {
      additionalScopes.remove(s);
    } else {
      additionalScopes.add(s);
    }
  }

  List<String> get alignedScopes => mainScope.isEmpty
      ? []
      : [
          mainScope.value,
          ...additionalScopes.where((s) => s != mainScope.value),
        ];

  bool get step2Complete => true;

  // Step 3
  var selectedCompetencies = <Map<String, dynamic>>[].obs;
  void toggleCompetency(String scope, Map<String, dynamic> comp) {
    final key = "$scope:${comp['id']}";
    final exists = selectedCompetencies.any(
      (x) => "${x['scope']}:${x['id']}" == key,
    );
    if (exists) {
      selectedCompetencies.removeWhere(
        (x) => "${x['scope']}:${x['id']}" == key,
      );
    } else {
      selectedCompetencies.add({
        "scope": scope,
        "id": comp['id'],
        "name": comp['name'],
      });
    }
  }

  bool get step3Complete => selectedCompetencies.isNotEmpty;

  // Step 4
  var selectedStandards = <Map<String, dynamic>>[].obs;
  void toggleStandard(String scope, Map<String, dynamic> std) {
    final key = "$scope:${std['id']}";
    final exists = selectedStandards.any(
      (x) => "${x['scope']}:${x['id']}" == key,
    );
    if (exists) {
      selectedStandards.removeWhere((x) => "${x['scope']}:${x['id']}" == key);
    } else {
      selectedStandards.add({
        "scope": scope,
        "id": std['id'],
        "label": std['label'],
        "desc": std['desc'],
      });
    }
  }

  bool get step4Complete => selectedStandards.isNotEmpty;

  // Step 5
  final levels = [
    "Emerging",
    "Capable",
    "Bridging",
    "Proficient",
    "Metacognition",
  ];
  var rubricText = {
    "Emerging": "",
    "Capable": "",
    "Bridging": "",
    "Proficient": "",
    "Metacognition": "",
  }.obs;

  bool get step5Ready =>
      levels.every((lvl) => rubricText[lvl]!.trim().isNotEmpty);

  final List<Map<String, dynamic>> rubricRows = [
    {
      "id": "r1",
      "title": "Scientific Inquiry and Analysis",
      "description": 'Descrition goes here ',
      "example": "scientific inquiry and data-driven evaluation",
      "scope": "Math",
    },
    {
      "id": "r2",
      "title": "Scientific Inquiry and Analysis",
      "description": 'Descrition goes here ',
      "example": "scientific inquiry and data-driven evaluation",
      "scope": "Math",
    },
  ];
}
