enum ResourceKind { link, text }

class ResourceItem {
  final int id;
  final ResourceKind kind;
  final String title;
  final String? url;
  final String? summary;

  ResourceItem({
    required this.id,
    required this.kind,
    required this.title,
    this.url,
    this.summary,
  });
}
