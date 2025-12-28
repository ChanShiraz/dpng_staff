import 'package:flutter/material.dart';
import '../models/hub_model.dart';
import '../models/person_model.dart';

class ChatHeader extends StatelessWidget {
  final HubModel hub;
  final PersonModel person;

  const ChatHeader({super.key, required this.hub, required this.person});

  @override
  Widget build(BuildContext context) {
    final isCourse = hub.type == HubType.course;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          /// Title + subtitle
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Chat',
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 2),
              RichText(
                text: TextSpan(
                  style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
                  children: [
                    TextSpan(
                      text: hub.title,
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                    const TextSpan(text: ' • '),
                    TextSpan(text: person.name),
                  ],
                ),
              ),
            ],
          ),

          /// Type chip
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: isCourse ? Colors.grey.shade200 : Colors.indigo.shade50,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isCourse ? Colors.grey.shade400 : Colors.indigo.shade200,
              ),
            ),
            child: Text(
              isCourse ? 'Course Chat' : 'Staff Chat',
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w500,
                color: isCourse ? Colors.grey.shade800 : Colors.indigo.shade700,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
