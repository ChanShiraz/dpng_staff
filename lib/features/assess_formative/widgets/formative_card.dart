import 'package:dpng_staff/common/url_helper.dart';
import 'package:dpng_staff/features/assess_summative/widgets/text_dialog.dart';
import 'package:dpng_staff/features/assessment_center/models/formative_assessment.dart';
import 'package:dpng_staff/features/district_summative_library/widgets/summative_card.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class FormativeCard extends StatelessWidget {
  const FormativeCard({super.key, required this.assessment});
  final FormativeAssessment assessment;

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
          Text("${assessment.last} • ${assessment.title1}", style: TextStyle()),
          const SizedBox(height: 8),
          Divider(),
          const SizedBox(height: 8),
          Text(
            assessment.title,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(assessment.description ?? ''),
              Text(
                "Date Submitted\n${DateFormat('yyyy-MM-dd').format(assessment.date)}",
              ),
              assessment.type == 2
                  ? OutlinedButton.icon(
                      onPressed: () async {
                        try {
                          if (assessment.pathLink != null) {
                            await UrlHelper.launch(assessment.pathLink!);
                          }
                          debugPrint('link ${assessment.pathLink}');
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
                              TextDialog(initialText: assessment.text),
                        );
                      },
                      label: Text('View'),
                      icon: Icon(Icons.text_snippet_outlined),
                    ),
            ],
          ),
          const SizedBox(height: 12),
        ],
      ),
    );
  }
}
