import 'package:flutter/material.dart';

class RosterSearchFilterBar extends StatelessWidget {
  const RosterSearchFilterBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search course name...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 16),
            const Text('Track', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(width: 8),
            DropdownButton<String>(
              value: 'All',
              items: const [
                DropdownMenuItem(value: 'All', child: Text('All')),
                DropdownMenuItem(value: 'Track A', child: Text('Track A')),
                DropdownMenuItem(value: 'Track B', child: Text('Track B')),
              ],
              onChanged: (value) {},
              borderRadius: BorderRadius.circular(10),
            ),
          ],
        ),
      ),
    );
  }
}
