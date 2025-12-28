import 'package:dpng_staff/features/assess_formative/controller/assess_formative_controller.dart';
import 'package:dpng_staff/features/assess_summative/controller/assess_summative_controller.dart';
import 'package:dpng_staff/features/assess_summative/widgets/history_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:intl/intl.dart';

class NotesSection extends StatelessWidget {
  const NotesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text(
              'Notes',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Divider(height: 24),

            Text(
              'Use Satisfactory for quick checks; use Resubmit to trigger review workflow.',
            ),
          ],
        ),
      ),
    );
  }
}

class HistorySection extends StatelessWidget {
  HistorySection({super.key});
  final controller = Get.find<AssessFormativeController>();
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'History',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
            Divider(height: 24),

            Obx(() {
              if (controller.fetchingPastFormatives.value) {
                return SizedBox();
              }
              if (controller.pastFormatives.isEmpty) {
                return Text('No prior assessment for this formative set yet.');
              }
              if (controller.fetchPastFormativesError.isNotEmpty) {
                return Column(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.refresh)),
                    Text('Something went wrong, Please try again.'),
                  ],
                );
              }
              return ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: controller.pastFormatives.length,
                itemBuilder: (context, index) => Text(
                  '• Previous submission graded on ${DateFormat('yyyy-MM-dd').format(controller.pastFormatives[index].assessed!)}. Student resubmitted with revisions.',
                  style: TextStyle(color: Colors.black54),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
