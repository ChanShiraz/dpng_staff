import 'package:flutter/material.dart';

class FeedbackSection extends StatelessWidget {
  final String author;
  final String feedback;

  const FeedbackSection({super.key, required this.author, required this.feedback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Feedback from $author", style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600)),
          const SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              border: Border.all(color: const Color(0xffe2e8f0)),
              color: const Color(0xfff8fafc),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
            child: Text(feedback, style: const TextStyle(fontSize: 14.5, height: 1.4)),
          ),
        ],
      ),
    );
  }
}
