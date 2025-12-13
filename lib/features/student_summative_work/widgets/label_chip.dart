import 'package:flutter/material.dart';

class LabelChip extends StatelessWidget {
  final String text;
  final Color backgroundColor;
  final Color textColor;
  const LabelChip({super.key, required this.text, required this.backgroundColor, required this.textColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(color: backgroundColor, borderRadius: BorderRadius.circular(18)),
      child: Text(text, style: TextStyle(color: textColor, fontSize: 11, fontWeight: FontWeight.w600, letterSpacing: 1)),
    );
  }
}
