import 'package:dpng_staff/features/summative_library/models/summative_library_model.dart';
import 'package:get/get.dart';

class SummativeLibraryController extends GetxController {
  var summatives = <SummativeLibraryModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    summatives.assignAll([
      SummativeLibraryModel(
        title: "US Imperialism Essay 25-26",
        standard: "CA USH 11.4",
        standardDesc:
            "Students trace the rise of the United States to its role as a world power in the twentieth century.",
        competencies: ["ss01 • Historical Context", "ss08 • Impact of Economics"],
        course: "US History A",
        updated: "2025-09-12",
        teacher: "Shaw",
      ),
      SummativeLibraryModel(
        title: "Presidential Powers Case Study Essay 25-26",
        standard: "CA USH 11.1",
        standardDesc:
            "Analyze significant events in the founding of the nation and the philosophy of government described in the Declaration of Independence.",
        competencies: ["ss01 • Historical Context"],
        course: "US History B",
        updated: "2025-09-10",
        teacher: "Shaw",
      ),
      SummativeLibraryModel(
        title: "Atomic Bomb Slideshow 25-26",
        standard: "CA USH 11.7",
        standardDesc: "Analyze America’s participation in World War II.",
        competencies: ["ss01 • Historical Context"],
        course: "US History B",
        updated: "2025-08-29",
        teacher: "Shaw",
      ),
      SummativeLibraryModel(
        title: "The New Deal 25-26",
        standard: "CA USH 11.6",
        standardDesc:
            "Explain the different explanations for the Great Depression and how the New Deal changed the role of the federal government.",
        competencies: ["ss02 • Change, Cause & Effect"],
        course: "US History B",
        updated: "2025-07-21",
        teacher: "Shaw",
      ),
      SummativeLibraryModel(
        title: "Child Labor Slideshow 25-26",
        standard: "CA USH 11.2",
        standardDesc:
            "Analyze the rise of industrialization, migration, and mass immigration from Southern and Eastern Europe.",
        competencies: ["ss02 • Change, Cause & Effect"],
        course: "US History A",
        updated: "2025-07-15",
        teacher: "Shaw",
      ),
      SummativeLibraryModel(
        title: "Reconstruction Slides 25-26",
        standard: "CA USH 11.1",
        standardDesc:
            "Analyze significant events in the founding of the nation and its attempts to realize the philosophy of government.",
        competencies: ["ss01 • Historical Context"],
        course: "US History A",
        updated: "2025-07-05",
        teacher: "Shaw",
      ),
    ]);
  }

  void toggleSelection(int index) {
    summatives[index] =
        summatives[index].copyWith(selected: !summatives[index].selected);
  }

  void selectAll(bool select) {
    summatives.assignAll(
      summatives.map((s) => s.copyWith(selected: select)).toList(),
    );
  }
}
