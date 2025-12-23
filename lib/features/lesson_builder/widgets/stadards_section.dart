import 'package:dpng_staff/features/%20district_rubric_library/models/competency.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';

class StadardsSection extends StatelessWidget {
  const StadardsSection({
    super.key,
    required this.standards,
    required this.competencies,
  });
  final List<String> standards;
  final List<Competency> competencies;

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      padding: 20,
      color: Color(0xfff3f5fe),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Standards & competencies',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
                Text(
                  'Inherited from the summative assessment. (Read-only)',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Divider(),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: standards.length,
            itemBuilder: (context, index) {
              return CompetencyText(text: standards[index]);
            },
          ),
          SizedBox(height: 10),
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: competencies.length,
            itemBuilder: (context, index) {
              return CompetencyText(
                text:
                    '${competencies[index].dpc_label}: ${competencies[index].dpc_heading}',
              );
            },
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class CompetencyText extends StatelessWidget {
  const CompetencyText({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(text),
    );
  }
}
