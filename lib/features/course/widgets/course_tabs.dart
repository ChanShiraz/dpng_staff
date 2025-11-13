import 'package:flutter/material.dart';

class CourseTabs extends StatefulWidget {
  const CourseTabs({super.key});

  @override
  State<CourseTabs> createState() => _CourseTabsState();
}

class _CourseTabsState extends State<CourseTabs> {
  int selectedIndex = 0;
  final tabs = ['Summatives', 'Formatives', 'Archive'];

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ...List.generate(tabs.length, (index) {
          final isSelected = index == selectedIndex;
          return Padding(
            padding: const EdgeInsets.only(right: 12),
            child: ChoiceChip(
              label: Text(tabs[index]),
              selected: isSelected,
              onSelected: (_) => setState(() => selectedIndex = index),
              selectedColor: Colors.indigo.shade100,
            ),
          );
        }),
        const Spacer(),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          onPressed: () {},
          icon: const Icon(Icons.library_add_outlined),
          label: const Text('Assign from Library'),
        ),
        const SizedBox(width: 8),
        OutlinedButton(
          onPressed: () {},
          child: const Text(
            'View Archive',
            style: TextStyle(color: Colors.black),
          ),
        ),
      ],
    );
  }
}
