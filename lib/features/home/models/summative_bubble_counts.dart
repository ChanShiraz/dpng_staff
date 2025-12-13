class SummativeBubbleCounts {
  final int greenCount;
  final int blueCount;
  final int orangeCount;
  final int redCount;
  final int grayCount;

  SummativeBubbleCounts({
    required this.greenCount,
    required this.blueCount,
    required this.orangeCount,
    required this.redCount,
    required this.grayCount,
  });

  factory SummativeBubbleCounts.fromJson(Map<String, dynamic> json) {
    return SummativeBubbleCounts(
      greenCount: json['green_count'] ?? 0,
      blueCount: json['blue_count'] ?? 0,
      orangeCount: json['orange_count'] ?? 0,
      redCount: json['red_count'] ?? 0,
      grayCount: json['gray_count'] ?? 0,
    );
  }
}
