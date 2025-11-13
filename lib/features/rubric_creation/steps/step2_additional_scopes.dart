import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step2AdditionalScopes extends StatelessWidget {
  final RubricController c = Get.find<RubricController>();

  Step2AdditionalScopes({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: c.scopes.map((scope) {
              final selected = c.additionalScopes.contains(scope);
              final disabled = scope == c.mainScope.value;
              return FilterChip(
                avatar: selected ? null : Icon(Icons.add, color: Colors.black),
                label: Text(scope),
                selected: selected,
                onSelected: disabled
                    ? null
                    : (_) => c.toggleAdditionalScope(scope),
                selectedColor: Colors.green[100],
                backgroundColor: disabled ? Colors.grey[200] : null,
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Text(
            'Selected: ${c.alignedScopes.isEmpty ? "None selected yet" : c.alignedScopes.join(", ")}',
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
