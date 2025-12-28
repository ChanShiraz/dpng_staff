import 'package:flutter/material.dart';

class PendingToggle extends StatelessWidget {
  final String selectedTrack;
  final ValueChanged<String> onChanged;

  const PendingToggle({
    super.key,
    required this.selectedTrack,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: Colors.grey.shade300),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 6),
        ],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [_toggleButton("Summatives"), _toggleButton("Formatives")],
      ),
    );
  }

  Widget _toggleButton(String value) {
    final bool isActive = selectedTrack == value;

    return GestureDetector(
      onTap: () => onChanged(value),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        decoration: BoxDecoration(
          color: isActive ? Colors.blue.shade600 : Colors.transparent,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Text(
          "Pending $value",
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.white : Colors.blue.shade600,
          ),
        ),
      ),
    );
  }
}
