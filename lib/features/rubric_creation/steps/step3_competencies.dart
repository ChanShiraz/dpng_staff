import 'package:dpng_staff/features/course/widgets/summatives_shimmer.dart';
import 'package:dpng_staff/features/home/widgets/courses_shimmer.dart';
import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:dpng_staff/features/student_roster/widgets/student_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step3Competencies extends StatelessWidget {
  final RubricController c = Get.find<RubricController>();

  Step3Competencies({
    super.key,
    //required this.rubricRows,
    this.selectedRubricId,
  });
  //final List<Map<String, dynamic>> rubricRows;
  final String? selectedRubricId;

  @override
  Widget build(BuildContext context) {
    // Obx(() {
    //   final scopes = c.additionalScopes;
    //   // if (scopes.isEmpty) {
    //   //   return const Text("⚠️ Please select at least one scope first.");
    //   // }

    // });
    return Obx(
      () => c.fetchingComptecies.value
          ? SummativesShimmer()
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 12),
                // Container(
                //   decoration: BoxDecoration(
                //     color: Colors.black,
                //     borderRadius: BorderRadius.circular(10),
                //   ),
                //   padding: EdgeInsets.all(5),
                //   child: Text(
                //     scope,
                //     style: const TextStyle(color: Colors.white),
                //   ),
                // ),
                const SizedBox(height: 6),
                // Wrap(
                //   spacing: 8,
                //   runSpacing: 8,
                //   children: comps.map((comp) {
                //     final isSelected = c.selectedCompetencies.any(
                //       (x) => x['id'] == comp['id'] && x['scope'] == scopes,
                //     );
                //     return ChoiceChip(
                //       label: Text(comp['name']),
                //       selected: isSelected,
                //       onSelected: (_) => c.toggleCompetency(scopes[0], comp),
                //       selectedColor: Colors.orange[100],
                //     );
                //   }).toList(),
                // ),
                SizedBox(
                  width: double.infinity,
                  child: DataTable(
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
                          "Competency",
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
                      DataColumn(
                        label: Text(
                          "Priority",
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Colors.black54,
                          ),
                        ),
                      ),
                    ],
                    rows: c.comptencies.map((competency) {
                      final selected = c.selectedCompetencies.contains(
                        competency,
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
                                c.toggleCompetency(competency);
                              },
                              // step1Complete
                              //     ? () => onSelect(r["id"])
                              //     : null,,
                              child: Text(
                                selected ? "Chosen" : "Choose",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: selected ? Colors.green : Colors.black,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            SizedBox(
                              width: 300,
                              child: Text(
                                '${competency.dpc_label}: ${competency.dpc_heading}',
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              competency.dpc_description,
                              style: const TextStyle(color: Colors.black54),
                            ),
                          ),

                          DataCell(
                            Text(
                              competency.scope,
                              style: const TextStyle(
                                color: Colors.black54,
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              c.selectedCategory.value!.title ==
                                      competency.scope
                                  ? 'MAIN'
                                  : 'SECONDARY',
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
                SizedBox(height: 20),
                Text(
                  'Selected: ${c.selectedCompetencies.isEmpty ? "None selected yet" : c.selectedCompetencies.map((element) => element.dpc_heading).join(', ')}',
                  style: const TextStyle(color: Colors.black54),
                ),
              ],
            ),
    );
  }
}
