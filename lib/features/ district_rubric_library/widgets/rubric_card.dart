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
    return InkWell(
      onTap: onTap,
      hoverColor: const Color(0xFFF8FAFC),
      child: Container(
        color: selected ? const Color(0xFFF1F5F9) : Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.title,
                    style: const TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(height: 4),
                  Wrap(children: item.tags.map((t) => TagChip(t)).toList()),
                  const SizedBox(height: 2),
                  Text(
                    '${item.author} • ${item.grade}',
                    style: const TextStyle(fontSize: 12, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Expanded(flex: 2, child: Text(item.subject)),
            Expanded(
              flex: 3,
              child: Wrap(
                children: item.standards.map((t) => TagChip(t)).toList(),
              ),
            ),
            Expanded(flex: 2, child: Text("${item.rubricTable.length} crit.")),
            SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.remove_red_eye_outlined, size: 18),
                  SizedBox(width: 8),
                  Icon(Icons.link, size: 18),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
