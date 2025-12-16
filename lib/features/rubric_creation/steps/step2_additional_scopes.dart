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
            children: c.categories.map((category) {
              final selected = c.additionalSelectedScopes.value.contains(
                category,
              );
              final disabled =
                  category.title == c.selectedCategory.value!.title;
              if (disabled) return SizedBox();
              return FilterChip(
                avatar: selected ? null : Icon(Icons.add, color: Colors.black),
                label: Text(category.title),
                selected: selected,
                onSelected: disabled
                    ? null
                    : (_) {
                        c.toggleAdditionalScope(category);
                        c.fetchCompetencies([
                          c.selectedCategory.value!.ccid,
                          ...c.additionalSelectedScopes.map(
                            (element) => element.ccid,
                          ),
                        ]);
                      },
                selectedColor: Colors.green[100],
                backgroundColor: disabled ? Colors.grey[200] : null,
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Text(
            'Selected: ${c.additionalSelectedScopes.isEmpty ? "None selected yet" : c.additionalSelectedScopes.map((element) => element.title).join(', ')}',
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
