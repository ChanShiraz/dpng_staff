import 'package:flutter/material.dart';

class ToolsButtons extends StatelessWidget {
  const ToolsButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _toolIcon(Icons.person),
          const SizedBox(width: 6),
          _toolIcon(Icons.assignment),
          const SizedBox(width: 6),
          _toolIcon(Icons.edit),
        ],
      ),
    );
  }

  Widget _toolIcon(IconData icon) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: const Color(0xff0e5fe3),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Icon(icon, color: Colors.white, size: 18),
    );
  }
}
