import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/student_summative_work/controller/summative_work_controller.dart';
import 'package:dpng_staff/features/student_summative_work/controller/summative_work_detail_controller.dart';
import 'package:dpng_staff/features/student_summative_work/models/summative_submission.dart';
import 'package:dpng_staff/features/student_summative_work/widgets/assessment_info_section.dart';
import 'package:dpng_staff/features/student_summative_work/widgets/feedback_section.dart';
import 'package:dpng_staff/features/student_summative_work/widgets/resources_section.dart';
import 'package:dpng_staff/features/student_summative_work/widgets/rubric_section.dart';
import 'package:dpng_staff/features/student_summative_work/widgets/summative_details_shimmer.dart';
import 'package:dpng_staff/features/student_summative_work/widgets/task_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class SummativeWorkDetailsPage extends StatefulWidget {
  SummativeWorkDetailsPage({
    super.key,
    required this.subid,
    required this.summativeTitle,
  });
  final int subid;
  final String summativeTitle;
  late SummativeWorkDetailController detailController;

  @override
  State<SummativeWorkDetailsPage> createState() =>
      _SummativeWorkDetailsPageState();
}

class _SummativeWorkDetailsPageState extends State<SummativeWorkDetailsPage> {
  //bool rubricOpen = true;

  final List<String> resources = [
    "Approved Instructional Material",
    "Summative Instruction Video",
    "Cell Summative",
  ];
  @override
  void initState() {
    widget.detailController = Get.put(SummativeWorkDetailController());
    widget.detailController.fetchSummativeSubmission(widget.subid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            TopBar(
              title: 'Summative Assessment',
              subtitle: widget.summativeTitle,
            ),
            Obx(() {
              SummativeSubmission? submission =
                  widget.detailController.submission.value;
              return widget.detailController.fetchingSummative.value
                  ? CircularProgressIndicator()
                  : submission != null
                  ? Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            border: Border.all(color: const Color(0xffe2e8f0)),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 6,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TaskSection(text: submission.task),
                              const _ThinDivider(),
                              AssessmentInfoSection(submission: submission),
                              const _ThinDivider(),
                              FeedbackSection(
                                author: submission.teacherName,
                                feedback: submission.comment,
                              ),
                              const _ThinDivider(),
                              // Rubric and resources share piece of state (rubricOpen)
                              Obx(
                                () => RubricSection(
                                  submission: submission,
                                  summativeDetailController:
                                      widget.detailController,
                                  rubricLevels:
                                      widget.detailController.rubricLevels,
                                  currentRubricLevel: widget
                                      .detailController
                                      .selectedRubric
                                      .value,
                                  //open: rubricOpen,
                                  onToggle: () {},
                                  //setState(() => rubricOpen = !rubricOpen)
                                ),
                              ),
                              ResourcesSection(resources: resources),
                            ],
                          ),
                        ),
                      ),
                    )
                  : SizedBox();
            }),
          ],
        ),
      ),
    );
  }
}

// Simple consistent thin divider used in page
class _ThinDivider extends StatelessWidget {
  const _ThinDivider();

  @override
  Widget build(BuildContext context) {
    return Container(height: 1, color: const Color(0xffe2e8f0));
  }
}
