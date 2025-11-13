import 'package:flutter/material.dart';

class RubricNotesCard extends StatelessWidget {
  const RubricNotesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _cardWrapper(
      title: "Rubric Notes",
      content:
          "Proficient indicates consistent, accurate application of concepts; Advanced reflects transfer and extension beyond task.",
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
