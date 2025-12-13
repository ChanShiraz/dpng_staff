import 'dart:math';
import 'package:flutter/material.dart';

class CircularProgress extends StatelessWidget {
  final int percent;
  final Color color;
  final double size;
  final double strokeWidth;

  const CircularProgress({
    super.key,
    required this.percent,
    required this.color,
    this.size = 56,
    this.strokeWidth = 6,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
            ),
          ),
          CustomPaint(
            size: Size(size, size),
            painter: _CirclePainter(
              percent: percent,
              color: color,
              strokeWidth: strokeWidth,
            ),
          ),
          Text(
            "$percent%",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}

class _CirclePainter extends CustomPainter {
  final int percent;
  final Color color;
  final double strokeWidth;

  _CirclePainter({
    required this.percent,
    required this.color,
    required this.strokeWidth,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.width - strokeWidth) / 2;

    final trackPaint = Paint()
      ..color = Colors.grey.shade300
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    final progressPaint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, trackPaint);

    final sweepAngle = 2 * pi * (percent / 100);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -pi / 2,
      sweepAngle,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
