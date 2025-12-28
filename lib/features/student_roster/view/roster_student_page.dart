import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/student_roster/controllers/roster_student_controller.dart';
import 'package:dpng_staff/features/student_roster/models/roster_student.dart';
import 'package:dpng_staff/features/student_roster/widgets/student_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class RosterStudentPage extends StatefulWidget {
  RosterStudentPage({
    super.key,
    required this.a_cid,
    required this.courseTitle,
  });
  final int a_cid;
  final String courseTitle;
  late RosterStudentController roasterStudentController;

  @override
  State<RosterStudentPage> createState() => _RosterStudentPageState();
}

class _RosterStudentPageState extends State<RosterStudentPage> {
  @override
  void initState() {
    widget.roasterStudentController = Get.put(
      RosterStudentController(aCid: widget.a_cid),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff8fafc),
      body: SafeArea(
        child: Column(
          children: [
            TopBar(
              title: '${widget.courseTitle} - Complete Student Roster',
              subtitle: 'Student Rosters by Course / Course Roster',
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "View and manage all enrolled students for this course.",
                            style: TextStyle(
                              color: Color(0xff64748b),
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(height: 3),
                          const Text(
                            "Student passwords are hidden in this view for security.",
                            style: TextStyle(
                              color: Color(0xff94a3b8),
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 16),

                      TextField(
                        decoration: InputDecoration(
                          hintText: "Search student name or email",
                          hintStyle: const TextStyle(fontSize: 14),
                          prefixIcon: const Icon(
                            Icons.search,
                            color: Color(0xff94a3b8),
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 12,
                          ),
                        ),
                        onChanged: (value) {
                          widget.roasterStudentController.searchStudents(value);
                        },
                      ),

                      const SizedBox(height: 20),

                      Obx(
                        () => widget.roasterStudentController.isLoading.value
                            ? StudentRosterShimmer()
                            : Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                    color: const Color(0xffe2e8f0),
                                  ),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.03),
                                      blurRadius: 4,
                                      offset: const Offset(0, 2),
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 20,
                                        vertical: 12,
                                      ),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Color(0xfff8fafc),
                                        border: Border(
                                          bottom: BorderSide(
                                            color: Color(0xffe2e8f0),
                                          ),
                                        ),
                                      ),
                                      child: Row(
                                        children: const [
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              "Student Name",
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff64748b),
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 2,
                                            child: Text(
                                              "Student Email",
                                              style: TextStyle(
                                                fontSize: 11,
                                                fontWeight: FontWeight.w600,
                                                color: Color(0xff64748b),
                                                letterSpacing: 0.5,
                                              ),
                                            ),
                                          ),
                                          Expanded(
                                            child: Align(
                                              alignment: Alignment.centerRight,
                                              child: Text(
                                                "Tools",
                                                style: TextStyle(
                                                  fontSize: 11,
                                                  fontWeight: FontWeight.w600,
                                                  color: Color(0xff64748b),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    ...widget
                                        .roasterStudentController
                                        .filteredRoasterStudents
                                        .value
                                        .asMap()
                                        .entries
                                        .map((entry) {
                                          return StudentTile(
                                            courseTitle: widget.courseTitle,
                                            entry: entry,
                                            courseId: widget.a_cid,
                                          );
                                        }),
                                  ],
                                ),
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
