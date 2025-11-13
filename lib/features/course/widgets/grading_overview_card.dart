import 'package:flutter/material.dart';

class GradingOverviewCard extends StatelessWidget {
  const GradingOverviewCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Grading Overview',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Divider(),
            ),
            const Text('3 Summatives to grade'),
            const SizedBox(height: 6),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: 0.7,
                minHeight: 8,
                backgroundColor: Colors.grey.shade200,
                color: Colors.indigo,
              ),
            ),
            const SizedBox(height: 6),
            const Text('7 of 10 total submissions'),
          ],
        ),
      ),
    );
  }
}
