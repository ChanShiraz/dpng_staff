import 'package:dpng_staff/features/district_summative_library/controller/dis_summative_lib_controller.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/rubric_row.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/rubric_row_summative.dart';
import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:dpng_staff/features/summative_library/controllers/summative_library_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import '../models/summative_model.dart';
import 'tag_chip.dart';

class PreviewPanel extends StatelessWidget {
  final SummativeModel? summative;
  //final controller = Get.find<DisSummativeLibController>();
  final controller;
  bool? archive;
  PreviewPanel({
    super.key,
    required this.summative,
    required this.controller,
    this.archive,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: RoundContainer(
        color: Colors.white,
        circular: 20,
        //  margin: const EdgeInsets.only(right: 16, top: 16, bottom: 16),
        padding: 20,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Summative Viewer',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Divider(),
            ),
            summative == null
                ? Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text(
                          "Select a summative to preview details",
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ],
                  )
                : Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            summative!.title,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            summative!.subject,
                            style: const TextStyle(
                              fontSize: 13,
                              color: Colors.grey,
                            ),
                          ),
                          // const SizedBox(height: 8),
                          // Text(
                          //   'By ${item.author}',
                          //   style: const TextStyle(fontSize: 12, color: Colors.grey),
                          // ),
                          // const SizedBox(height: 16),

                          // // Description
                          // const Text("Description", style: TextStyle(color: Colors.black54)),
                          // const SizedBox(height: 6),
                          // Text(item.description, style: const TextStyle(fontSize: 13)),
                          const SizedBox(height: 16),
                          // Competencies
                          const Text(
                            "Competencies",
                            style: TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 6),
                          Wrap(
                            children: summative!.competencies
                                .map(
                                  (e) => TagChip(
                                    '${e.dpc_label}: ${e.dpc_heading}',
                                    showBorder: true,
                                    borderColor: Colors.grey.shade300,
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 16),

                          // Standards
                          const Text(
                            "Standards",
                            style: TextStyle(color: Colors.black54),
                          ),
                          const SizedBox(height: 6),
                          Wrap(
                            children: summative!.standards
                                .map(
                                  (e) => TagChip(
                                    e,
                                    color: Colors.blue.shade50,
                                    textColor: Colors.blue,
                                    showBorder: true,
                                    borderColor: Colors.blue.shade300,
                                  ),
                                )
                                .toList(),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Rubric',
                            style: TextStyle(color: Colors.black45),
                          ),
                          const SizedBox(height: 16),
                          RubricRowSummative(controller: controller),
                          const SizedBox(height: 16),
                          ScaffoldingTextWidget(
                            leading: Icons.square_outlined,
                            title: 'Integrated Rubric',
                            description:
                                'Claim: Focus arguable claim that frames reasoning.',
                          ),
                          const SizedBox(height: 16),
                          Obx(() {
                            final selectedScore =
                                controller.selectedScore.value;
                            return ScaffoldingTextWidget(
                              leading: Icons.sort,
                              title: 'Scaffolded Rubric',
                              description: controller.rubricText(),
                            );
                          }),
                          // Example
                          // const Text("Example", style: TextStyle(color: Colors.black54)),
                          // const SizedBox(height: 6),
                          // Text(item.example, style: const TextStyle(fontSize: 13)),
                          // const Spacer(),

                          // Buttons
                          SizedBox(height: 20),
                          archive == null
                              ? Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.black,
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                      ),
                                      child: const Text("Open Full Preview"),
                                    ),
                                  ],
                                )
                              : SizedBox(),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class ScaffoldingTextWidget extends StatelessWidget {
  const ScaffoldingTextWidget({
    super.key,
    required this.description,
    required this.leading,
    required this.title,
  });
  final IconData leading;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.indigo.shade100,
              child: Icon(leading, color: Colors.indigo),
            ),
            SizedBox(width: 10),
            Text(
              title,
              style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
        SizedBox(height: 10),
        Container(
          padding: EdgeInsets.all(10),
          //height: 48,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.blue.shade50,
            border: Border.all(color: Colors.blue.shade300),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  description,
                  style: TextStyle(color: Colors.black54),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
