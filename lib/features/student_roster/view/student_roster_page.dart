import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/assess_formative/widgets/topbar.dart';
import 'package:dpng_staff/features/student_roster/controllers/student_roaster_controller.dart';
import 'package:dpng_staff/features/student_roster/widgets/roster_search_filter_bar.dart';
import 'package:dpng_staff/features/student_roster/widgets/roster_table.dart';
import 'package:dpng_staff/features/student_roster/widgets/student_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StudentRosterPage extends StatefulWidget {
  const StudentRosterPage({super.key});

  @override
  State<StudentRosterPage> createState() => _StudentRosterPageState();
}

class _StudentRosterPageState extends State<StudentRosterPage> {
  late StudentRoasterController studentRoasterController;

  @override
  void initState() {
    studentRoasterController = Get.put(StudentRoasterController());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc),
      body: SafeArea(
        child: Column(
          children: [
            TopBar(title: 'All Course Rosters', subtitle: 'Students / Rosters'),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Description Text
                      const Text(
                        "View and manage student rosters for each course.",
                        style: TextStyle(
                          color: Color(0xff64748b),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 3),
                      const Text(
                        "Select a course below to view enrolled students.",
                        style: TextStyle(
                          color: Color(0xff94a3b8),
                          fontSize: 12,
                        ),
                      ),

                      const SizedBox(height: 16),
                      RosterSearchFilterBar(
                        studentRoasterController: studentRoasterController,
                      ),

                      // Row(
                      //   mainAxisSize: MainAxisSize.min,
                      //   children: [
                      //     SizedBox(
                      //       width: MediaQuery.of(context).size.width * 0.85,
                      //       child: TextField(
                      //         decoration: InputDecoration(
                      //           hintText: "Search course title or teacher",
                      //           hintStyle: const TextStyle(fontSize: 14),
                      //           prefixIcon: const Icon(
                      //             Icons.search,
                      //             color: Color(0xff94a3b8),
                      //           ),
                      //           border: InputBorder.none,
                      //           contentPadding: const EdgeInsets.symmetric(
                      //             vertical: 12,
                      //           ),
                      //         ),
                      //         onChanged: (value) {
                      //           studentRoasterController.searchCourses(value);
                      //         },
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 100,
                      //       child: RosterSearchFilterBar(
                      //         studentRoasterController: studentRoasterController,
                      //       ),
                      //     ),
                      //   ],
                      // ),
                      const SizedBox(height: 20),

                      Obx(
                        () => studentRoasterController.isLoading.value
                            ? StudentRosterShimmer()
                            : RosterTable(
                                courses: studentRoasterController
                                    .filteredRoasterCourses
                                    .value,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
