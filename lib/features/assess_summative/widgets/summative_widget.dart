import 'package:dpng_staff/common/url_helper.dart';
import 'package:dpng_staff/features/assess_summative/controller/assess_summative_controller.dart';
import 'package:dpng_staff/features/assess_summative/widgets/text_dialog.dart';
import 'package:dpng_staff/features/assessment_center/models/summative_assessment.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/summative_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';

class SummativeWidget extends StatelessWidget {
  SummativeWidget({super.key, required this.summative});
  final SummativeAssessment summative;
  final controller = Get.find<AssessSummativeController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "${summative.first} ${summative.last} • ${summative.title1}",
            style: TextStyle(),
          ),
          const SizedBox(height: 8),
          Divider(),
          const SizedBox(height: 8),
          Text(
            "Summative Assessment – ${summative.title}",
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Date Submitted\n${DateFormat('yyyy-MM-dd').format(summative.date)}",
              ),
              Text("Reflection\n—"),
              summative.type == 2
                  ? OutlinedButton.icon(
                      onPressed: () async {
                        try {
                          if (summative.pathLink != null) {
                            await UrlHelper.launch(summative.pathLink!);
                          }
                         // debugPrint('link ${summative.pathLink}');
                        } catch (e) {
                          showDesktopToast(context, 'Unable to open link');
                        }
                      },
                      label: Text(
                        "View Link",
                        style: TextStyle(
                          color: Colors.blue,
                          // decoration: TextDecoration.underline,
                        ),
                      ),
                    )
                  : OutlinedButton.icon(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (_) =>
                              TextDialog(initialText: summative.text),
                        );
                      },
                      label: Text('View'),
                      icon: Icon(Icons.text_snippet_outlined),
                    ),
            ],
          ),
          const SizedBox(height: 12),

          Obx(
            () => controller.fetchingPastSummatives.value
                ? SizedBox()
                : controller.pastSummatives.isEmpty
                ? SizedBox()
                : Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: const Color(0xfffff6e5),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.warning_amber_rounded, color: Colors.orange),
                        SizedBox(width: 8),
                        Expanded(
                          child: Text(
                            "Assessment is Resubmit With Prior Grading History",
                            style: TextStyle(
                              color: Colors.black87,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}
