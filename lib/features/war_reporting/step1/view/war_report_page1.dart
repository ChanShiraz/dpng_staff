import 'package:dpng_staff/features/war_reporting/step1/widgets/course_table.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WarReportPage1 extends StatelessWidget {
  const WarReportPage1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff3f3f3),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () => Get.back(),
                  icon: Icon(Icons.arrow_back_ios_new),
                ),
                SizedBox(width: 10),
                Text(
                  "War Report Generator | Step 1",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            MaxWidthContainer(child: CourseTable()),
          ],
        ),
      ),
    );
  }
}

class MaxWidthContainer extends StatelessWidget {
  final Widget child;
  const MaxWidthContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        double width = c.maxWidth;
        double maxWidth = width > 1200 ? 1200 : width * 0.95;
        return Container(
          width: maxWidth,
          margin: const EdgeInsets.only(top: 30),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 8),
            ],
          ),
          child: child,
        );
      },
    );
  }
}
