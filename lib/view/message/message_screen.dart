import 'package:dattingapp/view/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class MessageScreen extends StatelessWidget {
  final List<Message> messages = [
    Message(
      name: "Stacy Candice",
      message: "haloo , salam kenal",
      time: "1 min ago",
      imageUrl: "assets/stacy.jpg", // Replace with your image path
      isHighlighted: true,
    ),
    Message(
      name: "Jeniffer Canning",
      message: "selamat siang",
      time: "1 hr ago",
      imageUrl: "assets/jeniffer.jpg",
    ),
    Message(
      name: "Lara Langford",
      message: "selamat siang",
      time: "1 day ago",
      imageUrl: "assets/lara.jpg",
    ),
    Message(
      name: "Sara Canning",
      message: "selamat siang",
      time: "2 day ago",
      imageUrl: "assets/sara.jpg",
    ),
    Message(
      name: "Emy Dawson",
      message: "selamat siang",
      time: "3 day ago",
      imageUrl: "assets/emy.jpg",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 85),
          child: Column(
            children: <Widget>[
              // Top icons
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: const Color(0xFF333333),
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      icon: Icon(Icons.person_outline_rounded),
                      iconSize: 35,
                      color: Colors.white,
                      onPressed: () => Navigator.of(context).push(
                        PageTransition(
                          child: ProfileScreen(),
                          type: PageTransitionType.fade,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 65),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: const Color(0xFF333333),
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      icon: Image.asset('images/flame.png'),
                      iconSize: 35,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 65),
                  Container(
                    width: 55,
                    height: 55,
                    decoration: BoxDecoration(
                        color: const Color.fromRGBO(44, 61, 108, 1),
                        borderRadius: BorderRadius.circular(50)),
                    child: IconButton(
                      icon: Icon(Icons.messenger_outline_rounded),
                      iconSize: 35,
                      color: Colors.white,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              Expanded(
                child: ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final message = messages[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(message.imageUrl),
                      ),
                      title: Text(
                        message.name,
                        style: TextStyle(
                          color: message.isHighlighted
                              ? Colors.pink
                              : Colors.white,
                          fontWeight: message.isHighlighted
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(
                        message.message,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      trailing: Text(
                        message.time,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Message {
  final String name;
  final String message;
  final String time;
  final String imageUrl;
  final bool isHighlighted;

  Message({
    required this.name,
    required this.message,
    required this.time,
    required this.imageUrl,
    this.isHighlighted = false,
  });
}
