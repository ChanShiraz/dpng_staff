import 'package:flutter/material.dart';

class DateField extends StatelessWidget {
  const DateField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 38,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffe2e8f0)),
        borderRadius: BorderRadius.circular(8),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "dd/mm/yyyy",
              style: TextStyle(fontSize: 13, color: Color(0xff94a3b8)),
            ),
            Icon(Icons.calendar_today, size: 16, color: Color(0xff94a3b8)),
          ],
        ),
      ),
    );
  }
}
