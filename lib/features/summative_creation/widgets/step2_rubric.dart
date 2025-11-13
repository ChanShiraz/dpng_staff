import 'package:flutter/material.dart';
import 'section_card.dart';

class Step2Rubric extends StatelessWidget {
  final List<Map<String, dynamic>> rubricRows;
  final String? selectedRubricId;
  final bool step1Complete;
  final int? openStep;
  final Function(String) onSelect;

  const Step2Rubric({
    super.key,
    required this.rubricRows,
    required this.selectedRubricId,
    required this.step1Complete,
    required this.openStep,
    required this.onSelect,
  });

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
          SizedBox(
            width: double.infinity,
            child: Card(
              color: Colors.white,
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
                      "Rubric Title",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black54,
                      ),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Standards",
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
                          onPressed: step1Complete
                              ? () => onSelect(r["id"])
                              : null,
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
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(r["title"] ?? ""),
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: (r["standards"] as List)
                              .map<Widget>(
                                (s) => Text(
                                  s,
                                  style: const TextStyle(fontSize: 11),
                                ),
                              )
                              .toList(),
                        ),
                      ),
                      DataCell(
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              r["competency"]["code"],
                              style: const TextStyle(
                                //fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              r["competency"]["desc"],
                              style: const TextStyle(fontSize: 11),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
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
