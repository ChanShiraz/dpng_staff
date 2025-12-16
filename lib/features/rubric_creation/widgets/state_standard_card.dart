import 'package:dpng_staff/features/rubric_creation/controller/rubric_controller.dart';
import 'package:dpng_staff/features/rubric_creation/models/non_science_standard.dart';
import 'package:dpng_staff/features/rubric_creation/models/science_standard.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';

class StateStandardCard extends StatelessWidget {
  StateStandardCard({super.key});
  final controller = Get.find<RubricController>();

  @override
  Widget build(BuildContext context) {
    return RoundContainer(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Aligned State Standards',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          controller.selectedNonScienceStandards.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.selectedNonScienceStandards.length,
                  itemBuilder: (context, index) => _StateStandardTile(
                    nonScienceStandard:
                        controller.selectedNonScienceStandards[index],
                  ),
                )
              : controller.selectedScienceStandards.isNotEmpty
              ? ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.selectedScienceStandards.length,
                  itemBuilder: (context, index) => _StateScienceStandardTile(
                    scienceStandard: controller.selectedScienceStandards[index],
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}

class _StateStandardTile extends StatelessWidget {
  _StateStandardTile({
    super.key,
    required this.nonScienceStandard,
    // this.scienceStandard,
  });
  //final ScienceStandard? scienceStandard;
  final NonScienceStandard nonScienceStandard;
  final controller = Get.find<RubricController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RoundContainer(
        padding: 0,
        child: Obx(
          () => ListTile(
            onTap: () =>
                controller.selectAlignedNonScienceStandards(nonScienceStandard),
            // leading: Icon(Icons.check_circle, color: Colors.green.shade300),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            selected:
                controller
                    .selectedAlignedNonScienceStandards
                    .value!
                    .p_standid ==
                nonScienceStandard.p_standid,
            selectedTileColor: Colors.green.shade50,

            title: Text(
              '${nonScienceStandard.standard_label} - ${nonScienceStandard.scope}',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            subtitle: Text(
              nonScienceStandard.standard_description,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }
}

class _StateScienceStandardTile extends StatelessWidget {
  _StateScienceStandardTile({
    super.key,
    required this.scienceStandard,
    // this.scienceStandard,
  });
  //final ScienceStandard? scienceStandard;
  final ScienceStandard scienceStandard;
  final controller = Get.find<RubricController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: RoundContainer(
        padding: 0,
        child: Obx(
          () => ListTile(
            onTap: () =>
                controller.selectAlignedScienceStandards(scienceStandard),
            // leading: Icon(Icons.check_circle, color: Colors.green.shade300),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadiusGeometry.circular(10),
            ),
            selected:
                controller.selectedAlignedScienceStandards.value!.ngpeid ==
                scienceStandard.ngpeid,
            selectedTileColor: Colors.green.shade50,

            title: Text(
              '${scienceStandard.label} - Science',
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            subtitle: Text(
              scienceStandard.expectation,
              style: TextStyle(color: Colors.grey, fontSize: 13),
            ),
          ),
        ),
      ),
    );
  }
}
