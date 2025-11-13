import 'package:flutter/material.dart';

class NotesSection extends StatelessWidget {
  const NotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Notes',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Divider(height: 24),

            Text(
              'Use Satisfactory for quick checks; use Resubmit to trigger review workflow.',
            ),
          ],
        ),
      ),
    );
  }
}

class HistorySection extends StatelessWidget {
  const HistorySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'History',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Divider(height: 24),
            Text('No prior assessment for this formative set yet.'),
          ],
        ),
      ),
    );
  }
}
