import 'package:dpng_staff/features/student_roster/widgets/student_tile.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SummativesShimmer extends StatelessWidget {
  const SummativesShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // LIST ROW SHIMMERS (10 rows)
          ...List.generate(4, (index) {
            final bg = index.isEven ? Colors.white : const Color(0xfff8fafc);
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 3),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xfff8fafc),
                  border: const Border(
                    bottom: BorderSide(color: Color(0xffe2e8f0)),
                  ),
                ),
                child: Row(
                  children: const [
                    Expanded(flex: 2, child: ShimmerBox(width: 80, height: 12)),
                    Expanded(
                      flex: 2,
                      child: ShimmerBox(width: 100, height: 12),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: ShimmerBox(width: 60, height: 12),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
