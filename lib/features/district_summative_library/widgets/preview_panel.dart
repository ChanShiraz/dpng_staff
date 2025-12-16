import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import '../models/summative_model.dart';
import 'tag_chip.dart';

class PreviewPanel extends StatelessWidget {
  final SummativeModel? summative;
  const PreviewPanel({super.key, required this.summative});

  @override
  Widget build(BuildContext context) {
    if (summative == null) {
      return const Center(
        child: Text(
          "Select a summative to preview details",
          style: TextStyle(color: Colors.grey),
        ),
      );
    }

    final item = summative!;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RoundContainer(
          color: Colors.white,
          circular: 20,
          //  margin: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
          padding: 20,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Summative Viewer',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              ),
              Text(
                item.title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                item.subject,
                style: const TextStyle(fontSize: 13, color: Colors.grey),
              ),
              // const SizedBox(height: 8),
              // Text(
              //   'By ${item.author}',
              //   style: const TextStyle(fontSize: 12, color: Colors.grey),
              // ),
              // const SizedBox(height: 16),

              // // Description
              // const Text("Description", style: TextStyle(color: Colors.black54)),
              // const SizedBox(height: 6),
              // Text(item.description, style: const TextStyle(fontSize: 13)),
              const SizedBox(height: 16),
              // Competencies
              const Text(
                "Competencies",
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 6),
              Wrap(
                children: item.competencies
                    .map(
                      (e) => TagChip(
                        e,
                        showBorder: true,
                        borderColor: Colors.grey.shade300,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),

              // Standards
              const Text("Standards", style: TextStyle(color: Colors.black54)),
              const SizedBox(height: 6),
              Wrap(
                children: item.standards
                    .map(
                      (e) => TagChip(
                        e,
                        color: Colors.blue.shade50,
                        textColor: Colors.blue,
                        showBorder: true,
                        borderColor: Colors.blue.shade300,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 16),
              Text('Rubric', style: TextStyle(color: Colors.black45)),
              const SizedBox(height: 16),
              RubricRow(),
              const SizedBox(height: 16),
              ScaffoldingTextWidget(
                leading: Icons.square_outlined,
                title: 'Scaffolding Rubric',
                description:
                    'Claim: Focus arguable claim that frames reasoning.',
              ),
              const SizedBox(height: 16),
              ScaffoldingTextWidget(
                leading: Icons.sort,
                title: 'Scaffolded Rubric',
                description: '''This is the scaffolded rubric.
      Try this scaffolded task:
      Strengthen your claim by making it arguable and precise.
      Integrate evidence smoothly (introduce, cite, explain).
      Add reasoning that connects evidence to claim using cause/effect on
      Focus area:
      Claim: Focused, arguable claim that frames reasoning.''',
              ),
              // Example
              // const Text("Example", style: TextStyle(color: Colors.black54)),
              // const SizedBox(height: 6),
              // Text(item.example, style: const TextStyle(fontSize: 13)),
              // const Spacer(),

              // Buttons
              SizedBox(height: 20),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    child: const Text("Open Full Preview"),
                  ),
                  const SizedBox(width: 8),
                  OutlinedButton(
                    onPressed: () {},
                    child: const Text("Copy Link"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScaffoldingTextWidget extends StatelessWidget {
  const ScaffoldingTextWidget({
    super.key,
    required this.description,
    required this.leading,
    required this.title,
  });
  final IconData leading;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              child: Icon(leading, color: Colors.indigo),
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(10),
          //height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue.shade50,
            border: Border.all(color: Colors.blue.shade300),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class RubricRow extends StatelessWidget {
  const RubricRow({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: const [
          RubricItem(
            title: 'Emerging',
            subtitle: 'Awareness,\nRemember',
            score: '1',
            color: Color(0xFFF2994A),
          ),
          SizedBox(width: 14),

          RubricItem(
            title: 'Capable',
            subtitle: 'Understand',
            score: '2',
            color: Color(0xFF56CCF2),
          ),
          SizedBox(width: 14),

          RubricItem(
            title: 'Bridging',
            subtitle: 'Practice, Apply',
            score: '3',
            color: Color(0xFFBB6BD9),
          ),
          SizedBox(width: 14),

          RubricItem(
            title: 'Proficient',
            subtitle: 'Analyze, Choices',
            score: '4',
            color: Color(0xFF2F80ED),
          ),
          SizedBox(width: 14),

          RubricItem(
            title: 'Metacognition',
            subtitle: 'Reflect',
            score: '5',
            color: Color(0xFF27AE60),
          ),
        ],
      ),
    );
  }
}

class RubricItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final String score;
  final Color color;

  const RubricItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.score,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.08),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.35), width: 1.5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: color,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            subtitle,
            style: TextStyle(fontSize: 12, color: color.withOpacity(0.85)),
          ),
          const SizedBox(height: 10),
          Text(
            score,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
