import 'dart:ui';

import 'package:flutter/material.dart';

Widget roundIconButton(IconData icon, VoidCallback onPress) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffe2e8f0)),
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: IconButton(
        icon: Icon(icon, size: 16),
        color: const Color(0xff64748b),
        onPressed: onPress,
      ),
    );
  }