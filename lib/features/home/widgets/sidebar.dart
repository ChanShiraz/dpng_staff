import 'package:dpng_staff/features/%20district_rubric_library/pages/district_rubric_library_page.dart';
import 'package:dpng_staff/features/district_summative_library/view/district_summative_library_page.dart';
import 'package:dpng_staff/features/grades/pages/grades_page.dart';
import 'package:dpng_staff/features/rubric_creation/view/rubric_creation_page.dart';
import 'package:dpng_staff/features/student_roaster/view/student_roaster_page.dart';
import 'package:dpng_staff/features/summative_creation/view/summative_creation_page.dart';
import 'package:dpng_staff/features/summative_library/pages/summative_library_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Sidebar extends StatelessWidget {
  final bool expanded;
  const Sidebar({super.key, this.expanded = true});

  @override
  Widget build(BuildContext context) {
    final double width = expanded ? 92 : 64;
    return Container(
      width: width,
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
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _SidebarIcon(icon: Icons.home),
                SizedBox(height: 16),
                _SidebarIcon(icon: Icons.menu_book),
                SizedBox(height: 16),
                _SidebarIcon(icon: Icons.message),
                SizedBox(height: 16),
                _SidebarIcon(
                  icon: Icons.rocket,
                  onTap: () => Get.to(StudentRosterPage()),
                ),
                SizedBox(height: 16),
                _SidebarIcon(
                  icon: Icons.add_chart_outlined,
                  onTap: () => Get.to(SummativeCreationSingleView()),
                ),
                SizedBox(height: 16),
                _SidebarIcon(
                  icon: Icons.add_moderator_outlined,
                  onTap: () => Get.to(RubricCreationPage()),
                ),
                SizedBox(height: 16),
                _SidebarIcon(
                  icon: Icons.library_add,
                  onTap: () => Get.to(DistrictSummativeLibraryPage()),
                ),
                SizedBox(height: 16),
                _SidebarIcon(
                  icon: Icons.library_books,
                  onTap: () => Get.to(DistrictRubricLibraryPage()),
                ),
                SizedBox(height: 16),
                _SidebarIcon(
                  icon: Icons.local_library_outlined,
                  onTap: () => Get.to(SummativeLibraryPage()),
                ),
                SizedBox(height: 16),
                _SidebarIcon(
                  icon: Icons.grade_outlined,
                  onTap: () => Get.to(GradesInterface()),
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
  const _SidebarIcon({super.key, required this.icon, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: 52,
        height: 52,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.08),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 28),
      ),
    );
  }
}
