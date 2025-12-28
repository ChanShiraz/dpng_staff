import 'package:dpng_staff/features/assess_summative/controller/assess_summative_controller.dart';
import 'package:dpng_staff/features/course/widgets/summatives_shimmer.dart';
import 'package:dpng_staff/features/rubric_creation/models/competency.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StateStandardAssessmentCard extends StatelessWidget {
  StateStandardAssessmentCard({
    super.key,
    required this.drlid,
    required this.ccid,
  });
  final int drlid;
  final int ccid;
  final controller = Get.find<AssessSummativeController>();

  @override
  Widget build(BuildContext context) {
    return _cardWrapper(title: "State Standard Assessment");
  }

  Widget _cardWrapper({required String title}) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Divider(),
          ),
          ccid == 4 ? _sciencStandardWidget() : _standardWidget(),
        ],
      ),
    );
  }

  _sciencStandardWidget() {
    return Obx(() {
      if (controller.fetchingScienceStandards.value) {
        return SummativesShimmer(quantity: 2, height: 70, borderRadius: 0);
      } else if (controller.fetchScienceStandardsError.value.isNotEmpty) {
        return Column(
          children: [
            Text(
              controller.fetchScienceStandardsError.value,
              style: TextStyle(color: Colors.red),
            ),
            IconButton(
              onPressed: () {
                controller.fetchScienceStandards(drlid);
              },
              icon: Icon(Icons.replay_outlined),
            ),
          ],
        );
      } else if (controller.scienceStandards.isEmpty) {
        return Text('No standards found.');
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: controller.scienceStandards.map((comp) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Obx(() {
                final selectedLevel =
                    controller.selectedScienceStandardLevels
                        .firstWhereOrNull((e) => e.ngpeid == comp.ngpeid)
                        ?.selectedLevel ??
                    6;
                return CompetencyItemWidget(
                  // competency: comp,
                  title: comp.label,
                  subTitle: comp.expectation,
                  selectedLevel: selectedLevel,
                  onSelected: (level) {
                    controller.selectScienceStandardLevel(comp.ngpeid, level);
                  },
                );
              }),
            );
          }).toList(),
        );
      }
    });
  }

  _standardWidget() {
    return Obx(() {
      if (controller.fetchingStandards.value) {
        return SummativesShimmer(quantity: 2, height: 70, borderRadius: 0);
      } else if (controller.fetchStandardsError.value.isNotEmpty) {
        return Column(
          children: [
            Text(
              controller.fetchStandardsError.value,
              style: TextStyle(color: Colors.red),
            ),
            IconButton(
              onPressed: () {
                controller.fetchStandards(drlid);
              },
              icon: Icon(Icons.replay_outlined),
            ),
          ],
        );
      } else if (controller.standards.isEmpty) {
        return Text('No standards found.');
      } else {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: controller.standards.map((comp) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Obx(() {
                final selectedLevel =
                    controller.selectedStandardLevels
                        .firstWhereOrNull((e) => e.p_standid == comp.p_standid)
                        ?.selectedLevel ??
                    6;
                return CompetencyItemWidget(
                  // competency: comp,
                  title: comp.standard_label,
                  subTitle: comp.standard_description,
                  selectedLevel: selectedLevel,
                  onSelected: (level) {
                    controller.selectStandardLevel(comp.p_standid, level);
                  },
                );
              }),
            );
          }).toList(),
        );
      }
    });
  }
}

class CompetencyItemWidget extends StatelessWidget {
  const CompetencyItemWidget({
    super.key,
    //required this.competency,
    required this.selectedLevel,
    required this.onSelected,
    required this.title,
    required this.subTitle,
  });

  //final Competency competency;
  final int selectedLevel;
  final Function(int level) onSelected;
  final String title;
  final String subTitle;

  static const List<Map<String, dynamic>> assessmentLabels = [
    {"label": "EMERGING", "value": 1},
    {"label": "CAPABLE", "value": 2},
    {"label": "BRIDGING", "value": 3},
    {"label": "PROFICIENT", "value": 4},
    {"label": "METACOGNITION", "value": 5},
    {"label": "NO EVIDENCE", "value": 0},
    {"label": "NOT ASSESSED", "value": 6},
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        Text(subTitle),
        const SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: assessmentLabels.map((item) {
            final bool isSelected = selectedLevel == item['value'];

            return InkWell(
              onTap: () => onSelected(item['value']),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12),
                ),
                child: Text(
                  item['label'],
                  style: TextStyle(
                    color: isSelected ? Colors.white : Colors.black87,
                    fontSize: 12,
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}
