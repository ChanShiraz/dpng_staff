import 'package:dpng_staff/features/course/widgets/summatives_shimmer.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/summative_card.dart';
import 'package:dpng_staff/features/summative_assignment/controller/summative_assingnment_controller.dart';
import 'package:dpng_staff/features/summative_assignment/widgets/summative_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class StudentsSection extends StatelessWidget {
  StudentsSection({super.key});
  final controller = Get.find<SummativeAssingnmentController>();

  @override
  Widget build(BuildContext context) {
    final students = ["Roberto Cruz", "Leon Morales-Reyes", "Sadrac Guillen"];

    return Container(
      decoration: BoxDecoration(
        border: BoxBorder.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          HeaderRow(
            titles: ['Assign', 'Student Name', 'Student Email'],
            flexes: [1, 4, 5],
          ),
          Obx(
            () => controller.fetchingStudents.value
                ? SummativesShimmer(height: 35, borderRadius: 0, padding: 1)
                : Column(
                    children: List.generate(controller.students.length, (
                      index,
                    ) {
                      return Container(
                        decoration: BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              width: 1.5,
                              color: Colors.grey.shade200,
                            ),
                          ),
                          // borderRadius: index == students.length - 1
                          //     ? BorderRadius.circular(20)
                          //     : null,
                          color: index.isOdd ? const Color(0xfff8fafc) : null,
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Checkbox(
                                  value: controller.selectedStudents.contains(
                                    controller.students[index],
                                  ),
                                  onChanged: (_) {
                                    controller.selectStudent(
                                      controller.students[index],
                                    );
                                  },
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 4,
                              child: Text(
                                '${controller.students[index].first} ${controller.students[index].last}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Text(
                                controller.students[index].email,
                                style: TextStyle(color: Color(0xff64748b)),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Obx(
                  () => Text(
                    'Assigned ${controller.selectedStudents.length}/${controller.students.length}',
                  ),
                ),
                SaveButton(aCid: controller.aCid),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SaveButton extends StatelessWidget {
  SaveButton({super.key, required this.aCid});
  final int aCid;
  final controller = Get.find<SummativeAssingnmentController>();
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xfff8fafc),
          ),
          child: Text('Reset', style: TextStyle(color: Colors.black)),
        ),
        SizedBox(width: 10),
        Obx(
          () => ElevatedButton(
            onPressed: controller.readyToAssign.value
                ? () async {
                    final controller =
                        Get.find<SummativeAssingnmentController>();
                    controller.assignSummative(
                      aCid,
                      controller.summative.dmod_sum_id,
                      context,
                    );
                  }
                : null,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
            child: controller.assingingSummative.value
                ? Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6),
                    child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    ),
                  )
                : Text('Save', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
