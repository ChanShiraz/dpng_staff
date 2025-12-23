// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Tool {
  final int alt_tool_id;
  final String description;
  Tool({required this.alt_tool_id, required this.description});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'alt_tool_id': alt_tool_id,
      'description': description,
    };
  }

  factory Tool.fromMap(Map<String, dynamic> map) {
    return Tool(
      alt_tool_id: map['alt_tool_id'] as int,
      description: map['description'] as String,
    );
  }
}
