import 'package:dpng_staff/features/student_roster/controllers/student_roster_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class RosterSearchFilterBar extends StatelessWidget {
  const RosterSearchFilterBar({
    super.key,
    required this.studentRoasterController,
  });
  final StudentRosterController studentRoasterController;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search course name...',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 0,
                  ),
                ),
                onChanged: (value) {
                  studentRoasterController.searchCourses(value);
                },
              ),
            ),
            const SizedBox(width: 16),
            const Text('Track', style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(width: 8),
            Obx(
              () => DropdownButton<String>(
                value: studentRoasterController.selectedTrack.value,
                focusColor: Colors.transparent,
                items: const [
                  DropdownMenuItem(
                    value: 'All',
                    child: Text(
                      'All',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Track A',
                    child: Text(
                      'Track A',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  DropdownMenuItem(
                    value: 'Track B',
                    child: Text(
                      'Track B',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
                onChanged: (value) {
                  if (value != null) {
                    //studentRoasterController.selectedTrack.value = value;
                    studentRoasterController.trackChange(value);
                  }
                },
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
