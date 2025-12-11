import 'package:dpng_staff/features/war_reporting/step1/widgets/row_select_button.dart';
import 'package:dpng_staff/features/war_reporting/step1/widgets/status_badge.dart';
import 'package:flutter/material.dart';

class CourseTable extends StatelessWidget {
  const CourseTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Select Course For Work Assignment and Record Report:",
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 20),
        Table(
          columnWidths: const {
            0: FlexColumnWidth(3),
            1: FlexColumnWidth(2),
            2: FlexColumnWidth(2),
            3: FlexColumnWidth(1),
          },
          border: const TableBorder(
            horizontalInside: BorderSide(color: Colors.grey),
          ),
          children: [_headerRow(), ..._buildCourseRows()],
        ),
      ],
    );
  }

  // header
  TableRow _headerRow() {
    return TableRow(
      decoration: const BoxDecoration(color: Color(0xffe8e8e8)),
      children: const [
        _HeaderCell("Course"),
        _HeaderCell("Learning Track"),
        _HeaderCell("Reporting Status"),
        _HeaderCell("Select"),
      ],
    );
  }

  // fake data
  List<Map<String, dynamic>> get sampleCourses => [
    {"course": "US History A", "track": "Track A", "status": "COMPLETED"},
    {"course": "US History A", "track": "Track B", "status": "COMPLETED"},
    {
      "course": "Success Seminar B [Escalante]",
      "track": "Track B",
      "status": "NO STUDENTS",
    },
    {
      "course": "Success Seminar C [Escalante]",
      "track": "Track A",
      "status": "COMPLETED",
    },
  ];

  List<TableRow> _buildCourseRows() {
    return sampleCourses.map((e) {
      return TableRow(
        decoration: const BoxDecoration(color: Colors.white),
        children: [
          _DataCell(e["course"]),
          _DataCell(e["track"]),
          StatusBadge(text: e["status"]),
          const RowSelectButtons(),
        ],
      );
    }).toList();
  }
}

class _HeaderCell extends StatelessWidget {
  final String text;
  const _HeaderCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(text, style: const TextStyle(fontWeight: FontWeight.w600)),
    );
  }
}

class _DataCell extends StatelessWidget {
  final String text;
  const _DataCell(this.text);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Text(text, style: const TextStyle(fontSize: 14)),
    );
  }
}
