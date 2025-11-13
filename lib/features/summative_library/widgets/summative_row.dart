import 'package:dpng_staff/features/district_summative_library/widgets/tag_chip.dart';
import 'package:dpng_staff/features/summative_library/models/summative_library_model.dart';
import 'package:flutter/material.dart';

class SummativeRow extends StatelessWidget {
  final SummativeLibraryModel item;
  final VoidCallback onSelect;

  const SummativeRow({super.key, required this.item, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: item.selected ? const Color(0xFFF1F5F9) : Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Checkbox(
            side: BorderSide(color: Color(0xff585858)),
            value: item.selected,
            onChanged: (_) => onSelect(),
          ),
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
                Text(
                  "Updated ${item.updated}",
                  style: const TextStyle(color: Colors.grey, fontSize: 12),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.standard,
                  style: const TextStyle(fontWeight: FontWeight.w500),
                ),
                Text(
                  item.standardDesc,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Wrap(
              children: item.competencies.map((e) => TagChip(e)).toList(),
            ),
          ),
          Expanded(
            flex: 2,
            child: TagChip(
              item.course,
              textColor: Colors.blue,
              color: Colors.blue.shade100.withOpacity(0.3),
            ),
          ),
          SizedBox(
            width: 140,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(Icons.remove_red_eye_outlined, size: 18),
                SizedBox(width: 8),
                Icon(Icons.link, size: 18),
                SizedBox(width: 8),
                Icon(Icons.edit_outlined, size: 18),
                SizedBox(width: 8),
                Icon(Icons.copy, size: 18),
                SizedBox(width: 8),
                Icon(Icons.delete_outline, size: 18),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
