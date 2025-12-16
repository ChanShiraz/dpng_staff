import 'package:dpng_staff/features/course/model/summative.dart';
import 'package:dpng_staff/features/summative_assignment/widgets/lessons_section.dart';
import 'package:dpng_staff/features/summative_assignment/widgets/students_section.dart';
import 'package:dpng_staff/features/summative_assignment/widgets/summative_section.dart';
import 'package:flutter/material.dart';

class AssignDueDatesCard extends StatelessWidget {
  const AssignDueDatesCard({super.key, required this.summative});
  final Summative summative;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xffe2e8f0)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _PageIntro(),
            Divider(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'ASSIGN SUMMATIVE DUE DATE',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            SummativeSection(summative: summative),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: _DividerBand(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'ASSIGN LESSON(S) DUE DATE',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            LessonsSection(),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: _DividerBand(),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: Text(
                'ASSIGN STUDENTS',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
              ),
            ),
            StudentsSection(),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class _PageIntro extends StatelessWidget {
  const _PageIntro();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Assign Due Dates Dashboard",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 4),
          Text(
            "Set due dates and choose assigned students from one consolidated view.",
            style: TextStyle(color: Color(0xff94a3b8), fontSize: 12),
          ),
        ],
      ),
    );
  }
}

class _DividerBand extends StatelessWidget {
  const _DividerBand();

  @override
  Widget build(BuildContext context) {
    return Container(height: 16, color: const Color(0xfff8fafc));
  }
}
