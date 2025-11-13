import 'package:flutter/material.dart';
import 'section_card.dart';

class Step1Scope extends StatelessWidget {
  final List<String> scopes;
  final String? selectedScope;
  final Function(String) onSelect;
  final int? openStep;

  const Step1Scope({
    super.key,
    required this.scopes,
    required this.selectedScope,
    required this.onSelect,
    required this.openStep,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      index: 1,
      title: "Step 1 — Select Main DP Alignment Scope",
      subtitle: "Choose one content area to anchor the summative.",
      locked: false,
      completed: selectedScope != null,
      //isOpen: openStep == 1,
      //onToggle: () {},
      child: Column(
        children: [
          Divider(),
          SizedBox(height: 15),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: scopes.map((s) {
              final selected = s == selectedScope;
              return ChoiceChip(
                label: Text(s),
                selected: selected,
                onSelected: (_) => onSelect(s),
                selectedColor: Colors.green.shade100,
              );
            }).toList(),
          ),
          const SizedBox(height: 12),
          Text(
            "Current: ${selectedScope ?? '— not selected —'}",
            style: const TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
