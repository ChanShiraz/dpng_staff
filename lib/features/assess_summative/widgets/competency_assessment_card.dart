import 'package:flutter/material.dart';

class CompetencyAssessmentCard extends StatelessWidget {
  const CompetencyAssessmentCard({super.key});

  @override
  Widget build(BuildContext context) {
    return _cardWrapper(
      title: "DP Competency Assessment",
      subtitle: "ss09 Impact of Economics",
      details:
          'Understand fundamental economic principles and how they influence political systems and historical events.',
    );
  }

  Widget _cardWrapper({
    required String title,
    required String subtitle,
    required String details,
  }) {
    final List<String> labels = [
      "EMERGING",
      "CAPABLE",
      "BRIDGING",
      "PROFICIENT",
      "ADVANCED",
      "NO EVIDENCE",
      "NOT ASSESSED",
    ];

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 6),
            child: Divider(),
          ),
          // const SizedBox(height: 8),
          Text(subtitle, style: TextStyle(fontWeight: FontWeight.w500)),
          Text(details),
          const SizedBox(height: 12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            children: labels.map((label) {
              final bool selected = label == "PROFICIENT";
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: selected ? Colors.black : Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.black12),
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    color: selected ? Colors.white : Colors.black87,
                    fontSize: 12,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
