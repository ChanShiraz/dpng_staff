import 'package:dpng_staff/features/%20district_rubric_library/widgets/rubric_list.dart';
import 'package:dpng_staff/features/course_summative_assignment/controller/assign_course_summative_controller.dart';
import 'package:dpng_staff/features/course_summative_assignment/widgets/assign_summative_card.dart';
import 'package:dpng_staff/features/district_summative_library/controller/dis_summative_lib_controller.dart';
import 'package:dpng_staff/features/district_summative_library/models/summative_model.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class AssignSummativeList extends StatelessWidget {
  //final List<SummativeModel> items;
  //final SummativeModel? selected;
  //final ValueChanged<SummativeModel> onSelect;
  //final controller = Get.find<DisSummativeLibController>();
  final AssignCourseSummativeController controller;
  final bool? arcive;

  const AssignSummativeList({
    super.key,
    //required this.selected,
    //required this.onSelect,
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
            _buildHeader(controller),
            const Divider(height: 1),
            Obx(
              () => controller.fetchingSummatives.value
                  ? Expanded(child: RubricListShimmer())
                  : Expanded(
                      child: ListView.builder(
                        itemCount: controller.summatives.length + 1,
                        itemBuilder: (context, i) {
                          if (i < controller.summatives.length) {
                            final item = controller.summatives[i];
                            return Obx(
                              () => AssignSummativeCard(
                                controller: controller,
                                archive: arcive,
                                item: item,
                                selected: controller.selectedSummatives
                                    .contains(item),
                                onTap: () {
                                  // controller.selectedSummative.value = item;
                                  // controller.selectedScore.value = 2;
                                },
                              ),
                            );
                          }
                          if (!controller.hasMore.value) {
                            return const SizedBox(height: 20);
                          }

                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12),
                            child: Center(
                              child: SizedBox(
                                width: 150,
                                child: OutlinedButton(
                                  onPressed: () => controller.fetchSummatives(
                                    loadMore: true,
                                  ),
                                  child: controller.loadingMore.value
                                      ? Transform.scale(
                                          scale: 0.7,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 3,
                                            color: Colors.black,
                                          ),
                                        )
                                      : const Text('Load more'),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(AssignCourseSummativeController controller) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Obx(
              () => Checkbox(
                value:
                    controller.selectedSummatives.length ==
                        controller.summatives.length &&
                    controller.summatives.isNotEmpty,
                onChanged: (value) {
                  controller.toggleAddAllSummatives();
                },
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text('Title', style: TextStyle(fontWeight: FontWeight.w500)),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Subject',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          Expanded(
            flex: 3,
            child: Text(
              'Competencies',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Standards',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
