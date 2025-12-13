import 'package:flutter/material.dart';

class InfoRow extends StatelessWidget {
  final String label;
  final String value;
  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Text(label, style: TextStyle(fontWeight: FontWeight.w500, color: Colors.grey.shade700)),
        Text(value, style: const TextStyle(fontFamily: "monospace", fontSize: 14.5, color: Colors.black87)),
      ]),
    );
  }
}
