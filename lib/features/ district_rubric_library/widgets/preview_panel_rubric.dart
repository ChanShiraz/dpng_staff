import 'package:dpng_staff/features/district_summative_library/widgets/tag_chip.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import '../models/rubric_model.dart';

class PreviewPanelRubric extends StatelessWidget {
  final RubricModel? rubric;
  const PreviewPanelRubric({super.key, required this.rubric});

  @override
  Widget build(BuildContext context) {
    if (rubric == null) {
      return const Center(child: Text("Select a rubric to preview details"));
    }

    final item = rubric!;
    return RoundContainer(
      //margin: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
      color: Colors.white,
      padding: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            item.title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(height: 4),
          Text(
            '${item.subject} • ${item.grade}',
            style: const TextStyle(color: Colors.grey, fontSize: 13),
          ),
          const SizedBox(height: 4),
          Text(
            'By ${item.author}',
            style: const TextStyle(color: Colors.grey, fontSize: 12),
          ),
          const SizedBox(height: 12),

          const Text(
            "STANDARDS",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Wrap(children: item.standards.map((e) => TagChip(e)).toList()),
          const SizedBox(height: 12),

          const Text(
            "COMPETENCIES",
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
          Wrap(children: item.competencies.map((e) => TagChip(e)).toList()),
          const SizedBox(height: 16),

          const Text("RUBRIC", style: TextStyle(fontWeight: FontWeight.w600)),
          const SizedBox(height: 8),
          Expanded(child: _buildRubricTable(item)),
        ],
      ),
    );
  }

  Widget _buildRubricTable(RubricModel rubric) {
    final levels = [
      "Criterion",
      "Emerging",
      "Capable",
      "Bridging",
      "Proficient",
      "Metacognition",
    ];

    return SingleChildScrollView(
      child: Table(
        border: TableBorder.all(color: const Color(0xFFE2E8F0)),
        columnWidths: const {0: FixedColumnWidth(120)},
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            decoration: const BoxDecoration(color: Color(0xFFF8FAFC)),
            children: levels
                .map(
                  (h) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      h,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                )
                .toList(),
          ),
          ...rubric.rubricTable.entries.map((entry) {
            return TableRow(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    entry.key,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                ),
                ...entry.value.map(
                  (text) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text, style: const TextStyle(fontSize: 13)),
                  ),
                ),
              ],
            );
          }),
        ],
      ),
    );
  }
}
