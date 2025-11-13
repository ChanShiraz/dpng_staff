import 'package:flutter/material.dart';

class FormativeStatusCard extends StatelessWidget {
  const FormativeStatusCard({super.key});

  Widget _statusTile(String title, String count) {
    return Expanded(
      child: Card(
        elevation: 1,
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 4),
              Text(title, textAlign: TextAlign.center),
              Text(
                count,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

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
          children: [
            const Text(
              'Formative Status for Formative 1: Economics Terms/Concepts 25–28',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            // const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Divider(),
            ),
            Row(
              children: [
                _statusTile('Total Formative', '4'),
                _statusTile('Submitted', '4'),
                _statusTile('Not Assessed', '4'),
                _statusTile('Accepted', '0'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
