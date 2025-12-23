import 'package:dpng_staff/features/course/widgets/summatives_shimmer.dart';
import 'package:dpng_staff/features/summative_assignment/controller/summative_assingnment_controller.dart';
import 'package:dpng_staff/features/summative_assignment/widgets/datefield.dart';
import 'package:dpng_staff/features/summative_assignment/widgets/summative_section.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class LessonsSection extends StatelessWidget {
  LessonsSection({super.key});
  final controller = Get.find<SummativeAssingnmentController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          HeaderRow(
            titles: const [
              "Lesson Order",
              "Lesson Title",
              "Objective",
              "Due Date",
            ],
            flexes: [1, 3, 5, 1],
          ),
          Obx(
            () => controller.fetchingLessons.value
                ? SummativesShimmer(height: 35, borderRadius: 0, padding: 1)
                : Column(
                    children: List.generate(controller.lessons.length, (index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: index == controller.lessons.length - 1
                              ? BorderRadius.circular(20)
                              : null,
                          border: Border(
                            bottom: BorderSide(
                              width: 1.5,
                              color: Colors.grey.shade200,
                            ),
                          ),
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
                              child: Text(
                                "${index + 1}",
                                style: const TextStyle(
                                  color: Color(0xff64748b),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 3,
                              child: Text(
                                controller.lessons[index].title,
                                style: const TextStyle(
                                  color: Color(0xff16a34a),
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 5,
                              child: Text(
                                controller.lessons[index].description,
                                style: TextStyle(
                                  color: Color(0xff16a34a),
                                  fontStyle: FontStyle.italic,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: DateField(
                                  onDateSelected: (DateTime value) {
                                    controller.lessons[index].dueDate = value;
                                    print(
                                      'lesson due date ${controller.lessons[index].dueDate}',
                                    );
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                  ),
          ),
        ],
      ),
    );
  }
}
