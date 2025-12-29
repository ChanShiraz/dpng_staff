import 'package:dpng_staff/features/course/widgets/summatives_shimmer.dart';
import 'package:dpng_staff/features/lesson_builder/cotroller/lesson_builder_controller.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/add_tool_dialog.dart';
import 'package:dpng_staff/features/lesson_builder/widgets/ecbi_dropdown.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/student_roster/widgets/student_tile.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class ContentPresentationSection extends StatelessWidget {
  ContentPresentationSection({super.key});
  final controller = Get.find<LessonBuilderController>();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        RoundContainer(
          width: double.infinity,
          padding: 20,
          color: Colors.white,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  'Lesson content presentation',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              ToolsRow(
                title: 'Tools & media',
                addLinkTap: () => showDialog(
                  context: context,
                  builder: (context) => AddToolDialogLink(
                    type: 2,
                    lessonId: controller.lessonId.value!,
                  ),
                ),
                addTextTap: () => showDialog(
                  context: context,
                  builder: (context) => AddToolDialogLink(
                    type: 3,
                    lessonId: controller.lessonId.value!,
                  ),
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Slides, videos, simulations, discussion protocols, etc. Teachers can either paste a link or author quick instructions.',
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 10),
              Obx(
                () => ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: controller.lessonTools.length,
                  itemBuilder: (context, index) {
                    final tool = controller.lessonTools[index];
                    return PresentationItem(
                      path: tool.path,
                      type: tool.type,
                      title: tool.title,
                      optionlNote: tool.description,
                      link: tool.link,
                      toolType: controller.tools
                          .firstWhere(
                            (element) => element.alt_tool_id == tool.altToolId,
                          )
                          .description,
                      onDeleteTap: () {
                        controller.removeTool(tool);
                      },
                      onEditTap: () {},
                    );
                  },
                ),
              ),

              // Obx(
              //   () => controller.lessonTools.isNotEmpty
              //       ?
              //       Padding(
              //           padding: const EdgeInsets.only(top: 5),
              //           child: Align(
              //             alignment: Alignment.bottomRight,
              //             child: ElevatedButton(
              //               style: ElevatedButton.styleFrom(
              //                 backgroundColor: Colors.black,
              //               ),
              //               onPressed: () {
              //                 controller.insertLessonTool();
              //               },
              //               child: controller.insertingTools.value
              //                   ? Padding(
              //                       padding: const EdgeInsets.symmetric(
              //                         horizontal: 14,
              //                       ),
              //                       child: SizedBox(
              //                         height: 20,
              //                         width: 20,
              //                         child: CircularProgressIndicator(
              //                           color: Colors.white,
              //                           strokeWidth: 3,
              //                         ),
              //                       ),
              //                     )
              //                   : controller.lessonToolsInserted.value
              //                   ? Row(
              //                       mainAxisSize: MainAxisSize.min,
              //                       children: [
              //                         Icon(Icons.check, color: Colors.white),
              //                         SizedBox(width: 5),
              //                         Text(
              //                           'Saved',
              //                           style: TextStyle(color: Colors.white),
              //                         ),
              //                       ],
              //                     )
              //                   : Text(
              //                       'Save',
              //                       style: TextStyle(color: Colors.white),
              //                     ),
              //             ),
              //           ),
              //         )
              //       : SizedBox(),
              // ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Divider(),
              ),
              EcbSection(),
            ],
          ),
        ),
        Obx(
          () => controller.isLocked.value
              ? Positioned.fill(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Icon(Icons.lock_clock_outlined),
                  ),
                )
              : SizedBox.shrink(),
        ),
      ],
    );
  }
}

