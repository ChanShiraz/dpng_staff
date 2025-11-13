import 'package:dpng_staff/features/assess_formative/widgets/assessment_tool_card.dart';
import 'package:dpng_staff/features/assess_formative/widgets/formative_card.dart';
import 'package:dpng_staff/features/assess_formative/widgets/formative_list_card.dart';
import 'package:dpng_staff/features/assess_formative/widgets/formative_status_card.dart';
import 'package:dpng_staff/features/assess_formative/widgets/notes_history_section.dart';
import 'package:dpng_staff/features/assess_formative/widgets/topbar.dart';
import 'package:dpng_staff/features/assess_summative/widgets/student_snapshot_card.dart';
import 'package:flutter/material.dart';

class AssessFormativePage extends StatelessWidget {
  const AssessFormativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      body: LayoutBuilder(
        builder: (context, constraints) {
          bool isWide = constraints.maxWidth > 1100;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: isWide
                ? Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Left Column
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Topbar(),
                            SizedBox(height: 16),
                            FormativeCard(),
                            SizedBox(height: 16),
                            FormativeStatusCard(),
                            SizedBox(height: 16),
                            FormativeListCard(),
                            SizedBox(height: 16),
                            AssessmentToolCard(),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Right Column
                      SizedBox(
                        width: 350,
                        child: Column(
                          children: const [
                            StudentSnapshotCard(),
                            SizedBox(height: 16),
                            NotesSection(),
                            SizedBox(height: 16),
                            HistorySection(),
                          ],
                        ),
                      ),
                    ],
                  )
                : Column(
                    children: [
                      Topbar(),
                      SizedBox(height: 20),
                      StudentSnapshotCard(),
                      SizedBox(height: 16),
                      FormativeStatusCard(),
                      SizedBox(height: 16),
                      FormativeListCard(),
                      SizedBox(height: 16),
                      AssessmentToolCard(),
                      SizedBox(height: 16),
                      NotesSection(),
                      SizedBox(height: 16),
                      HistorySection(),
                    ],
                  ),
          );
        },
      ),
    );
  }
}
