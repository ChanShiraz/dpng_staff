import 'package:dpng_staff/features/summative_creation/controller/rubric_level_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class RubricLevelChip extends StatelessWidget {
  RubricLevelChip({super.key});
  final controller = Get.find<RubricLevelController>();

  final levels = [
    "Emerging",
    "Capable",
    "Bridging",
    "Proficient",
    "Metacognition",
  ];
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        spacing: 8,
        runSpacing: 8,
        children: levels.map((lvl) {
          final colors = levelColors(lvl);
          final selected = lvl == controller.activeLevel.value;
          return ChoiceChip(
            label: Text(lvl, style: TextStyle(color: colors['text'])),
            selected: selected,
            onSelected: (_) {
              controller.handleLevelSelect(lvl);
            },
            selectedColor: colors['bg'],
            backgroundColor: Colors.white,
            checkmarkColor: colors['text'],
          );
        }).toList(),
      ),
    );
  }
}

class ScafolddingEntry extends StatelessWidget {
  ScafolddingEntry({super.key});
  final controller = Get.find<RubricLevelController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: levelColors(
            controller.activeLevel.value,
          )['bg']!.withOpacity(0.5),
          border: Border.all(color: Colors.grey.shade300),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Enter Scaffolding Rubric",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Teacher Notes',
                        style: TextStyle(color: Colors.black54),
                      ),
                      SizedBox(height: 5),
                      Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          border: Border.all(color: Colors.grey.shade300),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          'Use the descriptors above to craft task-specific success criteria (what "good" looks like). Include sample evidence artifacts (e.g., graphs, solution tables, error analysis) aligned to each level.',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                Obx(
                  () => Expanded(
                    flex: 1,
                    child: TextField(
                      maxLines: 6,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "Enter task-specific success criteria...",
                      ),
                      controller: controller.getTextController(),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
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
