import 'package:get/get.dart';
import '../models/rubric_model.dart';

class DistrictRubricController extends GetxController {
  var rubrics = <RubricModel>[].obs;
  var selectedRubric = Rxn<RubricModel>();

  @override
  void onInit() {
    super.onInit();
    rubrics.assignAll([
      RubricModel(
        title: "Claim-Evidence-Reasoning (CER) Writing Rubric",
        subject: "ELA",
        standards: ["CCSS.ELA-LITERACY.W.7.1", "CCSS.ELA-LITERACY.W.7.9"],
        competencies: ["Argumentation", "Evidence Use", "Organization"],
        author: "K. Shaw",
        grade: "Grade 6-8",
        tags: ["Argumentation", "Evidence Use", "Organization"],
        rubricTable: {
          "Claim": [
            "Claim is unclear or off-topic.",
            "Claim is stated but may be general.",
            "Clear, specific claim addresses prompt.",
            "Focused, arguable claim that frames reasoning.",
            "Nuanced claim; anticipates counterclaim/context.",
          ],
          "Evidence": [
            "Minimal or irrelevant evidence.",
            "Some relevant evidence; limited variety.",
            "Multiple relevant pieces of evidence.",
            "Well-chosen, sufficient evidence integrated smoothly.",
            "Sophisticated synthesis; evaluates evidence quality.",
          ],
          "Reasoning": [
            "Reasoning is missing or inaccurate.",
            "Basic reasoning; partially explains evidence.",
            "Explains how evidence supports claim.",
            "Logical, thorough reasoning connects ideas.",
            "Reflective analysis; addresses limitations/alternatives.",
          ],
        },
      ),
      RubricModel(
        title: "Mathematical Modeling Rubric",
        subject: "Math",
        standards: ["CCSS.MATH.CONTENT.HSA.CED.A.2", "CCSS.MATH.PRACTICE.MP4"],
        competencies: ["Modeling", "Precision", "Communication"],
        author: "All Schools",
        grade: "Grade 9",
        tags: ["Modeling", "Precision", "Communication"],
        rubricTable: {
          "Model": ["Incomplete", "Basic", "Functional", "Accurate", "Sophisticated"],
          "Precision": ["Inconsistent", "Adequate", "Clear", "Detailed", "Exact"],
          "Communication": ["Unclear", "Somewhat clear", "Clear", "Strong", "Insightful"],
        },
      ),
    ]);
  }

  void selectRubric(RubricModel rubric) {
    selectedRubric.value = rubric;
  }
}
