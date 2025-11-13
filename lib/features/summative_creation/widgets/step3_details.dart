import 'package:flutter/material.dart';
import 'section_card.dart';

class Step3Details extends StatelessWidget {
  final int? openStep;
  final Map<String, dynamic> selectedRubric;
  final String title;
  final String deliverable;
  final String courseAssoc;
  final String scaffoldText;
  final String activeLevel;
  final Function(String) onTitleChange;
  final Function(String) onDeliverableChange;
  final Function(String) onCourseChange;
  final Function(String) onScaffoldChange;
  final Function(String) onLevelSelect;
  final bool step2Complete;
  final bool step3Ready;
  final Map<String, Color> Function(String) levelColors;

  const Step3Details({
    super.key,
    required this.openStep,
    required this.selectedRubric,
    required this.title,
    required this.deliverable,
    required this.courseAssoc,
    required this.scaffoldText,
    required this.activeLevel,
    required this.onTitleChange,
    required this.onDeliverableChange,
    required this.onCourseChange,
    required this.onScaffoldChange,
    required this.onLevelSelect,
    required this.step2Complete,
    required this.step3Ready,
    required this.levelColors,
  });

  @override
  Widget build(BuildContext context) {
    return SectionCard(
      index: 3,
      title: "Step 3 — Finalize Summative Details",
      subtitle:
          "Title, deliverable, course association, scaffolded rubric text.",
      locked: !step2Complete,
      completed: step3Ready,
      // isOpen: openStep == 3,
      // onToggle: () {},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Divider(),
          SizedBox(height: 15),
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black12),
              borderRadius: BorderRadius.circular(10),
            ),
            child: _textFieldRow(),
          ),
          const SizedBox(height: 16),
          _levelChips(),
          const SizedBox(height: 16),
          _rubricInfo(),
          const SizedBox(height: 16),
          _scaffoldEntry(),
          const SizedBox(height: 16),
          _footerButtons(),
        ],
      ),
    );
  }

  Widget _textFieldRow() {
    return Row(
      children: [
        Expanded(child: _input("Title", '', title, onTitleChange)),
        const SizedBox(width: 8),
        Expanded(
          child: _input(
            "Deliverable",
            'e.g. Collaborative investigation + written analysis',
            deliverable,
            onDeliverableChange,
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: _input(
            "Common Course Association",
            'e.g. Math1, Unit 3, Module M01',
            courseAssoc,
            onCourseChange,
          ),
        ),
      ],
    );
  }

  Widget _input(
    String label,
    String hint,
    String value,
    Function(String) onChange,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: TextStyle(color: Colors.black54)),
        SizedBox(height: 5),
        TextField(
          decoration: InputDecoration(
            hint: Text(hint, style: TextStyle(color: Colors.black54)),
            border: const OutlineInputBorder(),
            isDense: true,
          ),
          controller: TextEditingController(text: value),
          onChanged: onChange,
        ),
      ],
    );
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
        final selected = lvl == activeLevel;
        return ChoiceChip(
          label: Text(lvl, style: TextStyle(color: colors['text'])),
          selected: selected,
          onSelected: (_) => onLevelSelect(lvl),
          selectedColor: colors['bg'],
          backgroundColor: Colors.white,
        );
      }).toList(),
    );
  }

  Widget _rubricInfo() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: selectedRubric.isNotEmpty
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${selectedRubric['competency']['code']} — ${selectedRubric['competency']['desc']}",
                        style: const TextStyle(fontWeight: FontWeight.w500),
                      ),
                      SizedBox(height: 5),
                      ...List.generate(
                        (selectedRubric['standards'] as List).length,
                        (i) => Text(
                          selectedRubric['standards'][i],
                          style: const TextStyle(fontSize: 12),
                        ),
                      ),
                    ],
                  )
                : const Text("Select a rubric in Step 2 to display details."),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Example of Integrated Rubric Language',
                  style: TextStyle(fontWeight: FontWeight.w500),
                ),
                SizedBox(height: 5),
                Text(
                  selectedRubric.isNotEmpty
                      ? "Students collaboratively model and solve a real-world task related to “${selectedRubric['summary']}”."
                      : "Choose a rubric in Step 2 to auto-generate example language.",
                  style: const TextStyle(fontSize: 13),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _scaffoldEntry() {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Enter Scaffolding Rubric",
            style: TextStyle(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Teacher Notes',
                      style: TextStyle(color: Colors.black54),
                    ),
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        'Use the descriptors above to craft task-specific success criteria (what "good" looks like). Include sample evidence artifacts (e.g., graphs, solution tables, error analysis) aligned to each level.',
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 10),

              Expanded(
                flex: 1,
                child: TextField(
                  maxLines: 6,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter task-specific success criteria...",
                  ),
                  controller: TextEditingController(text: scaffoldText),
                  onChanged: onScaffoldChange,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _footerButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              step3Ready ? Icons.check_circle : Icons.lock,
              color: step3Ready ? Colors.green : Colors.grey,
            ),
            const SizedBox(width: 8),
            Text(
              step3Ready
                  ? "Ready to submit."
                  : "Fill in all fields to enable submission.",
            ),
          ],
        ),
        Row(
          children: [
            OutlinedButton(onPressed: () {}, child: const Text("Save Draft")),
            const SizedBox(width: 8),
            ElevatedButton(
              onPressed: step3Ready ? () {} : null,
              style: ElevatedButton.styleFrom(
                backgroundColor: step3Ready
                    ? Colors.green
                    : Colors.grey.shade400,
              ),
              child: const Text("Submit Summative"),
            ),
          ],
        ),
      ],
    );
  }
}
