import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

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
          () => c.loadingCategories.value
              ? CategoryChipsShimmer()
              : Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: c.categories.map((category) {
                    final selected =
                        c.selectedCategory.value != null &&
                        c.selectedCategory.value!.title == category.title;
                    return ChoiceChip(
                      label: Text(category.title),
                      selected: selected,
                      onSelected: (_) {
                        c.selectedCategory.value = category;
                        c.fetchCompetencies([
                          c.selectedCategory.value!.ccid,
                          ...c.additionalSelectedScopes.map(
                            (element) => element.ccid,
                          ),
                        ]);
                        if (category.ccid == 4) {
                          c.fetchScienceStandards();
                        } else {
                          c.fetchNonScienceStandards(category.ccid);
                        }
                      },
                      selectedColor: Colors.blue[100],
                    );
                  }).toList(),
                ),
        ),
        const SizedBox(height: 16),
        Obx(
          () => c.selectedCategory.value != null
              ? Text(
                  "Selected: ${c.selectedCategory.value!.title}",
                  style: const TextStyle(
                    fontStyle: FontStyle.italic,
                    color: Colors.black54,
                  ),
                )
              : SizedBox(),
        ),
      ],
    );
  }
}

class CategoryChipsShimmer extends StatelessWidget {
  const CategoryChipsShimmer({super.key,this.qty = 8});
 final int qty;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Wrap(
        spacing: 8,
        runSpacing: 8,
        children: List.generate(
          qty,
          (index) => Container(
            height: 32,
            padding: const EdgeInsets.symmetric(horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const SizedBox(width: 60),
          ),
        ),
      ),
    );
  }
}
