import 'package:dattingapp_flutter/models/chat.dart';
import 'package:dattingapp_flutter/providers/auth_provider.dart';
import 'package:dattingapp_flutter/screeen/ConversationScreen.dart';
import 'package:dattingapp_flutter/services/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  List<Chat> _chats = [
    // Chat(
    //     id: 1000,
    //     user1Id: 1000,
    //     user2Id: 2000,
    //     user2Name: "ucup",
    //     updatedAt: "satu menit yg lalu",
    //     lastMessage: "hay")
  ];
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchChats();
    print("hai");
  }

  Future<void> _fetchChats() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final apiService = ApiService();

    setState(() {
      _isLoading = true;
      _hasError = false;
    });

    try {
      final chats = await apiService.fetchChats(authProvider.token!);
      setState(() {
        _chats = chats;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _isLoading = false;
        _hasError = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.person),
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.local_fire_department),
                    onPressed: () {
                      Navigator.pushNamed(context, '/tindering');
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.message),
                    color: Colors.red,
                    onPressed: () {
                      Navigator.pushNamed(context, '/chat');
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _chats.length,
                itemBuilder: (context, index) {
                  return ChatMessage(
                    id: _chats[index].id,
                    name: _chats[index].user2Name,
                    message: _chats[index].lastMessage,
                    time: _chats[index].updatedAt,
                    receiverId: _chats[index].receiverId,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChatMessage extends StatelessWidget {
  final int id;
  final String name;
  final String message;
  final String time;
  final int receiverId;

  ChatMessage(
      {required this.id,
      required this.name,
      required this.message,
      required this.time,
      required this.receiverId,
      });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ConversationScreen(chatId: id, receiverId: receiverId,),
          ),
        )
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://ui-avatars.com/api/?background=0D8ABC&color=fff'),
              radius: 25.0,
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16.0,
                  ),
                ),
                SizedBox(height: 5.0),
                Text(message),
                SizedBox(height: 5.0),
                Text(
                  time,
                  style: TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}