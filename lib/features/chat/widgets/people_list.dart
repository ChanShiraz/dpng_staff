import 'package:flutter/material.dart';
import '../models/hub_model.dart';
import '../models/person_model.dart';
import 'search_field.dart';

class PeopleList extends StatelessWidget {
  final HubModel hub;
  final List<PersonModel> people;
  final VoidCallback onBack;
  final ValueChanged<PersonModel> onSelect;

  const PeopleList({
    super.key,
    required this.hub,
    required this.people,
    required this.onBack,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const Icon(Icons.arrow_back),
          title: Text(hub.title, style: TextStyle(fontSize: 18)),
          onTap: onBack,
        ),
        Divider(),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: SearchField(hint: 'Search people…'),
        ),
        Divider(),
        Expanded(
          child: ListView.separated(
            itemCount: people.length,
            itemBuilder: (_, i) {
              final p = people[i];
              return ListTile(
                leading: CircleAvatar(child: Text(p.name[0])),
                title: Text(p.name, style: const TextStyle(fontSize: 15)),
                subtitle: Text(
                  p.role.name,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
                onTap: () => onSelect(p),
              );
            },
            separatorBuilder: (_, __) =>
                const Divider(height: 1, thickness: 0.3),
          ),
        ),
      ],
    );
  }
}
