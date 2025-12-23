import 'package:dpng_staff/features/rubric_creation/models/course_category.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step1_basics.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/summative_creation/controller/summative_creation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'section_card.dart';

class Step1Scope extends StatelessWidget {
  //final Function(CourseCategory) onSelect;
  final int? openStep;
  final c = Get.find<SummativeCreationController>();

  Step1Scope({
    super.key,
    //required this.onSelect,
    required this.openStep,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      index: 1,
      title: "Step 1 — Select Main DP Alignment Scope",
      subtitle: "Choose one content area to anchor the summative.",
      locked: false,
      completed: c.selectedCategory.value != null,
      //isOpen: openStep == 1,
      //onToggle: () {},
      child: Column(
        children: [
          Divider(),
          SizedBox(height: 0),
          Padding(
            padding: const EdgeInsets.all(16),
            child: IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: RoundContainer(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Main Scope',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Pick a single scope you can edit later.',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 5),

                          Obx(
                            () => c.fetchingCategories.value
                                ? CategoryChipsShimmer(qty: 11)
                                : Wrap(
                                    spacing: 8,
                                    runSpacing: 8,
                                    children: c.categories.map((category) {
                                      final selected =
                                          c.selectedCategory.value != null &&
                                          c.selectedCategory.value!.title ==
                                              category.title;
                                      return ChoiceChip(
                                        label: Text(category.title),
                                        selected: selected,
                                        onSelected: (_) {
                                          c.handleScopeSelect(category);
                                        },
                                        selectedColor: Colors.blue[100],
                                      );
                                    }).toList(),
                                  ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 16),
                  Expanded(
                    flex: 1,
                    child: RoundContainer(
                      color: Colors.green.shade50,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Why this matters',
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: 5),
                          Text(
                            'Pick a single scope you can edit later.',
                            style: TextStyle(color: Colors.grey),
                          ),
                          SizedBox(height: 5),
                          Obx(
                            () => Text(
                              "Current: ${c.selectedCategory.value?.title ?? '— not selected —'}",
                              style: const TextStyle(
                                fontSize: 12,
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
