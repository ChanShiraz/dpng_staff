import 'package:dpng_staff/features/war_reporting/step2/widgets/attainment_badge.dart';
import 'package:dpng_staff/features/war_reporting/step2/widgets/status_badge.dart';
import 'package:dpng_staff/features/war_reporting/step2/widgets/tools_buttons.dart';
import 'package:flutter/material.dart';

Widget buildTable() {
  return Table(
    columnWidths: const {
      0: FlexColumnWidth(3),
      1: FlexColumnWidth(3),
      2: FlexColumnWidth(2),
      3: FlexColumnWidth(1),
      4: FlexColumnWidth(2),
      5: FlexColumnWidth(2),
    },
    border: const TableBorder(horizontalInside: BorderSide(color: Colors.grey)),
    children: [_headerRow(), ..._studentRows()],
  );
}

TableRow _headerRow() {
  return const TableRow(
    decoration: BoxDecoration(color: Color(0xffe8e8e8)),
    children: [
      _HeaderCell2("Student Name"),
      _HeaderCell2("Student Email"),
      _HeaderCell2("Competency Attainment"),
      _HeaderCell2("Completion %"),
      _HeaderCell2("Reporting Status"),
      _HeaderCell2("Tools"),
    ],
  );
}

List<Map<String, dynamic>> get data => [
  {
    "name": "Acevedo Graciano, Brian A.",
    "email": "bacevedo25@matrix4success.org",
    "attainment": "METACOGNITION",
    "color": Colors.green,
    "percent": "100%",
    "report": "COMPLETED",
  },
  {
    "name": "Adorno, Kevin",
    "email": "kadorno25@matrix4success.org",
    "attainment": "BRIDGING",
    "color": Colors.purple,
    "percent": "100%",
    "report": "COMPLETED",
  },
  {
    "name": "Argomaniz, James",
    "email": "jargomaniz6@matrix4success.org",
    "attainment": "NO EVIDENCE",
    "color": Colors.red,
    "percent": "0%",
    "report": "COMPLETED",
  },
  {
    "name": "Arjon, Luis R.",
    "email": "larjon26@matrix4success.org",
    "attainment": "METACOGNITION",
    "color": Colors.green,
    "percent": "25%",
    "report": "COMPLETED",
  },
];

List<TableRow> _studentRows() {
  return data.map((e) {
    return TableRow(
      children: [
        _DataCell2(e["name"]),
        _DataCell2(e["email"]),
        AttainmentBadge(label: e["attainment"], color: e["color"]),
        _DataCell2(e["percent"]),
        StatusBadge2(text: e["report"]),
        const ToolsButtons(),
      ],
    );
  }).toList();
}

class _HeaderCell2 extends StatelessWidget {
  final String text;
  const _HeaderCell2(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}

class _DataCell2 extends StatelessWidget {
  final String text;
  const _DataCell2(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }
}
