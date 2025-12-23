import 'package:dpng_staff/features/%20district_rubric_library/widgets/preview_panel_rubric.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import '../controllers/rubric_controller.dart';
import 'rubric_card.dart';

class RubricList extends StatefulWidget {
  const RubricList({super.key});

  @override
  State<RubricList> createState() => _RubricListState();
}

class _RubricListState extends State<RubricList> {
  final controller = Get.find<DistrictRubricController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      final rubrics = controller.rubrics;
      final selected = controller.selectedRubric.value;

      return RoundContainer(
        circular: 20,
        padding: 0,
        color: Colors.white,
        child: Column(
          children: [
            _buildHeader(),
            const Divider(height: 1),
            Obx(
              () => controller.fetchingRubrics.value
                  ? Expanded(child: RubricListShimmer())
                  : Expanded(
                      child: ListView.builder(
                        itemCount: rubrics.length + 1,
                        itemBuilder: (context, i) {
                          if (i < controller.rubrics.length) {
                            final item = rubrics[i];
                            return RubricCard(
                              item: item,
                              selected: selected == item,
                              onTap: () => controller.selectRubric(item),
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
                                  onPressed: () =>
                                      controller.fetchRubrics(loadMore: true),
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

            // if (controller.hasMore.value)
          ],
        ),
      );
    });
  }

  Widget _buildHeader() {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF1F5F9),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: const [
          Expanded(
            flex: 2,
            child: Text(
              'Title / Course',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 1,
            child: Text(
              'Subject',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Competencies',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Standards',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),

          SizedBox(
            width: 60,
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

class RubricListShimmer extends StatelessWidget {
  const RubricListShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...List.generate(10, (index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1),
              child: Container(
                height: 100,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 12,
                ),
                decoration: BoxDecoration(
                  // borderRadius: BorderRadius.circular(15),
                  color: const Color(0xfff8fafc),
                  border: const Border(
                    bottom: BorderSide(color: Color(0xffe2e8f0)),
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
