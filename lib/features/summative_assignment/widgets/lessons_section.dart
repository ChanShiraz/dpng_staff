import 'package:dpng_staff/features/summative_assignment/widgets/datefield.dart';
import 'package:dpng_staff/features/summative_assignment/widgets/summative_section.dart';
import 'package:flutter/material.dart';

class LessonsSection extends StatelessWidget {
  const LessonsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final lessons = [
      "Presidential Powers",
      "Eisenhower's Presidency",
      "Ike & Presidential Powers",
      "Presidential Powers Today",
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          HeaderRow(
            titles: const [
              "Lesson Order",
              "Lesson Title",
              "Objective",
              "Due Date",
            ],
            flexes: [1, 3, 5, 1],
          ),
          Column(
            children: List.generate(lessons.length, (index) {
              return Container(
                decoration: BoxDecoration(
                  borderRadius: index == lessons.length - 1
                      ? BorderRadius.circular(20)
                      : null,
                  border: Border(
                    bottom: BorderSide(width: 1.5, color: Colors.grey.shade200),
                  ),
                  color: index.isOdd ? const Color(0xfff8fafc) : null,
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 14,
                ),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Text(
                        "${index + 1}",
                        style: const TextStyle(color: Color(0xff64748b)),
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        lessons[index],
                        style: const TextStyle(
                          color: Color(0xff16a34a),
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 5,
                      child: Text(
                        "Lesson objective description goes here...",
                        style: TextStyle(
                          color: Color(0xff16a34a),
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ),
                    const Expanded(
                      flex: 1,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: DateField(),
                      ),
                    ),
                  ],
                ),
              );
            }),
          ),
        ],
      ),
    );
  }
}
