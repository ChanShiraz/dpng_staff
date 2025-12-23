import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_builder_controller.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/upload_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class EcbiMultiSelectDropdown extends StatelessWidget {
  final LessonBuilderController controller = Get.find();

  EcbiMultiSelectDropdown({super.key});

  void _openDialog(BuildContext context) {
    controller.prepareTempSelection();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) {
        return Dialog(
          insetPadding: const EdgeInsets.all(16),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.6,
            width: MediaQuery.of(context).size.width * 0.6,
            child: Column(
              children: [
                /// Header
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add ECBI lesson flow steps',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              'Select one or more ECBI strategies to include in this lesson.',
                              style: TextStyle(fontSize: 12),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.clearTempSelection();
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close),
                      ),
                    ],
                  ),
                ),

                const Divider(height: 1),

                /// ECBI List
                Expanded(
                  child: Obx(() {
                    if (controller.fetchingEcbi.value) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    return ListView.builder(
                      itemCount: controller.ecbis.length,
                      itemBuilder: (_, index) {
                        final item = controller.ecbis[index];
                        final checked = controller.tempSelectedEcbiIds.contains(
                          item.ecbi_id,
                        );

                        return InkWell(
                          onTap: () => controller.toggleEcbi(item.ecbi_id),
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(color: Colors.grey.shade300),
                              ),
                            ),
                            child: Row(
                              children: [
                                Obx(
                                  () => Checkbox(
                                    value: controller.tempSelectedEcbiIds
                                        .contains(item.ecbi_id),
                                    onChanged: (_) =>
                                        controller.toggleEcbi(item.ecbi_id),
                                  ),
                                ),
                                Text(
                                  item.heading,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 2,
                                  ),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  child: Text(
                                    item.ecbi_label,
                                    style: const TextStyle(fontSize: 11),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }),
                ),

                const Divider(height: 1),

                /// Footer
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Obx(
                    () => Row(
                      children: [
                        Text(
                          'Selected: ${controller.tempSelectedEcbiIds.length}',
                        ),
                        const Spacer(),
                        TextButton(
                          onPressed: () {
                            controller.clearTempSelection();
                            Navigator.pop(context);
                          },
                          child: const Text('Cancel'),
                        ),
                        const SizedBox(width: 8),
                        // ElevatedButton(
                        //   onPressed: () {
                        //     controller.saveSelection();
                        //     controller.insertLessonEcbi();
                        //     Navigator.pop(context);
                        //   },
                        //   child: const Text('Save'),
                        // ),
                        UploadButton(
                          show: true,
                          onPress: () async {
                            controller.saveSelection();
                            await controller.insertLessonEcbi();
                            Navigator.pop(context);
                          },
                          isLoading: controller.insertingEcbi.value,
                          uploaded: false,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton.icon(
        style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
        onPressed: () => _openDialog(context),
        icon: const Icon(Icons.add, size: 16, color: Colors.black),
        label: Text(
          controller.selectedEcbiIds.isEmpty
              ? 'Add'
              : 'Selected (${controller.selectedEcbiIds.length})',
          style: const TextStyle(color: Colors.black, fontSize: 12),
        ),
      ),
    );
  }
}
