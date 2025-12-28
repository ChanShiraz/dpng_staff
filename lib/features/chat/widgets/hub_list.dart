import 'package:flutter/material.dart';
import '../models/hub_model.dart';
import 'search_field.dart';

class HubList extends StatelessWidget {
  final List<HubModel> hubs;
  final ValueChanged<HubModel> onSelect;

  const HubList({super.key, required this.hubs, required this.onSelect});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.all(16),
          child: Text(
            'Choose a Course',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
        ),
        Divider(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          child: SearchField(hint: 'Search courses or staff group...'),
        ),
        Divider(),
        Expanded(
          child: ListView.separated(
            itemCount: hubs.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (_, i) {
              final hub = hubs[i];
              return ListTile(
                title: Text(hub.title, style: TextStyle(fontSize: 15)),
                subtitle: Text(
                  hub.type.name,
                  style: TextStyle(color: Colors.grey),
                ),
                trailing: Chip(
                  label: Text(hub.subtitle, style: TextStyle(fontSize: 11)),
                  padding: EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                ),
                onTap: () => onSelect(hub),
              );
            },
          ),
        ),
      ],
    );
  }
}
