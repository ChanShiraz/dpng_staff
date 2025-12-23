import 'package:dpng_staff/features/course_summative_assignment/controller/assign_course_summative_controller.dart';
import 'package:dpng_staff/features/district_summative_library/models/summative_model.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/summative_card.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/tag_chip.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';

class AssignSummativeCard extends StatelessWidget {
  final SummativeModel item;
  final bool selected;
  final VoidCallback onTap;
  final bool? archive;
  final AssignCourseSummativeController controller;

  const AssignSummativeCard({
    super.key,
    required this.item,
    required this.selected,
    required this.onTap,
    this.archive,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Checkbox(
              value: selected,
              onChanged: (value) {
                controller.toggleSummative(item);
              },
            ),
          ),
          // Title + tags
          Expanded(
            flex: 3,
            child: Text(
              item.title,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 14),
            ),
          ),

          // Subject
          Expanded(
            flex: 2,
            child: Text(
              item.subject,
              style: const TextStyle(fontSize: 13, color: Colors.black87),
            ),
          ),

          //        Competencies
          Expanded(
            flex: 3,
            child: Wrap(
              children: item.competencies
                  .map((t) => TagChip('${t.dpc_label}: ${t.dpc_heading}'))
                  .toList(),
            ),
          ),
          // Standards
          Expanded(
            flex: 3,
            child: Wrap(
              children: item.standards.map((t) => TagChip(t)).toList(),
            ),
          ),

          // Actions
        ],
      ),
    );
  }
}
