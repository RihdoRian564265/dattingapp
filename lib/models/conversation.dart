
// lib/models/Conversation.dart
class Conversation {
  final int id;
  final String profileUrl;
  final String createdAt;
  final String message;
  final bool isSender;

  Conversation({
    required this.id,
    required this.profileUrl,
    required this.createdAt,
    required this.message,
    required this.isSender,
  });

  factory Conversation.fromJson(Map<String, dynamic> json) {
    return Conversation(
      id: json['id'],
      profileUrl: json['profile_url'],
      createdAt: json['created_at'],
      message: json['message'],
      isSender: json['is_sender'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'profile_url': profileUrl,
      'created_at': createdAt,
      'message': message,
      'is_sender': isSender,
    };
  }
}
