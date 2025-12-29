import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/summative_creation/models/rubric.dart';
import 'package:flutter/material.dart';

class CompetencyStandardsSection extends StatelessWidget {
  const CompetencyStandardsSection({super.key, required this.selectedRubric});
  final SummativeRubric selectedRubric;

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Competency & Standard (from step 2)',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          ...selectedRubric.competency.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: RichText(
                text: TextSpan(
                  style: DefaultTextStyle.of(
                    context,
                  ).style.copyWith(fontSize: 14),
                  children: [
                    TextSpan(
                      text: '𖧹 ${e.dpc_label} ${e.dpc_heading} ',
                      style: const TextStyle(),
                    ),
                    TextSpan(
                      text: e.dpc_description,
                      style: TextStyle(
                        color: Colors.grey.shade600,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          if (selectedRubric.scienceStandard != null)
            ...selectedRubric.scienceStandard!.map(
              (e) => Text('𖧹 ${e.label}'),
            ),
          if (selectedRubric.nonScienceStandard != null)
            ...selectedRubric.nonScienceStandard!.map(
              (e) => Text('𖧹 ${e.standard_label}'),
            ),
        ],
      ),
    );
  }
}
