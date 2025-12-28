import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/assess_summative/controller/assess_summative_controller.dart';
import 'package:dpng_staff/features/assess_summative/widgets/competency_assessment_card.dart';
import 'package:dpng_staff/features/assess_summative/widgets/final_submission_card.dart';
import 'package:dpng_staff/features/assess_summative/widgets/history_card.dart';
import 'package:dpng_staff/features/assess_summative/widgets/rubric_notes_card.dart';
import 'package:dpng_staff/features/assess_summative/widgets/state_standard_assessment_card.dart';
import 'package:dpng_staff/features/assess_summative/widgets/student_snapshot_card.dart';
import 'package:dpng_staff/features/assess_summative/widgets/summative_widget.dart';
import 'package:dpng_staff/features/assessment_center/models/summative_assessment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';

class AssessSummativePage extends StatefulWidget {
  const AssessSummativePage({super.key, required this.summativeAssessment});
  final SummativeAssessment summativeAssessment;

  @override
  State<AssessSummativePage> createState() => _AssessSummativePageState();
}

class _AssessSummativePageState extends State<AssessSummativePage> {
  late AssessSummativeController  controller;
  @override
  void initState() {
    controller = Get.put(AssessSummativeController(a_cid: widget.summativeAssessment.a_cid));
    controller.fetchPastSummatives(widget.summativeAssessment.subid);
    controller.fetchCompetencies(widget.summativeAssessment.drlid);
    if (widget.summativeAssessment.ccid == 4) {
      controller.fetchScienceStandards(widget.summativeAssessment.drlid);
    } else {
      controller.fetchStandards(widget.summativeAssessment.drlid);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff7f8fa),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: TopBar(
          title: 'Assessment Center / Assess Student Summative',
          centerTitle: true,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: _buildLeftContent(
                              widget.summativeAssessment,
                            ),
                          ),
                          const SizedBox(width: 20),
                          Expanded(
                            flex: 1,
                            child: Column(
                              children: [
                                StudentSnapshotCard(
                                  summative: widget.summativeAssessment,
                                ),
                                SizedBox(height: 16),
                                RubricNotesCard(),
                                SizedBox(height: 16),
                                Obx(() {
                                  if (controller.fetchingPastSummatives.value) {
                                    return SizedBox();
                                  }
                                  if (controller
                                      .fetchPastSummativesError
                                      .isNotEmpty) {
                                    return HistoryCard(
                                      error: true,
                                      subid: widget.summativeAssessment.subid,
                                    );
                                  }
                                  if (controller.pastSummatives.isEmpty) {
                                    return SizedBox();
                                  }
                                  return HistoryCard(
                                    subid: widget.summativeAssessment.subid,
                                  );
                                }),
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

  Widget _buildLeftContent(SummativeAssessment summative) {
    return Column(
      children: [
        SummativeWidget(summative: summative),
        const SizedBox(height: 16),
        CompetencyAssessmentCard(drlid: summative.drlid),
        const SizedBox(height: 16),
        StateStandardAssessmentCard(
          drlid: summative.drlid,
          ccid: summative.ccid,
        ),
        const SizedBox(height: 16),
        FinalSubmissionCard(summative: summative),
      ],
    );
  }
}
