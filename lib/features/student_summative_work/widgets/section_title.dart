import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  final String title;
  const SectionTitle(this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(title.toUpperCase(), style: const TextStyle(fontSize: 11, letterSpacing: 1, fontWeight: FontWeight.w600, color: Colors.grey));
  }
}
