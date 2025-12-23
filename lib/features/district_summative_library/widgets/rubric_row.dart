import 'package:dpng_staff/features/%20district_rubric_library/controllers/rubric_controller.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/preview_panel.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RubricRow extends StatelessWidget {
  const RubricRow({super.key, required this.controller});
  final controller;
  //final controller = Get.put(DistrictRubricController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Obx(
        () => Row(
          children: [
            RubricItem(
              title: 'Emerging',
              subtitle: 'Awareness,\nRemember',
              score: 2,
              color: Color(0xFFF2994A),
              isSelected: controller.isSelected(2),
              onTap: () {
                controller.selectScore(2);
                controller.fetchRubricText(1, 2);
              },
              //controller: controller,
            ),
            const SizedBox(width: 14),
            RubricItem(
              title: 'Capable',
              subtitle: 'Understand',
              score: 3,
              color: Color(0xFF56CCF2),
              isSelected: controller.isSelected(3),
              onTap: () {
                controller.selectScore(3);
                controller.fetchRubricText(1, 2);
              },
              //controller: controller,
            ),
            const SizedBox(width: 14),
            RubricItem(
              title: 'Bridging',
              subtitle: 'Practice, Apply',
              score: 4,
              color: Color(0xFFBB6BD9),
              isSelected: controller.isSelected(4),
              onTap: () {
                controller.selectScore(4);
                controller.fetchRubricText(1, 2);
              },
              //controller: controller,
            ),
            const SizedBox(width: 14),
            RubricItem(
              title: 'Proficient',
              subtitle: 'Analyze, Choices',
              score: 5,
              color: Color(0xFF2F80ED),
              isSelected: controller.isSelected(5),
              onTap: () {
                controller.selectScore(5);
                controller.fetchRubricText(1, 2);
              },
              //controller: controller,
            ),
            const SizedBox(width: 14),
            RubricItem(
              title: 'Metacognition',
              subtitle: 'Reflect',
              score: 6,
              color: Color(0xFF27AE60),
              isSelected: controller.isSelected(6),
              onTap: () {
                controller.selectScore(6);
                controller.fetchRubricText(1, 2);
              },
              // controller: controller,
            ),
          ],
        ),
      ),
    );
  }
}

class RubricItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final int score;
  final Color color;
  //final DistrictRubricController controller;
  final bool isSelected;
  final VoidCallback onTap;

  const RubricItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.score,
    required this.color,
    // required this.controller,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    // return
    //Obx(() {
    //final isSelected = controller.isSelected(score);

    return GestureDetector(
      onTap: onTap,

      //  () {
      //   controller.selectScore(score);
      //   controller.fetchRubricText(1, 2);
      // },
      child: Container(
        padding: const EdgeInsets.all(2), // OUTER BORDER SPACE
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          border: isSelected ? Border.all(color: color, width: 1) : null,
        ),
        child: Container(
          width: 140,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          decoration: BoxDecoration(
            color: color.withOpacity(isSelected ? 0.15 : 0.08),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: color.withOpacity(0.35), width: 1.5),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                subtitle,
                style: TextStyle(fontSize: 12, color: color.withOpacity(0.85)),
              ),
              const SizedBox(height: 10),
              Text(
                (score - 1).toString(),
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
    //});
  }
}
