class LevelsData {
  final String type;
  final List<LevelItem> items;

  LevelsData({
    required this.type,
    required this.items,
  });

  factory LevelsData.fromJson(Map<String, dynamic> json) {
    return LevelsData(
      type: json['type'] as String,
      items: (json['items'] as List)
          .map((e) => LevelItem.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'items': items.map((e) => e.toJson()).toList(),
    };
  }
}

class LevelItem {
  final String key;
  final String label;
  final String text;

  LevelItem({
    required this.key,
    required this.label,
    required this.text,
  });

  factory LevelItem.fromJson(Map<String, dynamic> json) {
    return LevelItem(
      key: json['key'] as String,
      label: json['label'] as String,
      text: json['text'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'key': key,
      'label': label,
      'text': text,
    };
  }
}
