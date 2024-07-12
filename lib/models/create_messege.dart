
class CreateMessage {
  final int chatId;
  final String message;
  final int receiverId;

  CreateMessage({
    required this.chatId,
    required this.message,
    required this.receiverId,
  });

  factory CreateMessage.fromJson(Map<String, dynamic> json) {
    return CreateMessage(
      chatId: json['chat_id'],
      message: json['message'],
      receiverId: json['receiver_id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chat_id': chatId,
      'receiver_id': receiverId,
      'message': message,
    };
  }
}
