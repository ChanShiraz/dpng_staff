import 'package:dpng_staff/common/top_bar.dart';
import 'package:dpng_staff/features/grades/controller/grades_controller.dart';
import 'package:dpng_staff/features/grades/models/competency.dart';
import 'package:dpng_staff/features/grades/models/course.dart';
import 'package:dpng_staff/features/grades/models/standard.dart';
import 'package:dpng_staff/features/grades/models/student.dart';
import 'package:dpng_staff/features/grades/models/summative.dart';
import 'package:dpng_staff/features/grades/pages/course_grade_page.dart';
import 'package:dpng_staff/features/grades/pages/final_grade_page.dart';
import 'package:dpng_staff/features/grades/pages/student_work_page.dart';
import 'package:dpng_staff/features/grades/pages/summative_result_page.dart';
import 'package:dpng_staff/features/grades/widgets/d_badge.dart';
import 'package:dpng_staff/features/grades/widgets/d_card.dart';
import 'package:dpng_staff/features/grades/widgets/d_card_header.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const YEAR_LABEL = '2025–26 School Year';

class GradebookMain extends StatelessWidget {
  final GradesController ctrl = Get.put(GradesController());

  GradebookMain({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: TopBar(
          type: 2,
          title: 'Grades Interface',
          centerTitle: true,
          //  subtitle: 'Enter by course or staff group, then chat 1:1.',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: DCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              DCardHeader(
                title: Row(
                  children: [
                    Icon(Icons.shield_outlined, color: Colors.blueAccent),
                    SizedBox(width: 8),
                    Text('Gradebook', style: TextStyle(color: Colors.black)),
                  ],
                ),
                subtitle: YEAR_LABEL,

                // action: Row(
                //   children: [
                //     ElevatedButton.icon(
                //       onPressed: () => ctrl.openGradebook(),
                //       icon: Icon(Icons.chevron_left),
                //       label: Text('Back'),
                //       style: ElevatedButton.styleFrom(
                //         elevation: 0,
                //         backgroundColor: Colors.transparent,
                //         foregroundColor: Colors.blueAccent,
                //       ),
                //     ),
                //     SizedBox(width: 8),
                //     OutlinedButton.icon(
                //       onPressed: () => ctrl.toggleCompact(),
                //       icon: Icon(Icons.remove_red_eye),
                //       label: Text('Preview'),
                //     ),
                //   ],
                // ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Divider(),
              ),
              //SizedBox(height: 12),
              // Table
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 14,
                        vertical: 10,
                      ),
                      color: Colors.grey.shade50,
                      child: Row(
                        children: [
                          Expanded(
                            child: Text(
                              'Course',
                              style: TextStyle(fontWeight: FontWeight.w700),
                            ),
                          ),
                          Expanded(child: Text('Learning Track')),
                          SizedBox(
                            width: 120,
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text('View'),
                            ),
                          ),
                        ],
                      ),
                    ),
                    ...ctrl.COURSES.map(
                      (c) => InkWell(
                        onTap: () => ctrl.openCourse(c),
                        child: Container(
                          decoration: BoxDecoration(),
                          padding: EdgeInsets.symmetric(
                            horizontal: 14,
                            vertical: 14,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  c.name,
                                  style: TextStyle(fontWeight: FontWeight.w600),
                                ),
                              ),
                              Flexible(
                                child: Align(
                                  alignment: Alignment.bottomLeft,
                                  child: DBadge(
                                    text: c.track,
                                    colorKey: 'blue',
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 120,
                                child: Align(
                                  alignment: Alignment.centerRight,
                                  child: TextButton.icon(
                                    onPressed: () {
                                      //ctrl.openCourse(c);
                                      Get.to(CourseGradesPage(course: c));
                                    },
                                    icon: Icon(Icons.search),
                                    label: Text('Open'),
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
            ],
          ),
        ),
      ),
    );
  }
}

// class GradesInterface extends StatelessWidget {
//   final GradesController ctrl = Get.put(GradesController());

//   GradesInterface({super.key});
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {
//       final view = ctrl.view.value;
//       final compact = ctrl.compact.value;

//       Widget content;
//       switch (view) {
//         case 'course':
//           content = CourseGrades(course: ctrl.selectedCourse.value!);
//           break;
//         case 'work':
//           content = StudentWorkPage(
//             course: ctrl.selectedCourse.value!,
//             student: ctrl.selectedStudent.value!,
//           );
//           break;
//         case 'summative':
//           content = SummativeResultPage(
//             course: ctrl.selectedCourse.value!,
//             student: ctrl.selectedStudent.value!,
//             record: ctrl.selectedRecord.value!,
//           );
//           break;
//         case 'final':
//           content = IssueFinalGradePage(
//             course: ctrl.selectedCourse.value!,
//             student: ctrl.selectedStudent.value!,
//             record: ctrl.selectedRecord.value!,
//           );
//           break;
//         case 'gradebook':
//         default:
//           content = GradebookMain();
//       }

//       return Scaffold(
//         //backgroundColor: Color(0xFFF7F8FB),
//         //appBar: AppBar(title: ,),
//         body: SingleChildScrollView(
//           padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
//           child: Center(
//             child: ConstrainedBox(
//               constraints: BoxConstraints(maxWidth: compact ? 900 : 1400),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.stretch,
//                 children: [
//                   Row(
//                     children: [
//                       IconButton(
//                         onPressed: () => Get.back(),
//                         icon: Icon(Icons.arrow_back_ios_new),
//                       ),
//                       SizedBox(width: 10),
//                       const Text(
//                         "Grades Interface",
//                         style: TextStyle(
//                           fontSize: 20,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20),
//                   AnimatedSwitcher(
//                     duration: Duration(milliseconds: 250),
//                     child: content,
//                   ),
//                   SizedBox(height: 24),
//                   Center(
//                     child: Text(
//                       '\u00A9 2025 DiplomaPlusNG 2.0 — Grades Interface Preview',
//                       style: TextStyle(color: Colors.grey[400], fontSize: 12),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       );
//     });
//   }
// }
