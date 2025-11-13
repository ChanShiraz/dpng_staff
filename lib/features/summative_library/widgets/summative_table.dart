import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/summative_library/controllers/summative_library_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'summative_row.dart';
import 'package:collection/collection.dart';

class SummativeTable extends StatelessWidget {
  const SummativeTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SummativeLibraryController>();

    return Obx(() {
      final data = controller.summatives;
      return Padding(
        padding: const EdgeInsets.all(12),
        child: RoundContainer(
          child: Column(
            children: [
              _buildHeader(controller),
              const Divider(height: 1),
              ...data.mapIndexed(
                (i, s) => SummativeRow(
                  item: s,
                  onSelect: () => controller.toggleSelection(i),
                ),
              ),
              const SizedBox(height: 10),
              _buildFooter(),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildHeader(SummativeLibraryController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Checkbox(
            value: controller.summatives.every((e) => e.selected),
            onChanged: (v) => controller.selectAll(v ?? false),
          ),
          const Expanded(
            flex: 3,
            child: Text("Title", style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          const Expanded(
            flex: 3,
            child: Text(
              "Standards",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const Expanded(
            flex: 3,
            child: Text(
              "Competencies",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const Expanded(
            flex: 2,
            child: Text(
              "Course",
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(
            width: 140,
            child: Text("Tools", style: TextStyle(fontWeight: FontWeight.w500)),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.centerRight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text("Page 1 of 1", style: TextStyle(color: Colors.grey)),
          const SizedBox(width: 16),
          OutlinedButton(onPressed: () {}, child: const Text("Previous")),
          const SizedBox(width: 8),
          OutlinedButton(onPressed: () {}, child: const Text("Next")),
        ],
      ),
    );
  }
}
