import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SummativeDetailShimmer extends StatelessWidget {
  const SummativeDetailShimmer({super.key});

  Widget _box({double? height, double? width, BorderRadius? radius}) {
    return Container(
      height: height ?? 14,
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: radius ?? BorderRadius.circular(8),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Shimmer.fromColors(
          baseColor: Colors.grey.shade300,
          highlightColor: Colors.grey.shade100,
          child: LayoutBuilder(
            builder: (context, constraints) {
              final isWide = constraints.maxWidth > 600;
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // HEADER
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  //   child: Row(
                  //     children: [
                  //       _box(height: 30, width: 80),
                  //       const SizedBox(width: 16),
                  //       Expanded(
                  //         child: Column(
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             _box(width: isWide ? 200 : 120, height: 10),
                  //             const SizedBox(height: 6),
                  //             _box(width: isWide ? 300 : 160, height: 14),
                  //           ],
                  //         ),
                  //       ),
                  //     ],
                  //   ),
                  // ),

                  // MAIN CARD
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        border: Border.all(color: Colors.grey.shade200),
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // TASK SECTION
                          _box(width: isWide ? 180 : 100, height: 12),
                          const SizedBox(height: 12),
                          _box(height: 60),
                          const SizedBox(height: 20),
                          const Divider(color: Color(0xffe2e8f0)),
                          const SizedBox(height: 20),

                          // ASSESSMENT INFO
                          _box(width: isWide ? 200 : 120, height: 14),
                          const SizedBox(height: 20),

                          Flex(
                            direction: isWide ? Axis.horizontal : Axis.vertical,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    _box(width: double.infinity, height: 12),
                                    const SizedBox(height: 10),
                                    _box(width: double.infinity, height: 12),
                                    const SizedBox(height: 10),
                                    _box(width: double.infinity, height: 12),
                                  ],
                                ),
                              ),
                              if (isWide)
                                const SizedBox(width: 24)
                              else
                                const SizedBox(height: 16),
                              Expanded(
                                child: Column(
                                  children: [
                                    _box(width: double.infinity, height: 12),
                                    const SizedBox(height: 10),
                                    _box(width: double.infinity, height: 12),
                                    const SizedBox(height: 10),
                                    _box(width: double.infinity, height: 12),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const Divider(color: Color(0xffe2e8f0)),
                          const SizedBox(height: 20),

                          // FEEDBACK
                          _box(width: isWide ? 180 : 120, height: 14),
                          const SizedBox(height: 12),
                          _box(height: 60),
                          const SizedBox(height: 20),
                          const Divider(color: Color(0xffe2e8f0)),
                          const SizedBox(height: 20),

                          // RUBRIC SECTION
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              _box(width: isWide ? 200 : 150, height: 14),
                              _box(width: 20, height: 20),
                            ],
                          ),
                          const SizedBox(height: 16),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: List.generate(
                              5,
                              (i) => _box(width: isWide ? 90 : 70, height: 20),
                            ),
                          ),
                          const SizedBox(height: 20),
                          const Divider(color: Color(0xffe2e8f0)),
                          const SizedBox(height: 20),

                          // RESOURCES
                          _box(width: isWide ? 200 : 150, height: 14),
                          const SizedBox(height: 12),
                          _box(width: double.infinity, height: 12),
                          const SizedBox(height: 8),
                          _box(width: double.infinity, height: 12),
                          const SizedBox(height: 8),
                          _box(width: double.infinity, height: 12),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
