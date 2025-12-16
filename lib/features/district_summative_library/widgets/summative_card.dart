import 'package:flutter/material.dart';
import '../models/summative_model.dart';
import 'tag_chip.dart';

class SummativeCard extends StatelessWidget {
  final SummativeModel item;
  final bool selected;
  final VoidCallback onTap;

  const SummativeCard({
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
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF1F5F9) : Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + tags
            Expanded(
              flex: 3,
              child: Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       item.title,
              //       style: const TextStyle(
              //         fontWeight: FontWeight.w500,
              //         fontSize: 14,
              //       ),
              //     ),
              //     const SizedBox(height: 4),
              //     Wrap(children: item.tags.map((t) => TagChip(t)).toList()),
              //     const SizedBox(height: 2),
              //     Text(
              //       '${item.author} • ${item.grade}',
              //       style: const TextStyle(fontSize: 12, color: Colors.grey),
              //     ),
              //   ],
              // ),
            ),

            // Subject
            Expanded(
              flex: 2,
              child: Text(
                item.subject,
                style: const TextStyle(fontSize: 13, color: Colors.black87),
              ),
            ),

            // Standards
            Expanded(
              flex: 3,
              child: Wrap(
                children: item.standards
                    .map(
                      (t) => TagChip(
                        t,
                        showBorder: true,
                        borderColor: Colors.grey.shade300,
                      ),
                    )
                    .toList(),
              ),
            ),

            // Competencies
            Expanded(
              flex: 3,
              child: Wrap(
                children: item.competencies
                    .map(
                      (t) => TagChip(
                        t,

                        color: Colors.blue.shade50,
                        textColor: Colors.blue,
                        showBorder: true,
                        borderColor: Colors.blue.shade300,
                      ),
                    )
                    .toList(),
              ),
            ),

            // Actions
            SizedBox(
              // width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: const [
                  Icon(Icons.remove_red_eye_outlined, size: 18),

                  SizedBox(width: 8),
                  Icon(Icons.edit, size: 18),
                  SizedBox(width: 8),
                  Icon(Icons.copy, size: 18),
                  SizedBox(width: 8),
                  Icon(Icons.delete_outline, size: 18, color: Colors.red),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