class ToolsRow extends StatelessWidget {
  const ToolsRow({
    super.key,
    required this.title,
    this.addTextTap,
    this.addLinkTap,
  });
  final String title;
  final VoidCallback? addTextTap;
  final VoidCallback? addLinkTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: addTextTap,
              label: Text(
                'Add text',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              icon: Icon(
                Icons.text_snippet_outlined,
                color: Colors.black,
                size: 16,
              ),
            ),
            SizedBox(width: 10),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
              onPressed: addLinkTap,
              label: Text(
                'Add link',
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
              icon: Icon(Icons.link, color: Colors.black, size: 16),
            ),
          ],
        ),
      ],
    );
  }
}

class PresentationItem extends StatelessWidget {
  const PresentationItem({
    super.key,
    required this.type,
    required this.title,
    this.optionlNote,
    this.link,
    this.color = Colors.deepPurpleAccent,
    this.path,
    this.toolType,
    required this.onDeleteTap,
    required this.onEditTap,
  });
  final String? link;
  final int type;
  final String title;
  final String? optionlNote;
  final Color color;
  final String? path;
  final String? toolType;
  final VoidCallback onDeleteTap;
  final VoidCallback onEditTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Material(
        elevation: 1,
        borderRadius: BorderRadius.circular(10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Icon(
                        type == 3 ? Icons.text_snippet_outlined : Icons.link,
                        color: color,
                        size: 20,
                      ),
                      SizedBox(width: 10),
                      Text(title),
                      SizedBox(width: 10),
                      _TypeChip(type: type, color: color),
                      SizedBox(width: 10),
                      toolType != null
                          ? _ToolTypeChip(toolType: toolType!)
                          : SizedBox.shrink(),
                    ],
                  ),

                  Row(
                    children: [
                      IconButton(
                        onPressed: onEditTap,
                        icon: Icon(
                          Icons.edit_outlined,
                          size: 22,
                          color: Colors.grey,
                        ),
                      ),
                      IconButton(
                        onPressed: onDeleteTap,
                        icon: Icon(
                          Icons.delete_outline_outlined,
                          size: 22,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              link != null && link!.isNotEmpty
                  ? Text(link!, style: TextStyle(color: color, fontSize: 12))
                  : SizedBox.shrink(),
              path != null && path!.isNotEmpty
                  ? Text(
                      path!,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  : optionlNote != null && optionlNote!.isNotEmpty
                  ? Text(
                      optionlNote!,
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    )
                  : SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }
}

class EcbSection extends StatelessWidget {
  EcbSection({super.key});
  final controller = Get.find<LessonBuilderController>();

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.fetchingEcbi.value
          ? SummativesShimmer(quantity: 2)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('ECBI (lesson flow)'),
                    EcbiMultiSelectDropdown(),
                  ],
                ),

                SizedBox(height: 10),
                Text(
                  'High-level steps of how you will present this lesson.',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                ),

                SizedBox(height: 10),
                Obx(
                  () => Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: controller.selectedEcbiIds
                        .map(
                          (id) => _EcbiChip(
                            text: controller.ecbis
                                .firstWhere((element) => element.ecbi_id == id)
                                .ecbi_label,
                          ),
                        )
                        .toList(),
                  ),
                ),
              ],
            ),
    );
  }
}

class _EcbiChip extends StatelessWidget {
  const _EcbiChip({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade300,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(text, style: TextStyle(fontSize: 13)),
          SizedBox(width: 10),
          Icon(Icons.delete_outline_outlined, size: 15),
        ],
      ),
    );
  }
}

class _TypeChip extends StatelessWidget {
  const _TypeChip({
    super.key,
    required this.type,
    this.color = Colors.deepPurpleAccent,
  });
  final int type;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade300,
      ),
      child: Text(
        type == 3 ? 'TEXT' : 'LINK',
        style: TextStyle(color: color, fontSize: 12),
      ),
    );
  }
}

class _ToolTypeChip extends StatelessWidget {
  const _ToolTypeChip({super.key, required this.toolType});
  final String toolType;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 1),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Text(toolType, style: TextStyle(fontSize: 10)),
    );
  }
}
