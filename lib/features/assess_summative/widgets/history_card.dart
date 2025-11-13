import 'package:flutter/material.dart';

class HistoryCard extends StatelessWidget {
  const HistoryCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _cardWrapper(
      title: "History",
      content:
          "Previous submission graded on 2025-10-12 (BRIDGING). Student resubmitted with revisions.",
    );
  }

  Widget _cardWrapper({required String title, required String content}) =>
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 6),
              child: Divider(),
            ),
            Text(content, style: TextStyle(color: Colors.black54)),
          ],
        ),
      );
}
