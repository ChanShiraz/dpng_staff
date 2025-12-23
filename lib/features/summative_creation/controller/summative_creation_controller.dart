import 'package:dpng_staff/features/auth/controller/user_controller.dart';
import 'package:dpng_staff/features/rubric_creation/models/competency.dart';
import 'package:dpng_staff/features/rubric_creation/models/course_category.dart';
import 'package:dpng_staff/features/summative_creation/controller/rubric_level_controller.dart';
import 'package:dpng_staff/features/summative_creation/models/resource_row_data.dart';
import 'package:dpng_staff/features/summative_creation/models/rubric.dart';
import 'package:dpng_staff/features/summative_creation/models/summative_inst_model.dart';
import 'package:dpng_staff/features/summative_creation/repository/summative_creation_repo.dart';
import 'package:dpng_staff/features/summative_creation/widgets/resource_section.dart';
import 'package:dpng_staff/features/summative_creation/widgets/rubric_level_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SummativeCreationController extends GetxController {
  final supabase = Supabase.instance.client;
  final userId = Get.find<UserController>().currentUser.value!.userId!;
  final rubricLevelController = Get.put<RubricLevelController>(
    RubricLevelController(),
  );
  var openStep = 1.obs;

  // Step 1
  //var selectedScope = RxnString();
  var step1Complete = false.obs;

  void handleScopeSelect(CourseCategory category) {
    selectedCategory.value = category;
    step1Complete.value = true;
    if (!step2Complete.value) openStep.value = 2;
    fetchRubrics(category.ccid);
  }

  RxBool fetchingCategories = false.obs;
  RxList<CourseCategory> categories = <CourseCategory>[].obs;
  final step1ExController = ExpansibleController();
  var rubricTitle = ''.obs;
  final Rx<CourseCategory?> selectedCategory = Rx<CourseCategory?>(null);
  final repo = SummativeCreationRepo();

  void fetchCategories() async {
    fetchingCategories.value = true;
    categories.clear();
    try {
      categories.value = await repo.fetchCategories();
    } catch (e) {
      debugPrint('Error fetching course category $e');
    }
    fetchingCategories.value = false;
  }

  // Step 2
  //var selectedRubricId = RxnString();
  var selectedRubric = Rxn<SummativeRubric>();
  RxList<SummativeRubric> rubrics = <SummativeRubric>[].obs;
  RxBool fetchingRubrics = false.obs;
  var step2Complete = false.obs;

  void fetchRubrics(int ccid) async {
    fetchingRubrics.value = true;
    try {
      rubrics.value = await repo.fetchRubrics(ccid: ccid, userId: userId);
    } catch (e) {
      debugPrint('error fetching rubrics $e');
    }
    fetchingRubrics.value = false;
  }

  // Step 3
  RxList<ResourceRowData> resourcecsAvailable = <ResourceRowData>[].obs;
  void addResource(ResourceRowData rowData) {
    resourcecsAvailable.add(rowData);
  }

  void removeResource(ResourceRowData rowData) {
    resourcecsAvailable.remove(rowData);
  }

  void updateResource(ResourceRowData updatedRow) {
    final index = resourcecsAvailable.indexWhere(
      (row) => row.id == updatedRow.id,
    );
    if (index != -1) {
      resourcecsAvailable[index] = updatedRow;
    }
    resourcecsAvailable.refresh();
  }

  void handleRubricSelect(SummativeRubric rubric) {
    selectedRubric.value = rubric;
    step2Complete.value = true;

    openStep.value = 3;
  }

  void handleStepChange(int i) {
    openStep.value = i;
  }

  // void handleLevelSelect(String lvl) {
  //   activeLevel.value = lvl;
  // }

  RxBool get step3Complete {
    return (rubricLevelController.rubricReady.value &&
            resourcecsAvailable.isNotEmpty)
        .obs;
  }

  RxBool insertingSummative = false.obs;
  Future<void> insertSummative() async {
    insertingSummative.value = true;
    try {
      SummativeInstModel instModel = SummativeInstModel(
        modnum: 0,
        altid: 0,
        aCid: 0,
        title: rubricLevelController.titleController.text,
        task: rubricLevelController.taskController.text,
        emergingRubric: rubricLevelController.emergingTextController.text,
        capableRubric: rubricLevelController.capableTextController.text,
        bridgingRubric: rubricLevelController.bridgingTextController.text,
        proficientRubric: rubricLevelController.proficientTextController.text,
        advancedRubric: rubricLevelController.metacognitionTextController.text,
        drlid: selectedRubric.value!.drlid,
        ccid: selectedCategory.value!.ccid,
        course: selectedCategory.value!.title,
        userId: userId,
        archived: 0,
        active: 1,
      );
      final dumsumId = await repo.insertSummative(instModel);
      await repo.insertResources(resourcecsAvailable, dumsumId);
      Get.back();
      print('summative inserted with id $dumsumId');
    } catch (e) {
      print('error inserting summative $e');
    }
    insertingSummative.value = false;
  }
}
