import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/course_summative_assignment/controller/assign_course_summative_controller.dart';
import 'package:dpng_staff/features/course_summative_assignment/widgets/assign_summative_list.dart';
import 'package:dpng_staff/features/district_summative_library/controller/dis_summative_lib_controller.dart';
import 'package:dpng_staff/features/district_summative_library/view/district_summative_library_page.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/button_shadow.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/summative_card.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/summative_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class CourseSummativeAssignmentPage extends StatefulWidget {
  const CourseSummativeAssignmentPage({super.key, required this.courseId});
  final int courseId;

  @override
  State<CourseSummativeAssignmentPage> createState() =>
      _CourseSummativeAssignmentPage();
}

class _CourseSummativeAssignmentPage
    extends State<CourseSummativeAssignmentPage> {
  final controller = Get.put(AssignCourseSummativeController());
  @override
  void initState() {
    controller.fetchSummatives();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      body: SafeArea(
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  TopBar(
                    title: 'Assign ISL Summative -- Multi Select',
                    type: 2,

                    //subtitle: 'Browse, filter, and preview summatives…',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Material(
                            borderRadius: BorderRadius.circular(15),
                            //elevation: 1,
                            child: TextField(
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search, size: 20),
                                hintText:
                                    'Search by title, subject, or standard...',
                                filled: true,
                                fillColor: Colors.white,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        FilterWidget(
                          title: 'Courses',
                          leading: Icons.filter_alt_outlined,
                          trailing: Icons.keyboard_arrow_down_sharp,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Obx(
                            () => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(100, 50),
                                backgroundColor: Colors.white,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: controller.selectedSummatives.isEmpty
                                  ? null
                                  : () {
                                      controller.clearSelectedSummatives();
                                    },
                              child: Text(
                                'Clear',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Obx(
                            () => ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(100, 50),
                                backgroundColor: Colors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                              ),
                              onPressed: controller.selectedSummatives.isEmpty
                                  ? null
                                  : () async {
                                      await controller.assignCourseSummative(
                                        widget.courseId,
                                      );
                                      showDesktopToast(
                                        context,
                                        'Summative assigned',
                                      );
                                      Get.back();
                                    },
                              child: Obx(
                                () => controller.assigningSummatives.value
                                    ? Padding(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 45,
                                        ),
                                        child: SizedBox(
                                          height: 20,
                                          width: 20,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 3,
                                            color: Colors.white,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        'Assign Selected',
                                        style: TextStyle(),
                                      ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Row(
                      children: [
                        Expanded(
                          flex: 2,
                          child: AssignSummativeList(
                            controller: controller,
                            // items: items,
                            // onSelect: (s) {
                            //   // setState(() => selected = s);
                            //   //controller.selectSummative(s);
                            // },
                            // selected: controller.selectedSummative.co,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
