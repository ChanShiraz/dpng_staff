import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:dpng_staff/features/summative_creation/controller/summative_creation_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Step5RubricLevels extends StatelessWidget {
  final RubricController c = Get.find<RubricController>();

  Step5RubricLevels({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RoundContainer(
                    child: ExpansionTile(
                      shape: Border(),
                      title: Text('m01: Problem Solving'),
                      children: [
                        Divider(color: Colors.grey.shade300),
                        Text(
                          '''Description: Make sense of problems and persevere in solving them.
Example: Solve a multi-step modeling task; include a brief reflection on why your approach is reasonable.''',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  RoundContainer(
                    child: ExpansionTile(
                      shape: Border(),
                      title: Text('m01: Problem Solving'),
                      children: [
                        Divider(color: Colors.grey.shade300),
                        Text(
                          '''Description: Make sense of problems and persevere in solving them.
Example: Solve a multi-step modeling task; include a brief reflection on why your approach is reasonable.''',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Click any therm to view its cletails Multiple themes can be open at soce.',
                    style: TextStyle(color: Colors.black54),
                  ),
                ],
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              flex: 1,
              child: RoundContainer(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Example of Integrated Rubric Language',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Text('COMPETENCY-LEVEL ALIGNMENT BREAKDOWN'),
                    SizedBox(height: 10),
                    Text(
                      '''opinion, fact, and perspective. These levels focus on developing foundational understanding and may include teacher support to identify an author's voice and bias, connecting to the influence on the writer's side,
Level 4: Extend analysis to how those biases shape meaning and credibility-applying the competency through interpretation of external contexts such as social, cultural, political, and historical factors.
Level 5 (Metacognition): Move inward by recognizing that readers, too, are influenced by individual, social, cultural, political, and historical contexts-just like the author. Reflection on personal bias completes the circle of understanding between reader and writer influence, fully realizing the competency.''',
                    ),
                    SizedBox(height: 10),
                    Text(
                      'WHY THIS COMPETENCY MATTERS:',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Recognizing bias and author voice reflects a critical mindset toward reading. It develops proficiency in ELA by helping students examine how perspective and context shape meaning, credibility, and intent, while also becoming aware of their own interpretive stance.',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: _levelChips(),
        ),
        RoundContainer(
          color: Colors.green.shade50,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text('Proficient'),
              ),
              TextField(
                minLines: 3,
                maxLines: null,
                decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  hintText:
                      'Describe what quality evidence looks like at this level.',
                  hintStyle: TextStyle(color: Colors.black54),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Tip: referance specific artifacts',
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: 10),
        RoundContainer(
          padding: 0,
          child: ListTile(
            leading: Icon(Icons.lock_outline),
            title: Text(
              'Complete all levels to enable preview and submission.',
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                OutlinedButton(onPressed: () {}, child: Text('Save Draft')),
                SizedBox(width: 10),
                OutlinedButton(onPressed: null, child: Text('Preview')),
                SizedBox(width: 10),
                ElevatedButton(onPressed: null, child: Text('Submit Rubric')),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class RoundContainer extends StatelessWidget {
  const RoundContainer({
    super.key,
    required this.child,
    this.color,
    this.padding = 10,
  });
  final Widget child;
  final Color? color;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(padding),
      decoration: BoxDecoration(
        color: color,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }
}

Widget _levelChips() {
  final levels = [
    "Emerging",
    "Capable",
    "Bridging",
    "Proficient",
    "Metacognition",
  ];
  return Wrap(
    spacing: 8,
    runSpacing: 8,
    children: levels.map((lvl) {
      final colors = levelColors(lvl);
      //final selected = lvl == activeLevel;
      return ChoiceChip(
        label: Text(lvl, style: TextStyle(color: colors['text'])),
        selected: false,
        //onSelected: (_) => onLevelSelect(lvl),
        selectedColor: colors['bg'],
        backgroundColor: Colors.white,
      );
    }).toList(),
  );
}
