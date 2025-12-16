import 'package:dpng_staff/features/course/widgets/summatives_shimmer.dart';
import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step4Standards extends StatelessWidget {
  final RubricController c = Get.find<RubricController>();
  Step4Standards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Obx(
            () => c.fetchingStandards.value
                ? SummativesShimmer()
                : DataTable(
                    dataRowMaxHeight: double.infinity,
                    border: TableBorder.symmetric(
                      borderRadius: BorderRadius.circular(10),
                      outside: BorderSide(color: Colors.grey),
                    ),
                    columns: [
                      DataColumn(
                        label: Text(
                          "Select",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "State Standard Label",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                      DataColumn(
                        label: Text(
                          "Description",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),

                      DataColumn(
                        label: Text(
                          "Scope",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                    rows: c.nonScienceStandards.map((standard) {
                      final selected = c.selectedNonScienceStandards.contains(
                        standard,
                      );
                      return DataRow(
                        color: WidgetStatePropertyAll(
                          selected ? Colors.green.shade50 : Colors.white,
                        ),
                        cells: [
                          DataCell(
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                backgroundColor: selected
                                    ? Colors.green.shade200
                                    : Colors.transparent,
                              ),
                              onPressed: () {
                                c.toggleNonScienceStandard(standard);
                              },

                              child: Text(
                                selected ? "Chosen" : "Choose",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: selected ? Colors.green : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          DataCell(Text(standard.standard_label)),
                          DataCell(
                            Text(
                              standard.standard_description,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ),
                          DataCell(
                            Text(
                              standard.scope,
                              style: const TextStyle(
                                color: Colors.black54,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      );
                    }).toList(),
                  ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Selected: ${c.selectedNonScienceStandards.isEmpty ? "None selected yet" : c.selectedNonScienceStandards.map((element) => element.standard_label).join(', ')}',
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}

class Step4ScienceStandards extends StatelessWidget {
  final RubricController c = Get.find<RubricController>();
  Step4ScienceStandards({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: Obx(
            () => c.fetchingStandards.value
                ? SummativesShimmer()
                : Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: DefaultTabController(
                          length: 4,
                          child: TabBar(
                            unselectedLabelColor: Colors.grey,
                            labelColor: Colors.black,
                            indicatorColor: Colors.black,
                            isScrollable: true,
                            onTap: (value) {
                              c.toggleScinceStandardsByDomain(value + 1);
                            },
                            tabs: [
                              Tab(text: 'Physical Science'),
                              Tab(text: 'Life Science'),
                              Tab(text: 'Earth and Space Science'),
                              Tab(
                                text:
                                    'Engineering, Technology and Applications of Science',
                              ),
                            ],
                          ),
                        ),
                      ),
                      DataTable(
                        dataRowMaxHeight: double.infinity,
                        border: TableBorder.symmetric(
                          borderRadius: BorderRadius.circular(10),
                          outside: BorderSide(color: Colors.grey),
                        ),
                        columns: [
                          DataColumn(
                            label: Text(
                              "Select",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Label",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                          DataColumn(
                            label: Text(
                              "Performance Expection",
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Colors.black54,
                              ),
                            ),
                          ),
                        ],
                        rows: c.scienceStandardsByDomain.map((standard) {
                          final selected = c.selectedScienceStandards.contains(
                            standard,
                          );
                          return DataRow(
                            color: WidgetStatePropertyAll(
                              selected ? Colors.green.shade50 : Colors.white,
                            ),
                            cells: [
                              DataCell(
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    backgroundColor: selected
                                        ? Colors.green.shade200
                                        : Colors.transparent,
                                  ),
                                  onPressed: () {
                                    c.toggleScienceStandard(standard);
                                  },

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
                              DataCell(Text(standard.label)),
                              DataCell(
                                Text(
                                  standard.expectation,
                                  style: const TextStyle(color: Colors.black54),
                                ),
                              ),
                            ],
                          );
                        }).toList(),
                      ),
                    ],
                  ),
          ),
        ),
        SizedBox(height: 20),
        Text(
          'Selected: ${c.selectedScienceStandards.isEmpty ? "None selected yet" : c.selectedScienceStandards.map((element) => element.label).join(', ')}',
          style: const TextStyle(color: Colors.black54),
        ),
      ],
    );
  }
}
