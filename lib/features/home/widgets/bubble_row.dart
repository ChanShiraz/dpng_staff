import 'package:dpng_staff/features/home/models/summative_bubble_counts.dart';
import 'package:flutter/material.dart';

class BubbleRow extends StatelessWidget {
  final String label;
  final SummativeBubbleCounts bubbleCounts;

  const BubbleRow({super.key, required this.label, required this.bubbleCounts});

  Widget _bubble(Color color, String text) {
    return Container(
      width: 24,
      height: 24,
      alignment: Alignment.center,
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 10,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
        ),
        SizedBox(width: 5),
        Row(
          children: [
            _bubble(Colors.green, bubbleCounts.greenCount.toString()),
            const SizedBox(width: 4),
            _bubble(Colors.blue, bubbleCounts.blueCount.toString()),
            const SizedBox(width: 4),
            _bubble(Colors.orange, bubbleCounts.orangeCount.toString()),
            const SizedBox(width: 4),
            _bubble(Colors.red, bubbleCounts.redCount.toString()),
            const SizedBox(width: 4),
            _bubble(Colors.grey, bubbleCounts.grayCount.toString()),
          ],
        ),
      ],
    );
  }
}
