import 'package:dpng_staff/features/%20district_rubric_library/pages/district_rubric_library_page.dart';
import 'package:dpng_staff/features/district_summative_library/view/district_summative_library_page.dart';
import 'package:dpng_staff/features/grades/pages/grades_page.dart';
import 'package:dpng_staff/features/rubric_creation/view/rubric_creation_page.dart';
import 'package:dpng_staff/features/student_roster/view/student_roster_page.dart';
import 'package:dpng_staff/features/summative_creation/view/summative_creation_page.dart';
import 'package:dpng_staff/features/summative_library/pages/summative_library_page.dart';
import 'package:dpng_staff/features/war_reporting/step1/view/war_report_page1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Sidebar extends StatelessWidget {
  final bool expanded;
  const Sidebar({super.key, this.expanded = true});

  @override
  Widget build(BuildContext context) {
    // final double width = expanded ? 92 : 64;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      //width: width,
      color: const Color(0xFF1E88E5), // blue stripe like the design
      child: Column(
        children: [
          SizedBox(height: 18),
          // Logo
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Container(
                color: Colors.white,
                width: 56,
                height: 56,
                child: Image.asset(
                  'assets/images/icon.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),
          // Navigation icons
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _SidebarIcon(icon: Icons.home, lable: 'Home'),
                // SizedBox(height: 16),
                // _SidebarIcon(icon: Icons.menu_book, lable: 'Home'),
                SizedBox(height: 16),
                _SidebarIcon(icon: Icons.message, lable: 'Chat'),
                SizedBox(height: 16),
                _SidebarIcon(
                  icon: Icons.rocket,
                  lable: 'Student Roasters',
                  onTap: () => Get.to(StudentRosterPage()),
                ),
                SizedBox(height: 16),
                _SidebarIcon(
                  icon: Icons.add_chart_outlined,
                  lable: 'Add Summatives',
                  onTap: () => Get.to(SummativeCreationSingleView()),
                ),
                SizedBox(height: 16),
                _SidebarIcon(
                  icon: Icons.add_moderator_outlined,
                  lable: 'Integrated Rubric',
                  onTap: () => Get.to(RubricCreationPage()),
                ),
                SizedBox(height: 16),
                _SidebarIcon(
                  icon: Icons.library_add,
                  lable: 'District Summatives',
                  onTap: () => Get.to(DistrictSummativeLibraryPage()),
                ),
                SizedBox(height: 16),
                _SidebarIcon(
                  lable: 'District Rubric',
                  icon: Icons.library_books,
                  onTap: () => Get.to(DistrictRubricLibraryPage()),
                ),
                SizedBox(height: 16),
                _SidebarIcon(
                  lable: 'Summative Library',
                  icon: Icons.local_library_outlined,
                  onTap: () => Get.to(SummativeLibraryPage()),
                ),
                SizedBox(height: 16),
                _SidebarIcon(
                  lable: 'Grades Interface',
                  icon: Icons.grade_outlined,
                  onTap: () => Get.to(GradesInterface()),
                ),
                SizedBox(height: 16),
                _SidebarIcon(
                  lable: 'War Report',
                  icon: Icons.assignment_add,
                  onTap: () => Get.to(WarReportPage1()),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
        ],
      ),
    );
  }
}

class _SidebarIcon extends StatelessWidget {
  final IconData icon;
  final String lable;
  const _SidebarIcon({
    super.key,
    required this.icon,
    this.onTap,
    required this.lable,
  });
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        width: 210,
        // height: 52,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          children: [
            Icon(icon, color: Colors.white, size: 28),
            SizedBox(width: 10),
            Text(lable, style: TextStyle(color: Colors.white)),
          ],
        ),
      ),
    );
  }
}
