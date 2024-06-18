import 'package:dattingapp/utils/routes/route_name.dart';
import 'package:dattingapp/view/profile/profile_screen.dart';
import 'package:dattingapp/view_model/services/session_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import '../../utils/utils.dart';

class SettingScreen extends StatefulWidget {
  const SettingScreen({super.key});

  @override
  State<SettingScreen> createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      appBar: AppBar(
        backgroundColor: const Color(0xFF333333),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_new_outlined,
              color: const Color.fromARGB(255, 255, 255, 255)),
          onPressed: () => Navigator.of(context).pop(
            PageTransition(
              child: ProfileScreen(),
              type: PageTransitionType.rightToLeft,
            ),
          ),
        ),
        title: Text(
          SessionController().userId.toString(),
        ),
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth auth = FirebaseAuth.instance;

                auth.signOut().then((value) {
                  SessionController().userId = '';
                  Navigator.pushNamed(context, RouteName.loginScreen);
                  Utils.toasstMessage("Anda Telah logged out!");
                });
              },
              icon: Icon(
                Icons.logout_outlined,
                color: Colors.white,
              ))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [],
        ),
      ),
    );
  }
}
