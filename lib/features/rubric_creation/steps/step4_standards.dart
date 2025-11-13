import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step4Standards extends StatelessWidget {
  final RubricController c = Get.find<RubricController>();

  final mockStandards = {
    "Math": [
      {"id": "s1", "label": "MA.1.1", "desc": "Solve real-world problems"},
      {"id": "s2", "label": "MA.2.4", "desc": "Reason abstractly"},
    ],
    "English": [
      {"id": "s3", "label": "EN.3.2", "desc": "Develop coherent arguments"},
      {"id": "s4", "label": "EN.4.1", "desc": "Interpret complex texts"},
    ],
  };

  Step4Standards({super.key, required this.rubricRows, this.selectedRubricId});
  final List<Map<String, dynamic>> rubricRows;
  final String? selectedRubricId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
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
                          color: selected ? Colors.green : Colors.black,
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
    );
    // Obx(() {
    //   final scopes = c.alignedScopes;
    //   if (scopes.isEmpty) {
    //     return const Text("⚠️ Please complete previous steps first.");
    //   }

    //   return Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: scopes.map((scope) {
    //       final list = mockStandards[scope] ?? [];
    //       return Column(
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           const SizedBox(height: 12),
    //           Text(
    //             scope,
    //             style: const TextStyle(
    //               fontWeight: FontWeight.bold,
    //               fontSize: 16,
    //             ),
    //           ),
    //           const SizedBox(height: 6),
    //           Column(
    //             children: list.map((std) {
    //               final selected = c.selectedStandards.any(
    //                 (x) => x['id'] == std['id'] && x['scope'] == scope,
    //               );
    //               return CheckboxListTile(
    //                 title: Text("${std['label']} — ${std['desc']}"),
    //                 value: selected,
    //                 onChanged: (_) => c.toggleStandard(scope, std),
    //                 controlAffinity: ListTileControlAffinity.leading,
    //               );
    //             }).toList(),
    //           ),
    //         ],
    //       );
    //     }).toList(),
    //   );
    // });
  }
}
