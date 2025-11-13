import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step3Competencies extends StatelessWidget {
  final RubricController c = Get.find<RubricController>();

  final Map<String, List<Map<String, dynamic>>> mockCatalog = {
    "Social Science": [
      {"id": "ss1", "name": "Analyzing Historical Events"},
      {"id": "ss2", "name": "Understanding Civic Systems"},
    ],
    "Math": [
      {"id": "m1", "name": "Problem Solving"},
      {"id": "m2", "name": "Quantitative Reasoning"},
    ],
    "English": [
      {"id": "e1", "name": "Critical Reading"},
      {"id": "e2", "name": "Analytical Writing"},
    ],
  };

  Step3Competencies({
    super.key,
    required this.rubricRows,
    this.selectedRubricId,
  });
  final List<Map<String, dynamic>> rubricRows;
  final String? selectedRubricId;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final scopes = c.alignedScopes;
      // if (scopes.isEmpty) {
      //   return const Text("⚠️ Please select at least one scope first.");
      // }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:
            // scopes.map((scope) {
            //   final comps = mockCatalog[scope] ?? [];
            //   return
            // }).toList(),
            [
              Column(
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
                  //       (x) => x['id'] == comp['id'] && x['scope'] == scope,
                  //     );
                  //     return ChoiceChip(
                  //       label: Text(comp['name']),
                  //       selected: isSelected,
                  //       onSelected: (_) => c.toggleCompetency(scope, comp),
                  //       selectedColor: Colors.orange[100],
                  //     );
                  //   }).toList(),
                  // ),
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(
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
                            "Example",
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
                      rows: rubricRows.map((r) {
                        final selected = selectedRubricId == r["id"];
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
                                onPressed: () {},
                                // step1Complete
                                //     ? () => onSelect(r["id"])
                                //     : null,,
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
                            DataCell(Text(r["title"] ?? "")),
                            DataCell(
                              Text(
                                r["description"],
                                style: const TextStyle(color: Colors.black54),
                              ),
                            ),
                            DataCell(
                              Text(
                                r["example"],
                                style: const TextStyle(
                                  color: Colors.black54,
                                  //fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            DataCell(
                              Text(
                                r["scope"],
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
                  Text('Selected: ', style: TextStyle(color: Colors.black54)),
                ],
              ),
            ],
      );
    });
  }
}
