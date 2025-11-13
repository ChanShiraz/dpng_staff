class MessageModel {
  final String name;
  final String excerpt;
  final int unread;
  MessageModel({required this.name, required this.excerpt, this.unread = 0});
}
