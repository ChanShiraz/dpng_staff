import 'package:flutter/material.dart';

class FormativeListCard extends StatelessWidget {
  const FormativeListCard({super.key});

  Widget _formativeItem(String title) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6),
      color: Colors.white,
      child: Column(
        children: [
          Divider(),
          ListTile(
            title: Text(title),
            subtitle: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Submisson ID: 1923'),
                const Text('Date Submitted: 2025-10-16'),
                const Text('Date Assessd: N/A'),
              ],
            ),
            trailing: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Text(
                'NOT ASSESSED',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = [
      'What is economics (Q404)',
      'Formative on needs vs wants (Q405)',
      'Formative on Goods and Services (Q406)',
      'Formative for Factors and Systems (Q408)',
    ];

    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Formatives',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            ...items.map(_formativeItem),
          ],
        ),
      ),
    );
  }
}
