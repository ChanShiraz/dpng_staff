import 'package:flutter/material.dart';

class ChatInput extends StatefulWidget {
  final ValueChanged<String> onSend;

  const ChatInput({super.key, required this.onSend});

  @override
  State<ChatInput> createState() => _ChatInputState();
}

class _ChatInputState extends State<ChatInput> {
  final controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              minLines: 2,
              maxLines: null,
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Type a message…',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(width: 8),
          IconButton(
            icon: const Icon(Icons.send),
            onPressed: () {
              if (controller.text.trim().isEmpty) return;
              widget.onSend(controller.text);
              controller.clear();
            },
          ),
        ],
      ),
    );
  }
}
