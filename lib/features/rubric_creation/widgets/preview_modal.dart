import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showRubricPreview(BuildContext context) {
  final c = Get.find<RubricController>();
  showDialog(
    context: context,
    builder: (_) => AlertDialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      title: const Text("Preview Rubric"),
      content: SizedBox(
        width: 600,
        height: 400,
        child: Obx(
          () => SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Title: ${c.rubricTitle.value}",
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                Text("Main Scope: ${c.selectedCategory.value!.title}"),
                const SizedBox(height: 8),
                //Text("Additional Scopes: ${c.additionalScopes.join(", ")}"),
                const Divider(),
                const Text("Competencies:"),
                //  ...c.selectedCompetencies.map((e) => Text("- ${e['name']}")),
                const Divider(),
                const Text("Standards:"),
               // ...c.selectedStandards.map((e) => Text("- ${e['label']}")),
                const Divider(),
                const Text("Rubric Levels:"),
                ...c.levels.map(
                  (lvl) => Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: Text("$lvl: ${c.rubricText[lvl]}"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      actions: [
        TextButton(onPressed: () => Get.back(), child: const Text("Close")),
      ],
    ),
  );
}
