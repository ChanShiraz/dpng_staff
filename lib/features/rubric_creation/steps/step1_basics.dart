import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step1Basics extends StatelessWidget {
  final RubricController c = Get.find<RubricController>();

  Step1Basics({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isWide = width > 800;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Enter Rubric Title",
          style: TextStyle(color: Colors.black54),
        ),
        SizedBox(height: 10),
        TextField(
          onChanged: (v) => c.rubricTitle.value = v,
          decoration: InputDecoration(
            hintText: "e.g., Critical Thinking Rubric",
            hintStyle: TextStyle(color: Colors.black54),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            filled: true,
            fillColor: Colors.grey[100],
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Main DP Alignment Scope",
          style: TextStyle(color: Colors.black54),
        ),
        const SizedBox(height: 8),
        Obx(
          () => Wrap(
            spacing: 8,
            runSpacing: 8,
            children: c.scopes.map((scope) {
              final selected = c.mainScope.value == scope;
              return ChoiceChip(
                label: Text(scope),
                selected: selected,
                onSelected: (_) => c.mainScope.value = scope,
                selectedColor: Colors.blue[100],
              );
            }).toList(),
          ),
        ),
        const SizedBox(height: 16),
        if (c.mainScope.value.isNotEmpty)
          Text(
            "Selected: ${c.mainScope.value}",
            style: const TextStyle(
              fontStyle: FontStyle.italic,
              color: Colors.black54,
            ),
          ),
      ],
    );
  }
}
