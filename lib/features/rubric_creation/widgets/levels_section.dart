import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:dpng_staff/features/rubric_creation/models/levels_data.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/summative_creation/controller/rubric_level_controller.dart';
import 'package:dpng_staff/features/summative_creation/widgets/rubric_level_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:shimmer/shimmer.dart';

class RubricLevelChip extends StatelessWidget {
  RubricLevelChip({super.key});
  final controller = Get.put(RubricLevelController());

  final levels = [
    "Emerging",
    "Capable",
    "Bridging",
    "Proficient",
    "Metacognition",
  ];
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
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
        ),
        SizedBox(height: 10),
        Obx(
          () => Container(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  controller.activeLevel.value,
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                ),
                SizedBox(height: 5),
                TextField(
                  maxLines: 6,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter task-specific success criteria...",
                  ),
                  controller: controller.getTextController(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LevelsShimmer extends StatelessWidget {
  const LevelsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Chips shimmer
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: List.generate(
            5,
            (_) => Shimmer.fromColors(
              baseColor: Colors.grey.shade300,
              highlightColor: Colors.grey.shade100,
              child: Container(
                height: 36,
                width: 120,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
        ),

        const SizedBox(height: 16),

        /// Text area shimmer
        Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(height: 50, width: 180, color: Colors.white),
                const SizedBox(height: 12),
                Container(
                  height: 12,
                  width: double.infinity,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(
                  height: 12,
                  width: double.infinity,
                  color: Colors.white,
                ),
                const SizedBox(height: 8),
                Container(height: 12, width: 260, color: Colors.white),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
