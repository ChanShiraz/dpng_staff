import 'package:flutter/material.dart';

class SummativeHeader extends StatelessWidget {
  const SummativeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: const BoxDecoration(
          color: Color(0xfff1f5f9),
          border: Border(bottom: BorderSide(color: Color(0xffe2e8f0))),
        ),
        child: Row(
          children: const [
            Expanded(flex: 2, child: Text("Student", style: _header)),
            Expanded(flex: 1, child: Text("Date Assessed", style: _header)),
            Expanded(
              flex: 2,
              child: Text("Summative Assessed", style: _header),
            ),
            Expanded(flex: 1, child: Text("Status", style: _header)),
            Expanded(flex: 1, child: Text("Grade", style: _header)),
            SizedBox(
              width: 40,
              child: Text("Tools", textAlign: TextAlign.right, style: _header),
            ),
          ],
        ),
      ),
    );
  }
}

const TextStyle _header = TextStyle(
  fontSize: 11,
  fontWeight: FontWeight.w600,
  color: Color(0xff64748b),
  letterSpacing: 0.6,
);
