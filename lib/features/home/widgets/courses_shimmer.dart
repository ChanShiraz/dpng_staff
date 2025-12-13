import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CourseCardShimmer extends StatelessWidget {
  const CourseCardShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Container(
        width: 320,
        height: 120,
        margin: const EdgeInsets.only(right: 16),
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(14),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 22, width: 160, color: Colors.white),
            const SizedBox(height: 12),
            Container(height: 14, width: 100, color: Colors.white),
          ],
        ),
      ),
    );
  }
}

class CourseCarouselShimmer extends StatelessWidget {
  const CourseCarouselShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 5,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        itemBuilder: (context, index) {
          return const CourseCardShimmer();
        },
      ),
    );
  }
}
