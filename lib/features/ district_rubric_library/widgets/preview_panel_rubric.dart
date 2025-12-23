// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dpng_staff/features/%20district_rubric_library/controllers/rubric_controller.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/rubric_row.dart';
import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:dpng_staff/features/student_roster/widgets/student_tile.dart';
import 'package:flutter/material.dart';

import 'package:dpng_staff/features/district_summative_library/widgets/preview_panel.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/tag_chip.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:shimmer/shimmer.dart';

import '../models/rubric_model.dart';

class PreviewPanelRubric extends StatelessWidget {
  final RubricModel? rubric;
  const PreviewPanelRubric({super.key, required this.rubric,required this.controller});
  final controller;

  @override
  Widget build(BuildContext context) {
    final item = rubric;

    return RoundContainer(
      circular: 20,
      color: Colors.white,
      padding: 20,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Preview',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const Divider(),

          item == null
              ? SizedBox(
                  height: 300,
                  child: Center(
                    child: Text(
                      "Select a rubric to preview details",
                      style: TextStyle(color: Colors.grey.shade500),
                    ),
                  ),
                )
              : Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// TITLE
                        Text(
                          item.title,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.category,
                          style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),

                        const SizedBox(height: 12),

                        /// COMPETENCIES
                        const Text(
                          "COMPETENCIES",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: item.competencies
                              .map(
                                (t) => TagChip(
                                  '${t.dpc_label}: ${t.dpc_heading}',
                                  showBorder: true,
                                  color: Colors.green.shade50,
                                  borderColor: Colors.green.shade200,
                                  textColor: Colors.green,
                                ),
                              )
                              .toList(),
                        ),

                        const SizedBox(height: 12),

                        /// STANDARDS
                        const Text(
                          "STANDARDS",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        Wrap(
                          spacing: 6,
                          runSpacing: 6,
                          children: item.standards
                              .map(
                                (e) => TagChip(
                                  e,
                                  showBorder: true,
                                  color: Colors.deepPurple.shade50,
                                  borderColor: Colors.deepPurple.shade100,
                                  textColor: Colors.deepPurple.shade400,
                                ),
                              )
                              .toList(),
                        ),

                        const SizedBox(height: 16),

                        /// RUBRIC LEVELS
                        const Text(
                          "RUBRIC",
                          style: TextStyle(color: Colors.grey),
                        ),
                        const SizedBox(height: 5),
                        RubricRow(controller: controller,),

                        const SizedBox(height: 16),

                        /// COMPETENCY RUBRICS
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: item.competencies.length,
                          itemBuilder: (context, index) {
                            final comp = item.competencies[index];
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 12),
                              child: RoundContainer(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TagChip(
                                      '${comp.dpc_label}: ${comp.dpc_heading}',
                                      showBorder: true,
                                      color: Colors.green.shade50,
                                      borderColor: Colors.green.shade200,
                                      textColor: Colors.green,
                                    ),
                                    const SizedBox(height: 6),
                                    _RubricTextWidget(dpcid: comp.dpcid),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),

                        const SizedBox(height: 16),

                        /// INTEGRATED RUBRIC
                        const Text(
                          "Integrated Rubric",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 5),
                        _IntegratedTextWidget(drlid: item.drlid),
                      ],
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

//   Widget _buildRubricTable(RubricModel rubric) {
//     final levels = [
//       "Criterion",
//       "Emerging",
//       "Capable",
//       "Bridging",
//       "Proficient",
//       "Metacognition",
//     ];

//     return SingleChildScrollView(
//       child: Table(
//         border: TableBorder.all(color: const Color(0xFFE2E8F0)),
//         columnWidths: const {0: FixedColumnWidth(120)},
//         defaultVerticalAlignment: TableCellVerticalAlignment.middle,
//         children: [
//           TableRow(
//             decoration: const BoxDecoration(color: Color(0xFFF8FAFC)),
//             children: levels
//                 .map(
//                   (h) => Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(
//                       h,
//                       style: const TextStyle(fontWeight: FontWeight.w600),
//                     ),
//                   ),
//                 )
//                 .toList(),
//           ),
//           ...rubric.rubricTable.entries.map((entry) {
//             return TableRow(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     entry.key,
//                     style: const TextStyle(fontWeight: FontWeight.w500),
//                   ),
//                 ),
//                 ...entry.value.map(
//                   (text) => Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Text(text, style: const TextStyle(fontSize: 13)),
//                   ),
//                 ),
//               ],
//             );
//           }),
//         ],
//       ),
//     );
//   }

class _RubricTextWidget extends StatelessWidget {
  _RubricTextWidget({super.key, required this.dpcid});

  final int dpcid;
  final controller = Get.find<DistrictRubricController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final id = controller.selectedScore.value;
      return FutureBuilder<String>(
        future: controller.fetchRubricText(dpcid, id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const RubricTextShimmer();
          }
          if (snapshot.hasError) {
            return const RoundContainer(
              child: Text('', style: TextStyle(fontSize: 13)),
            );
          }
          final text = snapshot.data?.isNotEmpty == true ? snapshot.data! : '';
          return RoundContainer(
            width: double.infinity,
            child: Text(text, style: const TextStyle(fontSize: 13)),
          );
        },
      );
    });
  }
}

class _IntegratedTextWidget extends StatelessWidget {
  _IntegratedTextWidget({super.key, required this.drlid});

  final int drlid;
  final controller = Get.find<DistrictRubricController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final id = controller.selectedScore.value;
      return FutureBuilder<String>(
        future: controller.fetchIntegratedText(drlid, id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const RubricTextShimmer();
          }
          if (snapshot.hasError) {
            return const RoundContainer(
              child: Text('', style: TextStyle(fontSize: 13)),
            );
          }
          final text = snapshot.data?.isNotEmpty == true ? snapshot.data! : '';
          return RoundContainer(
            width: double.infinity,
            child: Text(text, style: const TextStyle(fontSize: 13)),
          );
        },
      );
    });
  }
}

class RubricTextShimmer extends StatelessWidget {
  const RubricTextShimmer({super.key, this.qty = 1, this.height = 100});
  final int qty;
  final int height;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(qty, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Container(
                height: 100,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xfff8fafc),
                  border: const Border(
                    bottom: BorderSide(color: Color(0xffe2e8f0)),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
