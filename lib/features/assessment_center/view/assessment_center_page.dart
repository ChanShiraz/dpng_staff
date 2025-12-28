import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/assessment_center/controller/assessment_center_controller.dart';
import 'package:dpng_staff/features/assessment_center/models/summative_assessment.dart';
import 'package:dpng_staff/features/assessment_center/widgets/pending_formative_list.dart';
import 'package:dpng_staff/features/assessment_center/widgets/pending_summative_list.dart';
import 'package:dpng_staff/features/assessment_center/widgets/pending_toggle.dart';
import 'package:dpng_staff/features/assessment_center/widgets/quick_filters.dart';
import 'package:dpng_staff/features/assessment_center/widgets/sidebar_panels.dart';
import 'package:dpng_staff/features/assessment_center/widgets/stats_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class AssessmentCenterPage extends StatefulWidget {
  const AssessmentCenterPage({super.key, this.formatives});
  final bool? formatives;

  @override
  State<AssessmentCenterPage> createState() => _AssessmentCenterPageState();
}

class _AssessmentCenterPageState extends State<AssessmentCenterPage> {
  final controller = Get.put(AssessmentCenterController());
  @override
  void initState() {
    //controller.fetchSummativeAssessments();
    if (widget.formatives != null) {
      controller.selected.value = 'Formatives';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final isWide = width >= 1100;
        final isMedium = width >= 800 && width < 1100;

        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: TopBar(title: 'Assessment Center', centerTitle: true),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Main content
                  Expanded(
                    flex: isWide ? 3 : 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Row(
                        //   children: [
                        //     IconButton(
                        //       onPressed: () => Get.back(),
                        //       icon: Icon(Icons.arrow_back_ios_new_rounded),
                        //     ),
                        //     const Text(
                        //       'Assessment Center',
                        //       style: TextStyle(
                        //         fontSize: 20,
                        //         fontWeight: FontWeight.w700,
                        //       ),
                        //     ),
                        //   ],
                        // ),

                        // const SizedBox(height: 18),
                        // const StatsHeader(),
                        const SizedBox(height: 18),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Left big column
                            Expanded(
                              flex: 3,
                              child: Column(
                                children: [
                                  const SizedBox(height: 8),

                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.grey.shade300,
                                          borderRadius: BorderRadius.circular(
                                            20,
                                          ),
                                        ),
                                        child: Obx(
                                          () =>
                                              // ToggleButtons(
                                              //   borderWidth: 0,
                                              //   isSelected: [
                                              //     controller
                                              //             .selectedToggleIndex
                                              //             .value ==
                                              //         0,
                                              //     controller
                                              //             .selectedToggleIndex
                                              //             .value ==
                                              //         1,
                                              //   ],
                                              //   onPressed: (i) {
                                              //     controller.onTogglePressed(i);
                                              //   },
                                              //   borderRadius: BorderRadius.circular(
                                              //     20,
                                              //   ),
                                              //   selectedColor: Colors.black,
                                              //   fillColor: Colors.white,
                                              //   children: const [
                                              //     Padding(
                                              //       padding: EdgeInsets.symmetric(
                                              //         horizontal: 14,
                                              //         vertical: 8,
                                              //       ),
                                              //       child: Text(
                                              //         'Pending Summatives',
                                              //       ),
                                              //     ),
                                              //     Padding(
                                              //       padding: EdgeInsets.symmetric(
                                              //         horizontal: 14,
                                              //         vertical: 8,
                                              //       ),
                                              //       child: Text(
                                              //         'Pending Formatives',
                                              //       ),
                                              //     ),
                                              //   ],
                                              // ),
                                              PendingToggle(
                                                selectedTrack:
                                                    controller.selected.value,
                                                onChanged: (value) {
                                                  controller.selected.value =
                                                      value;
                                                },
                                              ),
                                        ),
                                      ),
                                      const Spacer(),
                                      ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.sort),
                                        label: const Text('Sort'),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          elevation: 0,
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black87,
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      ElevatedButton.icon(
                                        onPressed: () {},
                                        icon: const Icon(Icons.filter_list),
                                        label: const Text('Filter'),
                                        style: ElevatedButton.styleFrom(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(
                                              8,
                                            ),
                                          ),
                                          elevation: 0,
                                          backgroundColor: Colors.white,
                                          foregroundColor: Colors.black87,
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 12),
                                  Obx(
                                    () =>
                                        controller.selected.value.contains(
                                          'Summatives',
                                        )
                                        ? PendingSummativeList()
                                        : PendingFormativeList(),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                            // Right narrow column (if wide show sidebar)
                            if (isWide) ...[
                              Expanded(
                                flex: 1,
                                child: Column(
                                  crossAxisAlignment:
                                      CrossAxisAlignment.stretch,
                                  children: const [
                                    QuickFiltersPanel(),
                                    SizedBox(height: 12),
                                    CalendarPanel(),
                                    SizedBox(height: 12),
                                    MessagesPanel(),
                                  ],
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),

                  // When not wide, show a floating right panel button to open drawer or show nothing.
                  if (!isWide) const SizedBox(width: 0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
