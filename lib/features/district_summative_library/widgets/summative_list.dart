import 'package:dpng_staff/features/rubric_creation/steps/step5_rubric_levels.dart';
import 'package:flutter/material.dart';
import '../models/summative_model.dart';
import 'summative_card.dart';

class SummativeList extends StatelessWidget {
  final List<SummativeModel> items;
  final SummativeModel? selected;
  final ValueChanged<SummativeModel> onSelect;

  const SummativeList({
    super.key,
    required this.items,
    required this.selected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      margin: const EdgeInsets.all(16),
      child: RoundContainer(
        child: Column(
          children: [
            _buildHeader(),
            const Divider(height: 1),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, i) {
                  final item = items[i];
                  return SummativeCard(
                    item: item,
                    selected: selected == item,
                    onTap: () => onSelect(item),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      child: Row(
        children: const [
          Expanded(
            flex: 3,
            child: Text(
              'Title / Course',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Subject',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Standards',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              'Competencies',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
          SizedBox(
            width: 80,
            child: Text(
              'Actions',
              style: TextStyle(fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
