import 'package:dpng_staff/features/course/model/summative.dart';
import 'package:dpng_staff/features/home/models/course_model.dart';
import 'package:dpng_staff/features/summative_assignment/controller/summative_assingnment_controller.dart';
import 'package:dpng_staff/features/summative_assignment/widgets/assign_duedates_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:dpng_staff/common/top_bar.dart';

class SummativeAssignmentPage extends StatefulWidget {
  const SummativeAssignmentPage({
    super.key,
    required this.summative,
    required this.course,
  });
  final Summative summative;
  final CourseModel course;

  @override
  State<SummativeAssignmentPage> createState() =>
      _SummativeAssignmentPageState();
}

class _SummativeAssignmentPageState extends State<SummativeAssignmentPage> {
  late SummativeAssingnmentController controller;
  @override
  void initState() {
    controller = Get.put(
      SummativeAssingnmentController(
        summative: widget.summative,
        aCid: widget.course.a_cid,
      ),
    );
    controller.fetchLessons(widget.summative.dmod_sum_id);
    controller.fetchStudents(widget.course.a_cid);
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
              type: 2,
              title: widget.course.title1,
              subtitle: 'View Course / Assign Due Dates',
            ),

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SaveButton(),
                      SizedBox(height: 18),
                      AssignDueDatesCard(summative: widget.summative),
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

class SaveButton extends StatelessWidget {
  const SaveButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Assign Due Dates',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
        ),
        // Row(
        //   children: [
        //     ElevatedButton(
        //       onPressed: () {},
        //       style: ElevatedButton.styleFrom(
        //         backgroundColor: const Color(0xfff8fafc),
        //       ),
        //       child: Text('Cancel', style: TextStyle(color: Colors.black)),
        //     ),
        //     SizedBox(width: 10),
        //     ElevatedButton(
        //       onPressed: () {},
        //       style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
        //       child: Text('Save', style: TextStyle(color: Colors.white)),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
