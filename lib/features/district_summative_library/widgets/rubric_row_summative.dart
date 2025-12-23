import 'package:dpng_staff/features/%20district_rubric_library/controllers/rubric_controller.dart';
import 'package:dpng_staff/features/district_summative_library/controller/dis_summative_lib_controller.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/rubric_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class RubricRowSummative extends StatelessWidget {
  RubricRowSummative({super.key,required this.controller});
  final controller;
 // final controller = Get.find<DisSummativeLibController>();

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
              },
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
              },
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
              },
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
              },
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
              },
            ),
          ],
        ),
      ),
    );
  }
}
