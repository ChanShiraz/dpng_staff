import 'package:dpng_staff/features/grades/models/standard.dart';
import 'package:dpng_staff/features/rubric_creation/models/competency.dart';
import 'package:dpng_staff/features/rubric_creation/models/course_category.dart';
import 'package:dpng_staff/features/rubric_creation/models/levels_data.dart';
import 'package:dpng_staff/features/rubric_creation/models/non_science_standard.dart';
import 'package:dpng_staff/features/rubric_creation/models/science_standard.dart';
import 'package:dpng_staff/features/rubric_creation/models/state_standards.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class RubricController extends GetxController {
  final supabase = Supabase.instance.client;
  // Step tracking
  var openStep = 1.obs;

  // Step 1
  RxBool loadingCategories = false.obs;
  RxList<CourseCategory> categories = <CourseCategory>[].obs;
  final step1ExController = ExpansibleController();
  var rubricTitle = ''.obs;
  final Rx<CourseCategory?> selectedCategory = Rx<CourseCategory?>(null);
  RxBool get step1Complete =>
      ((rubricTitle.trim().isNotEmpty) && selectedCategory.value != null).obs;
  void fetchCategories() async {
    loadingCategories.value = true;
    categories.clear();
    try {
      final query = supabase
          .from('course_content_category')
          .select('ccid,cc_category')
          .eq('active', true);
      final response = await query;
      for (var element in response) {
        categories.add(CourseCategory.fromMap(element));
      }
    } catch (e) {
      print('Error fetching course category $e');
    }
    loadingCategories.value = false;
  }

  // Step 2
  final step2ExController = ExpansibleController();
  RxList<CourseCategory> additionalSelectedScopes = <CourseCategory>[].obs;
  void toggleAdditionalScope(CourseCategory category) {
    if (additionalSelectedScopes.contains(category)) {
      additionalSelectedScopes.remove(category);
    } else {
      additionalSelectedScopes.add(category);
    }
  }

  RxBool step2Complete = false.obs;

  // Step 3
  final step3ExController = ExpansibleController();
  RxBool fetchingComptecies = false.obs;
  RxList<Competency> comptencies = <Competency>[].obs;

  void fetchCompetencies(List ccid) async {
    selectedCompetencies.clear();
    selectedAlignedCompetency.value = null;
    selectedAlignedNonScienceStandards.value = null;
    selectedAlignedScienceStandards.value = null;

    fetchingComptecies.value = true;
    comptencies.clear();
    try {
      final query = supabase
          .from('dp_competencies')
          .select('dpcid,dpc_label,dpc_heading,dpc_description,ccid')
          .eq('active', true)
          .inFilter('ccid', ccid);
      final response = await query;
      for (var element in response) {
        final matchedCategory = categories.firstWhereOrNull(
          (cat) => cat.ccid == element['ccid'],
        );
        comptencies.add(Competency.fromMap(element, matchedCategory!.title));
      }
    } catch (e) {
      print('Error loading competencies $e');
    }
    fetchingComptecies.value = false;
  }

  RxList<Competency> selectedCompetencies = <Competency>[].obs;
  void toggleCompetency(Competency competency) {
    if (selectedCompetencies.contains(competency)) {
      selectedCompetencies.remove(competency);
      if (selectedCompetencies.isEmpty) {
        selectedAlignedCompetency.value = null;
      }
    } else {
      selectedCompetencies.add(competency);
      if (selectedAlignedCompetency.value == null) {
        //selectedAlignedCompetency.value = competency;
        selectAlignedCompetency(competency);
      }
    }
  }

  RxBool get step3Complete {
    if (additionalSelectedScopes.isEmpty && selectedCompetencies.isNotEmpty) {
      return true.obs;
    }
    if (additionalSelectedScopes.isNotEmpty &&
        selectedCompetencies.isNotEmpty) {
      final additionalCompetencySelected = selectedCompetencies
          .firstWhereOrNull(
            (comp) => additionalSelectedScopes.any(
              (scope) => comp.scope == scope.title,
            ),
          );
      if (additionalCompetencySelected == null) {
        return false.obs;
      }
      return true.obs;
    }

    return false.obs;
  }

  // Step 4
  final step4ExController = ExpansibleController();
  // Non science standards
  RxList<NonScienceStandard> nonScienceStandards = <NonScienceStandard>[].obs;
  RxList<NonScienceStandard> selectedNonScienceStandards =
      <NonScienceStandard>[].obs;
  RxBool fetchingStandards = false.obs;
  void fetchNonScienceStandards(int ccid) async {
    selectedScienceStandards.clear();
    selectedNonScienceStandards.clear();
    nonScienceStandards.clear();
    fetchingStandards.value = true;
    try {
      final query = supabase
          .from('parent_state_standards')
          .select('p_standid,standard_label,standard_description')
          .eq('ccid', ccid)
          .eq('active', 1);
      final response = await query;
      for (var element in response) {
        final scope = categories.firstWhereOrNull((cat) => cat.ccid == ccid);
        nonScienceStandards.add(
          NonScienceStandard.fromMap(element, scope!.title),
        );
      }
    } catch (e) {
      print('Error loading standards $e');
    }
    fetchingStandards.value = false;
  }

  void toggleNonScienceStandard(NonScienceStandard standard) {
    if (selectedNonScienceStandards.contains(standard)) {
      selectedNonScienceStandards.remove(standard);
      if (selectedNonScienceStandards.isEmpty) {
        selectedAlignedNonScienceStandards.value = null;
      }
    } else {
      selectedNonScienceStandards.add(standard);
      if (selectedAlignedNonScienceStandards.value == null) {
        selectedAlignedNonScienceStandards.value = standard;
      }
    }
  }

  // science standards
  RxList<ScienceStandard> scienceStandards = <ScienceStandard>[].obs;
  RxList<ScienceStandard> scienceStandardsByDomain = <ScienceStandard>[].obs;
  RxList<ScienceStandard> selectedScienceStandards = <ScienceStandard>[].obs;
  //RxBool fetchingStandards = false.obs;
  void fetchScienceStandards() async {
    selectedNonScienceStandards.clear();
    selectedScienceStandards.clear();
    nonScienceStandards.clear();
    fetchingStandards.value = true;
    try {
      final query = supabase
          .from('ngss_performance_expectations')
          .select()
          .eq('active', 1);
      final response = await query;
      for (var element in response) {
        //final scope = categories.firstWhereOrNull((cat) => cat.ccid == ccid);
        scienceStandards.add(ScienceStandard.fromMap(element));
      }
      scienceStandardsByDomain.assignAll(
        scienceStandards.where((p0) => p0.domain == 1),
      );
    } catch (e) {
      print('Error loading standards $e');
    }
    fetchingStandards.value = false;
  }

  toggleScinceStandardsByDomain(int domain) {
    scienceStandardsByDomain.clear();
    scienceStandardsByDomain.assignAll(
      scienceStandards.where((p0) => p0.domain == domain),
    );
  }

  void toggleScienceStandard(ScienceStandard standard) {
    if (selectedScienceStandards.contains(standard)) {
      selectedScienceStandards.remove(standard);
      if (selectedScienceStandards.isEmpty) {
        selectedAlignedScienceStandards.value = null;
      }
    } else {
      selectedScienceStandards.add(standard);
      if (selectedAlignedScienceStandards.value == null) {
        selectedAlignedScienceStandards.value = standard;
      }
    }
  }

  RxBool get step4Complete =>
      (selectedNonScienceStandards.isNotEmpty ||
              selectedScienceStandards.isNotEmpty)
          .obs;

  // Step 5
  final step5ExController = ExpansibleController();
  Rx<Competency?> selectedAlignedCompetency = Rx<Competency?>(null);

  selectAlignedCompetency(Competency competency) {
    selectedAlignedCompetency.value = competency;
    fetchLevels(competency.dpcid);
    fetchStateStandards(competency.dpcid, selectedCategory.value!.ccid);
  }

  final Rxn<LevelsData> levelsData = Rxn<LevelsData>();
  final RxBool fetchingLevels = false.obs;

  void fetchLevels(int dpcid) async {
    try {
      fetchingLevels.value = true;
      final response = await supabase
          .from('dp_competencies')
          .select('extended_breakdown')
          .eq('dpcid', dpcid)
          .maybeSingle();
      final breakdown = response?['extended_breakdown'];
      if (breakdown != null) {
        levelsData.value = LevelsData.fromJson(breakdown);
        //print('levels ${levelsData.value}');
        return;
      }
      levelsData.value = null;
    } catch (e, st) {
      debugPrint('Error fetching levels: $e');
      debugPrintStack(stackTrace: st);
      levelsData.value = null;
    } finally {
      fetchingLevels.value = false;
    }
    return null;
  }

  final RxList<StateStandard> standardsData = <StateStandard>[].obs;
  final RxBool fetchingStateStandards = false.obs;

  void fetchStateStandards(int dpcid, int ccid) async {
    standardsData.clear();
    try {
      //fetchingLevels.value = true;
      final response = await supabase
          .from('dp_rubrics')
          .select('dprid,dplvlid,rubric_description')
          .eq('dpcid', dpcid)
          .eq('dpcid', dpcid)
          .eq('active', 1);
      if (response.isNotEmpty) {
        for (var element in response) {
          standardsData.add(StateStandard.fromMap(element));
        }
        //print('state standards ${standardsData.length}');
      }
    } catch (e) {
      debugPrint('Error fetching state standards: $e');
      levelsData.value = null;
    }
    return null;
  }

  // Aligned non science
  Rx<NonScienceStandard?> selectedAlignedNonScienceStandards =
      Rx<NonScienceStandard?>(null);

  selectAlignedNonScienceStandards(NonScienceStandard nonScienceStandard) {
    selectedAlignedNonScienceStandards.value = nonScienceStandard;
  }

  // Aligned science
  Rx<ScienceStandard?> selectedAlignedScienceStandards = Rx<ScienceStandard?>(
    null,
  );

  selectAlignedScienceStandards(ScienceStandard scienceStandard) {
    selectedAlignedScienceStandards.value = scienceStandard;
  }

  final levels = [
    LocalLevels(label: 'Emerging', key: 'level_1_3'),
    LocalLevels(label: 'Capable', key: 'level_1_3'),
    LocalLevels(label: 'Bridging', key: 'level_1_3'),
    LocalLevels(label: 'Proficient', key: 'level_4_proficient'),
    LocalLevels(label: 'Metacognition', key: 'level_5_metacognition'),
  ];

  Rx<LocalLevels> activeLevel = LocalLevels(
    label: 'Proficient',
    key: 'level_4_proficient',
  ).obs;

  /// Rubric text per level
  final rubricText = <String, String>{
    'Emerging': '',
    'Capable': '',
    'Bridging': '',
    'Proficient': '',
    'Metacognition': '',
  }.obs;

  /// Step completion
  RxBool step5Ready = false.obs;

  void setLevel(LocalLevels level) {
    activeLevel.value = level;
  }

  // void updateText(String level, String value) {
  //   rubricText[level] = value;
  //   rubricText.refresh();
  // }
}

class LocalLevels {
  final String label;
  final String key;

  LocalLevels({required this.label, required this.key});
}
