import 'package:dpng_staff/features/%20district_rubric_library/widgets/rubric_list.dart';
import 'package:dpng_staff/features/district_summative_library/controller/dis_summative_lib_controller.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import '../models/summative_model.dart';
import 'summative_card.dart';

class SummativeList extends StatelessWidget {
  //final List<SummativeModel> items;
  final SummativeModel? selected;
  final ValueChanged<SummativeModel> onSelect;
  //final controller = Get.find<DisSummativeLibController>();
  final controller;
  final bool? arcive;

  const SummativeList({
    super.key,
    required this.selected,
    required this.onSelect,
    required this.controller,
    this.arcive
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
                              () => SummativeCard(
                                controller: controller,
                                archive: arcive,
                                item: item,
                                selected:
                                    controller.selectedSummative.value == item,
                                onTap: () {
                                  // => onSelect(item)
                                  controller.selectedSummative.value = item;
                                  controller.selectedScore.value = 2;
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

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: const [
          Expanded(
            flex: 3,
            child: Text(
              'Summative Title',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
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
          SizedBox(
            width: 80,
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
