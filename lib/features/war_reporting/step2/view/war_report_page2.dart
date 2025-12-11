import 'package:dpng_staff/features/war_reporting/step2/widgets/attainment_badge.dart';
import 'package:dpng_staff/features/war_reporting/step2/widgets/build_table2.dart';
import 'package:dpng_staff/features/war_reporting/step2/widgets/status_badge.dart';
import 'package:dpng_staff/features/war_reporting/step2/widgets/tools_buttons.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class WarReportStep2 extends StatelessWidget {
  const WarReportStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: Icon(Icons.arrow_back_ios_new, color: Colors.black),
        ),
        centerTitle: false,
        title: const Text(
          "WAR REPORT GENERATOR | STEP 2",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 20),
              ),
              onPressed: () {},
              child: const Text(
                "HIDE PREVIEW",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: const Center(
        child: MaxWidthContainer2(child: StudentRosterTable()),
      ),
    );
  }
}

class MaxWidthContainer2 extends StatelessWidget {
  final Widget child;
  const MaxWidthContainer2({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, c) {
        double width = c.maxWidth;
        double maxWidth = width > 1300 ? 1300 : width * 0.95;
        return Container(
          margin: const EdgeInsets.only(top: 40),
          width: maxWidth,
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(.1), blurRadius: 10),
            ],
          ),
          child: child,
        );
      },
    );
  }
}

class StudentRosterTable extends StatelessWidget {
  const StudentRosterTable({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "WAR REPORT: Select Course / WAR REPORT: Select Student",
          style: TextStyle(fontSize: 13, color: Colors.grey),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "US History A - COMPLETE STUDENT ROSTER",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),

            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey.shade300,
                  ),
                  child: const Text(
                    "← Back",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red.shade600,
                  ),
                  child: const Text(
                    "⛔ CLEAR ZEROS",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),

        //const SizedBox(height: 25),
        const SizedBox(height: 25),
        buildTable(),
      ],
    );
  }
}
