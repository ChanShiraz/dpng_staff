import 'package:dpng_staff/features/district_summative_library/widgets/tag_chip.dart';
import 'package:flutter/material.dart';
import '../models/rubric_model.dart';

class RubricCard extends StatelessWidget {
  final RubricModel item;
  final bool selected;
  final VoidCallback onTap;

  const RubricCard({
    super.key,
    required this.item,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onTap,
          hoverColor: const Color(0xFFF8FAFC),
          child: Container(
            color: selected ? const Color(0xFFF1F5F9) : Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Row(
              children: [
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),

                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 3),
                        child: Text(
                          '${'item.author'} • ${'item.grade'}',
                          style: const TextStyle(
                            fontSize: 12,
                            color: Colors.grey,
                          ),
                        ),
                      ),

                      // SizedBox(height: 2),
                      const SizedBox(height: 2),
                    ],
                  ),
                ),
                Expanded(flex: 1, child: Text(item.category)),
                Expanded(
                  flex: 2,
                  child: Wrap(
                    children: item.competencies
                        .map(
                          (t) => TagChip(
                            '${t.dpc_label}: ${t.dpc_heading}',
                            showBorder: true,
                            color: Colors.green.shade50,
                            borderColor: Colors.green.shade200,
                            textColor: Colors.green,
                          ),
                        )
                        .toList(),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Wrap(
                    children: item.standards
                        .map(
                          (t) => TagChip(
                            t,
                            showBorder: true,
                            color: Colors.deepPurple.shade50,
                            borderColor: Colors.deepPurple.shade100,
                            textColor: Colors.deepPurple.shade400,
                          ),
                        )
                        .toList(),
                  ),
                ),
                // Expanded(
                //   flex: 1,
                //   child: Text("${item.rubricTable.length} crit."),
                // ),
                SizedBox(
                  width: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Icon(Icons.remove_red_eye_outlined, size: 18),
                      SizedBox(width: 8),
                      Icon(Icons.file_download_outlined, size: 18),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          color: Colors.grey.shade300,
          height: 1,
        ),
      ],
    );
  }
}
