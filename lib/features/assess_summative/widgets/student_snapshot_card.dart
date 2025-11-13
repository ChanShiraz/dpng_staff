import 'package:flutter/material.dart';

class StudentSnapshotCard extends StatelessWidget {
  const StudentSnapshotCard({super.key});

  @override
  Widget build(BuildContext context) {
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
          
          _infoText("Student:", "Vince C. (Sofia Ochoa)"),
          _infoText("Course:", "Economics"),
          _infoText("Track:", "Track B"),
          _infoText("Submitted:", "2025-10-16"),
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
