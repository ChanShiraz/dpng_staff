import 'package:flutter/material.dart';

class DCardHeader extends StatelessWidget {
  final Widget title;
  final String? subtitle;
  final Widget? action;
  const DCardHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            DefaultTextStyle(
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              child: title,
            ),
            if (subtitle != null) SizedBox(height: 6),
            if (subtitle != null)
              Text(
                subtitle!,
                style: TextStyle(fontSize: 13, color: Colors.grey[600]),
              ),
          ],
        ),
        if (action != null) action!,
      ],
    );
  }
}