// lib/models/Chat.dart
class Chat {
  final int id;
  final int user1Id;
  final int user2Id;
  final String user2Name;
  final String updatedAt;
  final String lastMessage;
  final int receiverId;

  Chat({
    required this.id,
    required this.user1Id,
    required this.user2Id,
    required this.user2Name,
    required this.updatedAt,
    required this.lastMessage,
    required this.receiverId,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      id: json['id'],
      user1Id: json['user1_id'],
      user2Id: json['user2_id'],
      user2Name: json['user2_name'],
      updatedAt: json['updated_at'],
      lastMessage: json['last_message'],
      receiverId: json['receiver_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'full_name': user1Id,
      'user2Id': user2Id,
      'user2_name': user2Name,
      'updated_at': updatedAt,
      'last_message': lastMessage,
      'receiver_id': receiverId,
    };
  }
}