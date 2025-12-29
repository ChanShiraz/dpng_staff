import 'package:dpng_staff/features/%20district_rubric_library/widgets/rubric_list.dart';
import 'package:dpng_staff/features/district_summative_library/controller/dis_summative_lib_controller.dart';
import 'package:dpng_staff/features/lesson_builder/models/lesson_model.dart';
import 'package:dpng_staff/features/lesson_library/controller/lesson_library_controller.dart';
import 'package:dpng_staff/features/lesson_library/models/demo_lesson.dart';
import 'package:dpng_staff/features/lesson_library/widgets/lesson_card.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class LessonsList extends StatelessWidget {
  //final List<SummativeModel> items;
  final DemoLesson? selected;
  //final LessonModel? selected;
  final ValueChanged<DemoLesson> onSelect;
  //final controller = Get.find<DisSummativeLibController>();
  final LessonLibraryController controller;
  final bool? arcive;

  const LessonsList({
    super.key,
    required this.selected,
    required this.onSelect,
    required this.controller,
    this.arcive,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(8),
      child: RoundContainer(
        circular: 20,
        child: Column(
          children: [
            _buildHeader(),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                itemCount: controller.demoLessons.length,
                itemBuilder: (context, index) => Obx(
                  () => LessonCard(
                    item: controller.demoLessons[index],
                    selected:
                        controller.selectedLesson.value ==
                        controller.demoLessons[index],
                    onTap: () {
                      controller.selectedLesson.value =
                          controller.demoLessons[index];
                    },
                    controller: controller,
                  ),
                ),
              ),
            ),
            // Obx(
            //   () => controller.fetchingSummatives.value
            //       ? Expanded(child: RubricListShimmer())
            //       : Expanded(
            //           child: ListView.builder(
            //             itemCount: controller.summatives.length + 1,
            //             itemBuilder: (context, i) {
            //               if (i < controller.summatives.length) {
            //                 final item = controller.summatives[i];
            //                 return Obx(
            //                   () => LessonCard(
            //                     controller: controller,
            //                     archive: arcive,
            //                     item: item,
            //                     selected:
            //                         controller.selectedSummative.value == item,
            //                     onTap: () {
            //                       // => onSelect(item)
            //                       controller.selectedSummative.value = item;
            //                       controller.selectedScore.value = 2;
            //                     },
            //                   ),
            //                 );
            //               }
            //               if (!controller.hasMore.value) {
            //                 return const SizedBox(height: 20);
            //               }

            //               return Padding(
            //                 padding: const EdgeInsets.symmetric(vertical: 12),
            //                 child: Center(
            //                   child: SizedBox(
            //                     width: 150,
            //                     child: OutlinedButton(
            //                       onPressed: () => controller.fetchSummatives(
            //                         loadMore: true,
            //                       ),
            //                       child: controller.loadingMore.value
            //                           ? Transform.scale(
            //                               scale: 0.7,
            //                               child: CircularProgressIndicator(
            //                                 strokeWidth: 3,
            //                                 color: Colors.black,
            //                               ),
            //                             )
            //                           : const Text('Load more'),
            //                     ),
            //                   ),
            //                 ),
            //               );
            //             },
            //           ),
            //         ),
            //  ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: const [
          Expanded(
            flex: 4,
            child: Text(
              'Lesson Title',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Course',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          Expanded(
            flex: 3,
            child: Text(
              'Summative',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          // Expanded(
          //   flex: 3,
          //   child: Text(
          //     'Standards',
          //     style: TextStyle(fontWeight: FontWeight.w500),
          //   ),
          // ),
          Expanded(
            flex: 3,
            child: Text(
              'Actions',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
