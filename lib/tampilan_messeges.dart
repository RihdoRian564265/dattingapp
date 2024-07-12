import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat'),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.local_fire_department),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(Icons.chat_bubble),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView(
        children: [
          ChatItem(
            name: 'Stacy Candice',
            message: 'Can we catchup for Lunch.',
            time: '1 min ago',
            imageUrl: 'https://example.com/image1.jpg',
          ),
          ChatItem(
            name: 'Jeniffer Canning',
            message: 'Good Morning',
            time: '1 hr ago',
            imageUrl: 'https://example.com/image2.jpg',
          ),
          ChatItem(
            name: 'Lara langford',
            message: 'Good Morning',
            time: '1 day ago',
            imageUrl: 'https://example.com/image3.jpg',
          ),
          ChatItem(
            name: 'Sara Canning',
            message: 'Good Morning',
            time: '2 day ago',
            imageUrl: 'https://example.com/image4.jpg',
          ),
          ChatItem(
            name: 'Emy Dawson',
            message: 'Good Morning',
            time: '3 day ago',
            imageUrl: 'https://example.com/image5.jpg',
          ),
        ],
      ),
    );
  }
}

class ChatItem extends StatelessWidget {
  final String name;
  final String message;
  final String time;
  final String imageUrl;

  ChatItem({
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(imageUrl),
        ),
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(message),
            SizedBox(height: 4),
            Text(
              time,
              style: TextStyle(
                color: Colors.grey,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),
    );
  }
}