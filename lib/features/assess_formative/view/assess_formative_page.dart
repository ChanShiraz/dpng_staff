import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/assess_formative/controller/assess_formative_controller.dart';
import 'package:dpng_staff/features/assess_formative/widgets/assessment_tool_card.dart';
import 'package:dpng_staff/features/assess_formative/widgets/formative_card.dart';
import 'package:dpng_staff/features/assess_formative/widgets/formative_list_card.dart';
import 'package:dpng_staff/features/assess_formative/widgets/formative_status_card.dart';
import 'package:dpng_staff/features/assess_formative/widgets/notes_history_section.dart';
import 'package:dpng_staff/features/assess_formative/widgets/topbar.dart';
import 'package:dpng_staff/features/assess_summative/widgets/student_snapshot_card.dart';
import 'package:dpng_staff/features/assessment_center/models/formative_assessment.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';

class AssessFormativePage extends StatefulWidget {
  const AssessFormativePage({super.key, required this.assessment});
  final FormativeAssessment assessment;

  @override
  State<AssessFormativePage> createState() => _AssessFormativePageState();
}

class _AssessFormativePageState extends State<AssessFormativePage> {
  late AssessFormativeController controller;
  @override
  void initState() {
    controller =   Get.put(AssessFormativeController(aCid:widget.assessment.a_cid ));
    controller.fetchPastFormatives(widget.assessment.fsubid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: TopBar(
          title: 'Assessment Center / Assess Student Formative',
          centerTitle: true,
        ),
      ),
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
                            // Topbar(),
                            SizedBox(height: 10),
                            FormativeCard(assessment: widget.assessment),
                            SizedBox(height: 16),
                            FormativeStatusCard(),
                            SizedBox(height: 16),
                            FormativeListCard(),
                            SizedBox(height: 16),
                            AssessmentToolCard(
                              fsubid: widget.assessment.fsubid,
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 16),

                      // Right Column
                      SizedBox(
                        width: 350,
                        child: Column(
                          children: [
                            //StudentSnapshotCard(),
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
                      //StudentSnapshotCard(),
                      SizedBox(height: 16),
                      FormativeStatusCard(),
                      SizedBox(height: 16),
                      FormativeListCard(),
                      SizedBox(height: 16),
                      AssessmentToolCard(fsubid: widget.assessment.fsubid),
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
