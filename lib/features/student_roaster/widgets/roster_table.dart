import 'package:flutter/material.dart';

class RosterTable extends StatelessWidget {
  const RosterTable({super.key});

  @override
  Widget build(BuildContext context) {
    final rosterData = [
      ['US History A', 'Track A'],
      ['US History A', 'Track B'],
      ['US History B', 'Track A'],
      ['US History B', 'Track B'],
      ['Economics', 'Track A'],
      ['Economics', 'Track B'],
      ['Success Seminar A (Escalante)', 'Track B'],
      ['Success Seminar B (Escalante)', 'Track B'],
    ];

    return Card(
      elevation: 1,
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Table Header
            Container(
              color: Colors.grey.shade100,
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
              child: Row(
                children: const [
                  Expanded(
                    flex: 4,
                    child: Text(
                      'Course',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Learning Track',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text(
                      'View',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(height: 1),
            // Table Rows
            ...rosterData.map(
              (row) => Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 14,
                  horizontal: 8,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(color: Colors.grey.shade200),
                  ),
                ),
                child: Row(
                  children: [
                    Expanded(flex: 4, child: Text(row[0])),
                    Expanded(flex: 2, child: Text(row[1])),
                    Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FilledButton(
                          style: FilledButton.styleFrom(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 8,
                            ),
                          ),
                          onPressed: () {},
                          child: const Text('View'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Pagination Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Showing 1–8 of 12'),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () {},
                      child: const Text(
                        'Prev',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text('Page 1 / 2'),
                    const SizedBox(width: 8),
                    OutlinedButton(
                      onPressed: () {},
                      style: FilledButton.styleFrom(),
                      child: const Text(
                        'Next',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
