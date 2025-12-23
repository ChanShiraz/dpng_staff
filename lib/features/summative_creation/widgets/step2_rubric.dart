import 'package:dpng_staff/features/%20district_rubric_library/models/rubric_model.dart';
import 'package:dpng_staff/features/course/widgets/summatives_shimmer.dart';
import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:dpng_staff/features/rubric_creation/models/competency.dart';
import 'package:dpng_staff/features/rubric_creation/models/non_science_standard.dart';
import 'package:dpng_staff/features/rubric_creation/models/science_standard.dart';
import 'package:dpng_staff/features/summative_creation/controller/summative_creation_controller.dart';
import 'package:dpng_staff/features/summative_creation/models/rubric.dart';
import 'package:dpng_staff/features/summative_library/widgets/summative_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'section_card.dart';

class Step2Rubric extends StatelessWidget {
  final SummativeRubric? selectedRubricId;
  final bool step1Complete;
  final int? openStep;
  final Function(SummativeRubric) onSelect;

  Step2Rubric({
    super.key,
    required this.selectedRubricId,
    required this.step1Complete,
    required this.openStep,
    required this.onSelect,
  });
  final controller = Get.find<SummativeCreationController>();

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      index: 2,
      title: "Step 2 — Choose Integrated Competencies / Standards",
      subtitle: "Pick the rubric row that best aligns to your assessment.",
      locked: !step1Complete,
      completed: selectedRubricId != null,

      child: Column(
        children: [
          Divider(),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Obx(
              () => controller.fetchingRubrics.value
                  ? SummativesShimmer()
                  : SizedBox(
                      width: double.infinity,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(color: Colors.grey.shade400),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: DataTable(
                            dataRowMaxHeight: double.infinity,
                            headingRowColor: WidgetStatePropertyAll(
                              Colors.grey.shade200,
                            ),
                            // border: TableBorder.symmetric(
                            //   outside: BorderSide(color: Colors.grey),
                            //   borderRadius: BorderRadius.circular(20),
                            // ),
                            columns: [
                              DataColumn(
                                label: Text(
                                  "Select",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Rubric Title",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Standards",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              DataColumn(
                                label: Text(
                                  "Competency",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                            rows: controller.rubrics.map((r) {
                              final selected = selectedRubricId == r;
                              return DataRow(
                                color: WidgetStatePropertyAll(
                                  selected
                                      ? Colors.green.shade50
                                      : Colors.white,
                                ),
                                cells: [
                                  DataCell(
                                    OutlinedButton(
                                      style: OutlinedButton.styleFrom(
                                        backgroundColor: selected
                                            ? Colors.green.shade200
                                            : Colors.transparent,
                                      ),
                                      onPressed: step1Complete
                                          ? () {
                                              onSelect(r);
                                            }
                                          : null,
                                      child: Text(
                                        selected ? "Chosen" : "Choose",
                                        style: TextStyle(
                                          fontSize: 12,
                                          color: selected
                                              ? Colors.green
                                              : Colors.black,
                                        ),
                                      ),
                                    ),
                                  ),
                                  DataCell(
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(r.title),
                                        SizedBox(height: 5),
                                        Text(
                                          'Subtitle',
                                          style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 12,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  DataCell(
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: r.nonScienceStandard != null
                                          ? (r.nonScienceStandard
                                                    as List<NonScienceStandard>)
                                                .map<Widget>(
                                                  (s) => Text(
                                                    s.standard_label,
                                                    style: const TextStyle(
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                )
                                                .toList()
                                          : (r.scienceStandard
                                                    as List<ScienceStandard>)
                                                .map<Widget>(
                                                  (s) => Text(
                                                    s.label,
                                                    style: const TextStyle(
                                                      fontSize: 11,
                                                    ),
                                                  ),
                                                )
                                                .toList(),
                                    ),
                                  ),
                                  DataCell(
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: (r.competency)
                                          .map<Widget>(
                                            (r) => Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  '${r.dpc_label} ${r.dpc_heading}',
                                                  style: const TextStyle(
                                                    // fontSize: 12,
                                                  ),
                                                ),
                                                Text(
                                                  r.dpc_description,
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                          .toList(),
                                    ),
                                  ),
                                  // DataCell(
                                  //   Column(
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.start,
                                  //     children: [
                                  //       Text(
                                  //         '${r.competency.dpc_label} ${r.competency.dpc_heading}',
                                  //         style: const TextStyle(
                                  //           //fontWeight: FontWeight.bold,
                                  //         ),
                                  //       ),
                                  //       Text(
                                  //         r.competency.dpc_description,
                                  //         style: const TextStyle(
                                  //           fontSize: 12,
                                  //           color: Colors.grey,
                                  //         ),
                                  //       ),
                                  //     ],
                                  //   ),
                                  // ),
                                ],
                              );
                            }).toList(),
                          ),
                        ),
                      ),
                    ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'You can change the selected rubric later, dependent fields will update.',
                  style: TextStyle(color: Colors.black54),
                ),
                OutlinedButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: Icon(Icons.edit_outlined),
                      ),
                      Text('Choose a different rubric'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
