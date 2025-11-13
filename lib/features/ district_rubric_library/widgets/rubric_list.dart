import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/rubric_controller.dart';
import 'rubric_card.dart';

class RubricList extends StatelessWidget {
  const RubricList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<DistrictRubricController>();

    return Obx(() {
      final rubrics = controller.rubrics;
      final selected = controller.selectedRubric.value;

      return RoundContainer(
        padding: 16,
        color: Colors.white,
        child: Column(
          children: [
            _buildHeader(),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                itemCount: rubrics.length,
                itemBuilder: (context, i) {
                  final item = rubrics[i];
                  return RubricCard(
                    item: item,
                    selected: selected == item,
                    onTap: () => controller.selectRubric(item),
                  );
                },
              ),
            ),
          ],
        ),
      );
    });
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: const [
          Expanded(
            flex: 3,
            child: Text(
              'Title / Course',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Subject',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Standards',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Competencies',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 80,
            child: Text(
              'Actions',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
