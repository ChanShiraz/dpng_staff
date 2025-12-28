import 'package:dpng_staff/features/assess_summative/controller/assess_summative_controller.dart';
import 'package:dpng_staff/features/assess_summative/widgets/state_standard_assessment_card.dart';
import 'package:dpng_staff/features/course/widgets/summatives_shimmer.dart';
import 'package:dpng_staff/features/rubric_creation/models/competency.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CompetencyAssessmentCard extends StatelessWidget {
  CompetencyAssessmentCard({super.key, required this.drlid});
  final int drlid;
  final controller = Get.find<AssessSummativeController>();

  @override
  Widget build(BuildContext context) {
    return _cardWrapper(title: "DP Competency Assessment");
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
          Obx(() {
            if (controller.fetchingCompetencies.value) {
              return SummativesShimmer(
                quantity: 2,
                height: 70,
                borderRadius: 0,
              );
            } else if (controller.fetchCompetenciesError.value.isNotEmpty) {
              return Column(
                children: [
                  Text(
                    controller.fetchCompetenciesError.value,
                    style: TextStyle(color: Colors.red),
                  ),
                  IconButton(
                    onPressed: () {
                      controller.fetchCompetencies(drlid);
                    },
                    icon: Icon(Icons.replay_outlined),
                  ),
                ],
              );
            } else if (controller.competencies.isEmpty) {
              return Text('No competencies found.');
            } else {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: controller.competencies.map((comp) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: Obx(() {
                      final selectedLevel =
                          controller.selectedCompetencyLevels
                              .firstWhereOrNull((e) => e.dpcid == comp.dpcid)
                              ?.selectedLevel ??
                          6;

                      return CompetencyItemWidget(
                        //competency: comp,
                        title: '${comp.dpc_label} ${comp.dpc_heading}',
                        subTitle: comp.dpc_description,
                        selectedLevel: selectedLevel,
                        onSelected: (level) {
                          controller.selectCompetencyLevel(comp.dpcid, level);
                        },
                      );
                    }),
                  );
                }).toList(),
              );
            }
          }),
        ],
      ),
    );
  }
}

// class CompetencyItemWidget extends StatelessWidget {
//   const CompetencyItemWidget({
//     super.key,
//     required this.competency,
//     required this.selectedLevel,
//     required this.onSelected,
//   });

//   final Competency competency;
//   final int selectedLevel;
//   final Function(int level) onSelected;

//   static const List<Map<String, dynamic>> assessmentLabels = [
//     {"label": "EMERGING", "value": 1},
//     {"label": "CAPABLE", "value": 2},
//     {"label": "BRIDGING", "value": 3},
//     {"label": "PROFICIENT", "value": 4},
//     {"label": "ADVANCED", "value": 5},
//     {"label": "NO EVIDENCE", "value": 0},
//     {"label": "NOT ASSESSED", "value": 6},
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(
//           '${competency.dpc_label} ${competency.dpc_heading}',
//           style: const TextStyle(fontWeight: FontWeight.w500),
//         ),
//         Text(competency.dpc_description),
//         const SizedBox(height: 12),
//         Wrap(
//           spacing: 8,
//           runSpacing: 8,
//           children: assessmentLabels.map((item) {
//             final bool isSelected = selectedLevel == item['value'];

//             return InkWell(
//               onTap: () => onSelected(item['value']),
//               child: Container(
//                 padding: const EdgeInsets.symmetric(
//                   horizontal: 12,
//                   vertical: 6,
//                 ),
//                 decoration: BoxDecoration(
//                   color: isSelected ? Colors.black : Colors.transparent,
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(color: Colors.black12),
//                 ),
//                 child: Text(
//                   item['label'],
//                   style: TextStyle(
//                     color: isSelected ? Colors.white : Colors.black87,
//                     fontSize: 12,
//                   ),
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
// }
