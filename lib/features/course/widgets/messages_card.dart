import 'package:flutter/material.dart';

class MessagesCard extends StatelessWidget {
  const MessagesCard({super.key});

  Widget _messageItem(String name, String msg, int count) {
    return ListTile(
      title: Text(name, style: const TextStyle(fontWeight: FontWeight.w500)),
      subtitle: Text(
        msg,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Colors.black54),
      ),
      trailing: CircleAvatar(
        backgroundColor: Colors.indigo.shade100,
        radius: 12,
        child: Text(
          '$count',
          style: const TextStyle(fontSize: 12, color: Colors.indigo),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final messages = [
      ['Emily Moore', 'Question about homework', 1],
      ['Michael Lee', 'Could you help me with...', 3],
      ['Ashley Smith', 'When is the assignment...', 1],
    ];

    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                'Messages',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            ...messages.map(
              (m) => _messageItem(m[0] as String, m[1] as String, m[2] as int),
            ),
          ],
        ),
      ),
    );
  }
}
