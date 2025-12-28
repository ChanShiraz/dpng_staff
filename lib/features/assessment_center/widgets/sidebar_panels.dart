import 'package:flutter/material.dart';

class CalendarPanel extends StatelessWidget {
  const CalendarPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Calendar',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            Divider(),
            //   const Text(
            //     'Next: Grading block · Fri 1:00–1:30 PM',
            //     style: TextStyle(fontSize: 13, color: Colors.black54),
            //   ),
          ],
        ),
      ),
    );
  }
}

class MessagesPanel extends StatelessWidget {
  const MessagesPanel({super.key});

  Widget messageRow(String title, String subtitle, int count) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: const TextStyle(fontSize: 13, color: Colors.black54),
                ),
              ],
            ),
          ),
          CircleAvatar(
            radius: 14,
            backgroundColor: Colors.grey.shade200,
            child: Text('$count'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Messages',
              style: TextStyle(fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 12),
            messageRow('Emily Moore', 'Question about homework', 1),
            const SizedBox(height: 8),
            messageRow('Michael Lee', 'Could you help me with...', 3),
            const SizedBox(height: 8),
            messageRow('Ashley Smith', 'When is the assignment...', 0),
          ],
        ),
      ),
    );
  }
}
