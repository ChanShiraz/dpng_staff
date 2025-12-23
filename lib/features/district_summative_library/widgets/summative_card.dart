import 'package:dpng_staff/features/lesson_builder/view/lesson_builder_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_storage/get_storage.dart';
import '../models/summative_model.dart';
import 'tag_chip.dart';

class SummativeCard extends StatelessWidget {
  final SummativeModel item;
  final bool selected;
  final VoidCallback onTap;
  final bool? archive;
  final controller;

  const SummativeCard({
    super.key,
    required this.item,
    required this.selected,
    required this.onTap,
    this.archive,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      hoverColor: const Color(0xFFF8FAFC),
      child: Container(
        decoration: BoxDecoration(
          color: selected ? const Color(0xFFF1F5F9) : Colors.white,
          border: Border(bottom: BorderSide(color: Colors.grey.shade200)),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title + tags
            Expanded(
              flex: 3,
              child: Text(
                item.title,
                style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14,
                ),
              ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.start,
              //   children: [
              //     Text(
              //       item.title,
              //       style: const TextStyle(
              //         fontWeight: FontWeight.w500,
              //         fontSize: 14,
              //       ),
              //     ),
              //     const SizedBox(height: 4),
              //     Wrap(children: item.tags.map((t) => TagChip(t)).toList()),
              //     const SizedBox(height: 2),
              //     Text(
              //       '${item.author} • ${item.grade}',
              //       style: const TextStyle(fontSize: 12, color: Colors.grey),
              //     ),
              //   ],
              // ),
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
                    .map(
                      (t) => TagChip(
                        '${t.dpc_label}: ${t.dpc_heading}',

                        showBorder: true,
                        borderColor: Colors.grey.shade300,
                      ),
                    )
                    .toList(),
              ),
            ),
            // Standards
            Expanded(
              flex: 3,
              child: Wrap(
                children: item.standards
                    .map(
                      (t) => TagChip(
                        t,
                        color: Colors.blue.shade50,
                        textColor: Colors.blue,
                        showBorder: true,
                        borderColor: Colors.blue.shade300,
                      ),
                    )
                    .toList(),
              ),
            ),
            // Actions
            SizedBox(
              // width: 80,
              child: archive != null
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.remove_red_eye_outlined, size: 18),
                        SizedBox(width: 8),
                        Obx(() {
                          final isLoading =
                              controller.activatingId.value == item.dmod_sum_id;
                          return IconButton(
                            onPressed: isLoading
                                ? null
                                : () async {
                                    await controller.activateaSummative(
                                      item.dmod_sum_id,
                                    );
                                    showDesktopToast(
                                      context,
                                      'Success! Summative Activated',
                                    );
                                  },
                            icon: isLoading
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.green,
                                    ),
                                  )
                                : const Icon(
                                    Icons.add_circle_outline,
                                    size: 18,
                                    color: Colors.green,
                                  ),
                          );
                        }),
                      ],
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.remove_red_eye_outlined, size: 18),
                        SizedBox(width: 8),
                        Icon(Icons.edit, size: 18),
                        SizedBox(width: 8),
                        Icon(Icons.copy, size: 18),
                        SizedBox(width: 8),
                        IconButton(
                          onPressed: () {
                            Get.to(LessonBuilderPage(summative: item,));
                          },
                          icon: Icon(Icons.add_chart_rounded),
                        ),
                        Obx(() {
                          final isLoading =
                              controller.archivingId.value == item.dmod_sum_id;
                          return IconButton(
                            onPressed: () async {
                              await controller.archiveSummative(
                                item.dmod_sum_id,
                              );
                              showDesktopToast(
                                context,
                                'Success! Summative archived',
                              );
                            },
                            icon: isLoading
                                ? const SizedBox(
                                    width: 16,
                                    height: 16,
                                    child: CircularProgressIndicator(
                                      strokeWidth: 2,
                                      color: Colors.red,
                                    ),
                                  )
                                : Icon(
                                    Icons.delete_outline,
                                    size: 18,
                                    color: Colors.red,
                                  ),
                          );
                        }),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

void showDesktopToast(BuildContext context, String message) {
  final overlay = Overlay.of(context);
  late OverlayEntry entry;

  entry = OverlayEntry(
    builder: (context) => Center(
      child: Material(
        color: Colors.transparent,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(message, style: const TextStyle(color: Colors.white)),
        ),
      ),
    ),
  );

  overlay.insert(entry);

  Future.delayed(const Duration(seconds: 2), () {
    entry.remove();
  });
}
