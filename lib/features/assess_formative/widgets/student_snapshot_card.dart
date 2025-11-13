import 'package:flutter/material.dart';

class StudentSnapshotCard extends StatelessWidget {
  const StudentSnapshotCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text('Student Snapshot', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            SizedBox(height: 8),
            Text('Name: Vivica C. Ochoa'),
            Text('Email: vc.ochoa@diplomais.org'),
            Text('Subject: Economics'),
            Text('Submitted: 2025-10-16'),
          ],
        ),
      ),
    );
  }
}
