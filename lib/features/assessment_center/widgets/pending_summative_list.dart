import 'package:dpng_staff/features/assessment_center/models/assessment.dart';
import 'package:dpng_staff/features/assessment_center/widgets/assessment_item.dart';
import 'package:flutter/material.dart';

class PendingSummativeList extends StatelessWidget {
  final List<Assessment> items;
  const PendingSummativeList({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      color: Colors.white,
      child: ConstrainedBox(
        constraints: const BoxConstraints(minHeight: 200),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            children: [
              // Header title
              Row(
                children: const [
                  Text(
                    'Pending Summatives',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              // List of items
              ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: items.length,
                separatorBuilder: (_, __) => const SizedBox(height: 10),
                itemBuilder: (context, index) {
                  return AssessmentItemWidget(item: items[index], index: 0);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
