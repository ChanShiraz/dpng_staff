import 'package:flutter/material.dart';
import '../models/hub_model.dart';
import '../models/person_model.dart';
import '../models/message_model.dart';
import '../widgets/chat_header.dart';
import '../widgets/message_bubble.dart';
import '../widgets/chat_input.dart';

class ChatConversationPage extends StatefulWidget {
  final HubModel hub;
  final PersonModel person;

  const ChatConversationPage({
    super.key,
    required this.hub,
    required this.person,
  });

  @override
  State<ChatConversationPage> createState() => _ChatConversationPageState();
}

class _ChatConversationPageState extends State<ChatConversationPage> {
  final List<MessageModel> messages = [];

  void sendMessage(String text) {
    setState(() {
      messages.add(
        MessageModel(
          id: DateTime.now().toString(),
          text: text,
          isMe: true,
          time: DateTime.now(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ChatHeader(hub: widget.hub, person: widget.person),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: messages.length,
            itemBuilder: (_, i) => MessageBubble(message: messages[i]),
          ),
        ),
        Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Text('MESSAGE', style: TextStyle(color: Colors.grey)),
        ),
        ChatInput(onSend: sendMessage),
      ],
    );
  }
}
