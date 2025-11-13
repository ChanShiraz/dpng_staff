import 'package:flutter/material.dart';

class CourseHeaderCard extends StatelessWidget {
  const CourseHeaderCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Wrap(
              spacing: 8,
              children: [
                Chip(label: const Text('Track A')),
                Chip(label: const Text('Economics')),
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Economics – Course Overview',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            const Text(
              'A one-semester course designed to help students become responsible decision makers as they are exposed to economic issues at the personal, local, national, and international levels. Emphasis on practical application as it relates to the consumer across five basic economic units.',
              style: TextStyle(color: Colors.black54),
            ),

            const SizedBox(height: 16),
            Row(
              children: const [
                Icon(Icons.access_time, size: 18, color: Colors.black54),
                SizedBox(width: 6),
                Text(
                  'Tue, Thu · 11:00 AM–12:30 PM',
                  style: TextStyle(color: Colors.black54),
                ),
                SizedBox(width: 16),
                Icon(
                  Icons.people_alt_outlined,
                  size: 18,
                  color: Colors.black54,
                ),
                SizedBox(width: 6),
                Text('34 students', style: TextStyle(color: Colors.black54)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
