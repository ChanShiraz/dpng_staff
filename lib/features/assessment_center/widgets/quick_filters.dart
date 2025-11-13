import 'package:flutter/material.dart';

class QuickFiltersPanel extends StatelessWidget {
  const QuickFiltersPanel({super.key});

  Widget filterChip(String label) {
    return Padding(
      padding: const EdgeInsets.only(right: 8, bottom: 8),
      child: OutlinedButton(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.grey.shade300),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          backgroundColor: Colors.white,
        ),
        child: Text(label, style: TextStyle(color: Colors.black54)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quick Filters',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            Wrap(
              children: [
                filterChip('All Courses'),
                filterChip('Track A'),
                filterChip('Track B'),
                filterChip('Newest'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
