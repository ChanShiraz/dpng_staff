import 'dart:ui';

import 'package:flutter/material.dart';

class DBadge extends StatelessWidget {
  final String text;
  final String colorKey;
  const DBadge({super.key, required this.text, required this.colorKey});

  Color _bg(String key) {
    switch (key) {
      case 'green':
        return Colors.green.shade50;
      case 'red':
        return Colors.red.shade50;
      case 'blue':
        return Colors.blue.shade50;
      case 'purple':
        return Colors.purple.shade50;
      case 'slate':
        return Colors.blueGrey.shade50;
      case 'amber':
        return Colors.amber.shade50;
      default:
        return Colors.grey.shade100;
    }
  }

  Color _fg(String key) {
    switch (key) {
      case 'green':
        return Colors.green.shade700;
      case 'red':
        return Colors.red.shade700;
      case 'blue':
        return Colors.blue.shade700;
      case 'purple':
        return Colors.purple.shade700;
      case 'slate':
        return Colors.blueGrey.shade700;
      case 'amber':
        return Colors.amber.shade800;
      default:
        return Colors.grey.shade700;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: _bg(colorKey),
        borderRadius: BorderRadius.circular(999),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: _fg(colorKey),
          fontWeight: FontWeight.w600,
          fontSize: 12,
        ),
      ),
    );
  }
}