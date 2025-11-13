import 'package:dpng_staff/features/student_roaster/widgets/roaster_topbar.dart';
import 'package:dpng_staff/features/student_roaster/widgets/roster_search_filter_bar.dart';
import 'package:dpng_staff/features/student_roaster/widgets/roster_table.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class StudentRosterPage extends StatelessWidget {
  const StudentRosterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),
      appBar: AppBar(
        title: Row(
          children: [
            IconButton(
              onPressed: () => Get.back(),
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
            ),
            SizedBox(width: 10),
            const Text(
              'Student Rosters by Course',
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
        centerTitle: false,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1200),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    SizedBox(height: 12),
                    RosterSearchFilterBar(),
                    SizedBox(height: 24),
                    RosterTable(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
