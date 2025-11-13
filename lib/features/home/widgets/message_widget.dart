import 'package:dpng_staff/features/home/view/message_model.dart';
import 'package:flutter/material.dart';

class MessagesWidget extends StatelessWidget {
  final List<MessageModel> messages;
  const MessagesWidget({super.key, required this.messages});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Messages',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
            const SizedBox(height: 8),
            ...messages.map(
              (m) => ListTile(
                contentPadding: EdgeInsets.zero,
                title: Text(
                  m.name,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  m.excerpt,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                trailing: m.unread > 0
                    ? CircleAvatar(radius: 12, child: Text('${m.unread}'))
                    : null,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
