import 'package:dpng_staff/features/assess_summative/widgets/competency_assessment_card.dart';
import 'package:dpng_staff/features/assess_summative/widgets/final_submission_card.dart';
import 'package:dpng_staff/features/assess_summative/widgets/history_card.dart';
import 'package:dpng_staff/features/assess_summative/widgets/rubric_notes_card.dart';
import 'package:dpng_staff/features/assess_summative/widgets/state_standard_assessment_card.dart';
import 'package:dpng_staff/features/assess_summative/widgets/student_snapshot_card.dart';
import 'package:dpng_staff/features/assess_summative/widgets/summative_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class AssessSummativePage extends StatelessWidget {
  const AssessSummativePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f8fa),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Breadcrumb Header
              Row(
                children: [
                  IconButton(
                    onPressed: () => Get.back(),
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Assessment Center / Assess Student Summative",
                    style: Theme.of(
                      context,
                    ).textTheme.bodySmall?.copyWith(color: Colors.grey[600]),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Top Summary Row
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(flex: 2, child: _buildLeftContent()),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: const [
                                StudentSnapshotCard(),
                                SizedBox(height: 16),
                                RubricNotesCard(),
                                SizedBox(height: 16),
                                HistoryCard(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLeftContent() {
    return Column(
      children: [
        SummativeWidget(),
        const SizedBox(height: 16),
        const CompetencyAssessmentCard(),
        const SizedBox(height: 16),
        const StateStandardAssessmentCard(),
        const SizedBox(height: 16),
        const FinalSubmissionCard(),
      ],
    );
  }
}
