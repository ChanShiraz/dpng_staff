import 'package:dpng_staff/features/assessment_center/models/summative_assessment.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class StudentSnapshotCard extends StatelessWidget {
  const StudentSnapshotCard({super.key, required this.summative});
  final SummativeAssessment summative;

  @override
  Widget build(BuildContext context) {
    final DateFormat df = DateFormat('yyyy-MM-dd');
    return _cardWrapper(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Student Snapshot",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Divider(),
          ),

          _infoText("Student:", "${summative.first} ${summative.last}"),
          _infoText("Course:", summative.title1),
          _infoText(
            "Track:",
            summative.course_type == 4 ? "Track A" : "Track B",
          ),
          _infoText("Submitted:", df.format(summative.date)),
        ],
      ),
    );
  }

  Widget _infoText(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 14, color: Colors.black),
          children: [
            TextSpan(
              text: "$label\n",
              style: TextStyle(
                color: Colors.grey[700],
                fontWeight: FontWeight.w400,
              ),
            ),
            TextSpan(
              text: value,
              style: const TextStyle(
                //fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _cardWrapper({required Widget child}) => Container(
    width: double.infinity,
    padding: const EdgeInsets.all(16),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
    ),
    child: child,
  );
}
