import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import '../models/summative_model.dart';
import 'tag_chip.dart';

class PreviewPanel extends StatelessWidget {
  final SummativeModel? summative;
  const PreviewPanel({super.key, required this.summative});

  @override
  Widget build(BuildContext context) {
    if (summative == null) {
      return const Center(
        child: Text(
          "Select a summative to preview details",
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    final item = summative!;
    return RoundContainer(
      color: Colors.white,
      //  margin: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
      padding: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Preview'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Divider(),
          ),
          Text(
            item.title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 4),
          Text(
            '${item.subject} • ${item.grade}',
            style: const TextStyle(fontSize: 13, color: Colors.grey),
          ),
          const SizedBox(height: 8),
          Text(
            'By ${item.author}',
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
          const SizedBox(height: 16),

          // Description
          const Text("Description", style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 6),
          Text(item.description, style: const TextStyle(fontSize: 13)),
          const SizedBox(height: 16),

          // Standards
          const Text("Standards", style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 6),
          Wrap(children: item.standards.map((e) => TagChip(e)).toList()),
          const SizedBox(height: 16),

          // Competencies
          const Text("Competencies", style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 6),
          Wrap(children: item.competencies.map((e) => TagChip(e)).toList()),
          const SizedBox(height: 16),

          // Example
          const Text("Example", style: TextStyle(color: Colors.black54)),
          const SizedBox(height: 6),
          Text(item.example, style: const TextStyle(fontSize: 13)),
          const Spacer(),

          // Buttons
          Row(
            children: [
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                child: const Text("Open Full Preview"),
              ),
              const SizedBox(width: 8),
              OutlinedButton(onPressed: () {}, child: const Text("Copy Link")),
            ],
          ),
        ],
      ),
    );
  }
}
