import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';

class RubricExampleSection extends StatelessWidget {
  const RubricExampleSection({super.key});

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Example of Integrated Rubric Language',
            style: TextStyle(fontSize: 16),
          ),
          SizedBox(height: 10),
          Text(
            'Students collaboratively model and solve a real-world task related to "Linear equations systems inequalities". Evidence includes accurate representations (graph/table/equations), a clear solution strategy, and a written justification evaluating the reasonableness of results and limitations of the model.',
          ),
        ],
      ),
    );
  }
}
