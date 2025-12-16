import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:dpng_staff/features/rubric_creation/models/levels_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:shimmer/shimmer.dart';

class LevelsSection extends StatelessWidget {
  LevelsSection({super.key});
  final controller = Get.find<RubricController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final active = controller.activeLevel.value;
      return controller.fetchingLevels.value
          ? LevelsShimmer()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: controller.levels.map((level) {
                    final selected = active == level;

                    return ChoiceChip(
                      checkmarkColor: Colors.white,
                      label: Text(level.label),
                      selected: selected,
                      onSelected: (_) => controller.setLevel(level),
                      selectedColor: Colors.blue.shade600,
                      backgroundColor: Colors.grey.shade200,
                      labelStyle: TextStyle(
                        color: selected ? Colors.white : Colors.black87,
                        fontWeight: FontWeight.w500,
                      ),
                    );
                  }).toList(),
                ),

                const SizedBox(height: 16),

                /// ACTIVE LEVEL TEXT AREA
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.grey.shade300),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        active.label,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8),

                      TextField(
                        readOnly: true,
                        minLines: 3,
                        maxLines: 10,
                        style: TextStyle(fontSize: 14),
                        textAlignVertical: TextAlignVertical.top,
                        // controller:
                        //     TextEditingController(text: controller.rubricText[active])
                        //       ..selection = TextSelection.fromPosition(
                        //         TextPosition(
                        //           offset: controller.rubricText[active]!.length,
                        //         ),
                        //       ),
                        // onChanged: (v) => controller.updateText(active, v),
                        decoration: InputDecoration(
                          hintText: _hintForLevel(
                            controller.levelsData.value,
                            active.key,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                      ),
                      const SizedBox(height: 8),
                      controller.standardsData.isNotEmpty
                          ? Text(
                              _helperForLevel(active.label),
                              style: Theme.of(context).textTheme.bodySmall
                                  ?.copyWith(color: Colors.grey.shade700),
                            )
                          : SizedBox(),
                    ],
                  ),
                ),
              ],
            );
    });
  }

  String _hintForLevel(LevelsData? data, String key) {
    if (data == null) return '';

    final item = data.items.firstWhere(
      (e) => e.key == key,
      orElse: () => LevelItem(key: '', label: '', text: ''),
    );

    return item.text;
  }

  String _helperForLevel(String level) {
    switch (level) {
      case 'Emerging':
        return controller.standardsData
                .firstWhereOrNull((e) => e.dplvlid == 2)
                ?.rubric_description ??
            '';
      case 'Capable':
        return controller.standardsData
                .firstWhereOrNull((e) => e.dplvlid == 3)
                ?.rubric_description ??
            '';
      case 'Bridging':
        return controller.standardsData
                .firstWhereOrNull((e) => e.dplvlid == 4)
                ?.rubric_description ??
            '';
      case 'Proficient':
        return controller.standardsData
                .firstWhereOrNull((e) => e.dplvlid == 5)
                ?.rubric_description ??
            '';

      case 'Metacognition':
        return controller.standardsData
                .firstWhereOrNull((e) => e.dplvlid == 6)
                ?.rubric_description ??
            '';
      default:
        return '';
    }
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
