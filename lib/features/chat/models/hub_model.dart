enum HubType { course, staff }

class HubModel {
  final String id;
  final String title;
  final String subtitle;
  final HubType type;

  HubModel({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.type,
  });
}
