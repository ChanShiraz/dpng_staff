import 'package:flutter/material.dart';

class TagChip extends StatelessWidget {
  final String label;
  const TagChip(
    this.label, {
    super.key,
    this.color = const Color(0xFFF1F5F9),
    this.textColor = const Color(0xFF475569),
  });
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 4, bottom: 4),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(label, style: TextStyle(fontSize: 12, color: textColor)),
    );
  }
}
