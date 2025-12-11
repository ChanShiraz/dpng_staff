import 'package:dpng_staff/features/home/controller/courses_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class TrackToggle extends StatelessWidget {
  const TrackToggle({super.key, required this.coursesController});

  final CoursesController coursesController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final int courseType = coursesController.courseType.value;
      return Row(
        children: [
          InkWell(
            onTap: () {
              coursesController.courseType.value = 4;
              coursesController.loadCourses(courseType);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                color: courseType == 4 ? Colors.blue : null,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'TRACK A',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: courseType == 4 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
          SizedBox(width: 10),
          InkWell(
            onTap: () {
              coursesController.courseType.value = 5;
              coursesController.loadCourses(courseType);
            },
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5, horizontal: 20),
              decoration: BoxDecoration(
                color: courseType == 5 ? Colors.blue : null,
                border: Border.all(color: Colors.black),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                'TRACK B',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: courseType == 5 ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      );
    });
  }
}
