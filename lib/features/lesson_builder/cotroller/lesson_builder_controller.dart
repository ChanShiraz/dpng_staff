import 'package:dpng_staff/features/district_summative_library/widgets/summative_card.dart';
import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_builder_repo.dart';
import 'package:dpng_staff/features/lesson_builder/models/ecbi.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_material.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_model.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_objective.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_tool_model.dart';
import 'package:dpng_staff/features/lesson_builder/models/tool.dart';
import 'package:dpng_staff/features/summative_assignment/models/lesson.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LessonBuilderController extends GetxController {
  final repo = LessonBuilderRepo();
  //lesson information

  final titleController = TextEditingController();
  final summativeLinkController = TextEditingController();
  final descriptionController = TextEditingController();
  final objectiveController = TextEditingController();
  int selectedNumber = 1;
  //Rx<int> lessonId = 1.obs;
  Rxn<int> lessonId = Rxn();
  RxBool isLocked = true.obs;

  RxBool insertingLesson = false.obs;
  RxBool lessonInserted = false.obs;
  void insertLesson(LessonModel lesson) async {
    insertingLesson.value = true;
    try {
      lessonId.value = await repo.insertLesson(lesson);
      int objectiveId = await repo.insertLessonObjective(
        LessonObjective(
          modnum: 1,
          dmod_lesson_id: lessonId.value!,
          objective: objectiveController.text,
        ),
      );

      debugPrint('Lesson id $lessonId');
      debugPrint('objective id $objectiveId');
      lessonInserted.value = true;
      insertingLesson.value = false;
      isLocked.value = false;
    } catch (e) {
      debugPrint('error inserting lesson $e');
    }
    insertingLesson.value = false;
  }

  //lesson content presentation
  RxList<Tool> tools = <Tool>[].obs;
  RxBool fetchingTools = false.obs;

  fetchTools() async {
    fetchingTools.value = true;
    try {
      tools.value = await repo.fetchTools();
    } catch (e) {
      debugPrint('error fetchig tools $e');
    }
    fetchingTools.value = false;
  }

  //lesson tools
  RxList<LessonToolModel> lessonTools = <LessonToolModel>[].obs;
  void removeTool(LessonToolModel tool) {
    lessonTools.remove(tool);
  }

  RxBool insertingTools = false.obs;
  RxBool lessonToolsInserted = false.obs;

  Future<void> insertLessonTool() async {
    insertingTools.value = true;
    lessonToolsInserted.value = false;
    try {
      for (var element in lessonTools) {
        await repo.insertLessonTool(element);
      }
      lessonToolsInserted.value = true;
    } catch (e) {
      debugPrint('Error inserting lesson tool: $e');
    }
    insertingTools.value = false;
  }

  //lesson material
  RxList<LessonMaterial> lessonMaterials = <LessonMaterial>[].obs;
  void removeLessonMaterial(LessonMaterial material) {
    lessonMaterials.remove(material);
  }

  RxBool insertingLessonMaterial = false.obs;
  RxBool lessonMaterialInserted = false.obs;

  Future<void> insertLessonMaterial() async {
    insertingLessonMaterial.value = true;
    lessonMaterialInserted.value = false;
    try {
      for (var element in lessonMaterials) {
        await repo.insertLessonMaterial(element);
      }
      lessonMaterialInserted.value = true;
    } catch (e) {
      debugPrint('Error inserting lesson tool: $e');
    }
    insertingLessonMaterial.value = false;
  }

  //prior knowledge
  RxList<LessonMaterial> knowledges = <LessonMaterial>[].obs;
  void removePriorKnowledge(LessonMaterial knowledge) {
    knowledges.remove(knowledge);
  }

  RxBool insertingKnowledge = false.obs;
  RxBool knowledgeInserted = false.obs;
  Future<void> insertKnowledge() async {
    insertingKnowledge.value = true;
    knowledgeInserted.value = false;
    try {
      for (var element in knowledges) {
        await repo.insertKnowledge(element);
      }
      knowledgeInserted.value = true;
    } catch (e) {
      debugPrint('Error inserting lesson tool: $e');
    }
    insertingKnowledge.value = false;
  }

  //differentials
  RxList<LessonMaterial> differentials = <LessonMaterial>[].obs;
  void removeDifferentials(LessonMaterial differential) {
    differentials.remove(differential);
  }

  RxBool insertingDifferential = false.obs;
  RxBool differentialInserted = false.obs;
  Future<void> insertDifferential() async {
    insertingDifferential.value = true;
    differentialInserted.value = false;
    try {
      for (var element in differentials) {
        await repo.insertDifferential(element);
      }
      differentialInserted.value = true;
    } catch (e) {
      debugPrint('Error inserting lesson tool: $e');
    }
    insertingDifferential.value = false;
  }

  //differentials
  RxList<LessonMaterial> formatives = <LessonMaterial>[].obs;
  void removeFormative(LessonMaterial formative) {
    formatives.remove(formative);
  }

  RxBool insertingFormative = false.obs;
  RxBool formativeInserted = false.obs;
  Future<void> insertFormative() async {
    insertingFormative.value = true;
    formativeInserted.value = false;
    try {
      for (var element in formatives) {
        await repo.insertFormative(element);
      }
      formativeInserted.value = true;
    } catch (e) {
      debugPrint('Error inserting formative: $e');
    }
    insertingFormative.value = false;
  }

  //ecbi
  RxList<Ecbi> ecbis = <Ecbi>[].obs;
  RxBool fetchingEcbi = false.obs;

  /// Selected ECBI IDs
  RxList<int> selectedEcbiIds = <int>[].obs;

  /// Temporary selection for dialog
  RxList<int> tempSelectedEcbiIds = <int>[].obs;
  RxBool showButton = true.obs;

  void fetchEcbi() async {
    fetchingEcbi.value = true;
    try {
      final response = await repo.fetchEcbi();
      ecbis.assignAll(response);
    } catch (e) {
      debugPrint('Error fetching ecbi $e');
    }
    fetchingEcbi.value = false;
  }

  /// Call before opening dialog
  void prepareTempSelection() {
    tempSelectedEcbiIds.assignAll(selectedEcbiIds);
  }

  void toggleEcbi(int id) {
    tempSelectedEcbiIds.contains(id)
        ? tempSelectedEcbiIds.remove(id)
        : tempSelectedEcbiIds.add(id);
  }

  void saveSelection() {
    selectedEcbiIds.assignAll(tempSelectedEcbiIds);
  }

  void clearTempSelection() {
    tempSelectedEcbiIds.clear();
  }

  RxBool insertingEcbi = false.obs;
  RxBool ecbiInserted = false.obs;

  Future<void> insertLessonEcbi() async {
    insertingEcbi.value = true;
    ecbiInserted.value = false;
    for (var ecbiId in selectedEcbiIds) {
      final ecbiInsert = EcbiInsertModel(
        modnum: 0,
        ecbi_id: ecbiId,
        heading: ecbis
            .firstWhere((element) => element.ecbi_id == ecbiId)
            .heading,
        description: ecbis
            .firstWhere((element) => element.ecbi_id == ecbiId)
            .description,
        dmod_lesson_id: lessonId.value!,
      );
      try {
        await repo.insertLessonEcbi(ecbiInsert);
      } catch (e) {
        debugPrint('Error inserting lesson ecbi: $e');
      }
    }
    insertingEcbi.value = false;
  }

  final errorMessage = ''.obs;
  RxBool savingLesson = false.obs;
  void saveLesson() async {
    if (!validateLessonData()) {
      return;
    }
    savingLesson.value = true;
    errorMessage.value = '';
    try {
      if (validateLessonData()) {
        await insertLessonTool();
        await insertLessonMaterial();
        await insertKnowledge();
        await insertDifferential();
        await insertFormative();
      }
      Get.back();
      showDesktopToast2('Lesson Saved Successfully');
    } catch (e) {
      errorMessage.value = 'Some error occured, Please try again!';
      debugPrint('error saving lesson $e');
    }
    savingLesson.value = false;
  }

  bool validateLessonData() {
    if (lessonTools.isEmpty) {
      errorMessage.value = 'At least one Lesson Tool is required';
      return false;
    }
    if (lessonMaterials.isEmpty) {
      errorMessage.value = 'At least one Lesson Material is required';
      return false;
    }
    if (knowledges.isEmpty) {
      errorMessage.value = 'At least one Prior Knowledge item is required';
      return false;
    }
    if (differentials.isEmpty) {
      errorMessage.value = 'At least one Differential item is required';
      return false;
    }
    if (formatives.isEmpty) {
      errorMessage.value = 'At least one Formative is required';
      return false;
    }

    errorMessage.value = '';
    return true;
  }
}
