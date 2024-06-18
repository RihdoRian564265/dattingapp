import 'dart:io';
import 'package:dattingapp/view/Setting/setting_screen.dart';
import 'package:dattingapp/view/edit/edit_screen.dart';
import 'package:dattingapp/view/message/message_screen.dart';
import 'package:dattingapp/view_model/profil/profile_controller.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../view_model/services/session_manager.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final dbref = FirebaseDatabase.instance.ref('User');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      body: ChangeNotifierProvider(
        create: (_) => ProfileController(),
        child: Consumer<ProfileController>(
          builder: (context, provider, child) {
            return SafeArea(
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
                              color: const Color.fromRGBO(44, 61, 108, 1),
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            icon: Icon(Icons.person_outline_rounded),
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
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            icon: Icon(Icons.messenger_outline_rounded),
                            iconSize: 35,
                            color: Colors.white,
                            onPressed: () => Navigator.of(context).push(
                              PageTransition(
                                child: MessageScreen(),
                                type: PageTransitionType.fade,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 60),
                    // Circular Avatars
                    StreamBuilder(
                      stream: dbref
                          .child(SessionController().userId.toString())
                          .onValue,
                      builder: (context, AsyncSnapshot snapshot) {
                        if (!snapshot.hasData) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (snapshot.hasData) {
                          Map<dynamic, dynamic> map =
                              snapshot.data.snapshot.value;
                          return Column(
                            children: [
                              Center(
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromRGBO(
                                            44, 61, 108, 1),
                                        width: 5,
                                      ),
                                      shape: BoxShape.circle),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(100),
                                    child: CircleAvatar(
                                        radius: 85,
                                        backgroundColor: Colors.grey,
                                        child: provider.image == null
                                            ? map['Profile'].toString() == ""
                                                ? Image.asset(
                                                    'images/Profile.jpg')
                                                : Image(
                                                    fit: BoxFit.cover,
                                                    image: NetworkImage(
                                                      map['Profile'].toString(),
                                                    ),
                                                  )
                                            : Stack(
                                                children: [
                                                  Image.file(
                                                      File(provider.image!.path)
                                                          .absolute),
                                                  Center(
                                                    child:
                                                        CircularProgressIndicator(),
                                                  )
                                                ],
                                              )),
                                  ),
                                ),
                              ),
                            ],
                          );
                        } else {
                          return Center(
                            child: Text(
                              'Something want Wrong',
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          );
                        }
                      },
                    ),
                    SizedBox(height: 0),
                    // Bottom icons
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            icon: Icon(Icons.settings_outlined),
                            iconSize: 45,
                            color: Colors.black,
                            onPressed: () => Navigator.of(context).push(
                              PageTransition(
                                child: SettingScreen(),
                                type: PageTransitionType.leftToRight,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 35,
                        ),
                        Container(
                          width: 75,
                          height: 75,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          margin: EdgeInsets.only(top: 120),
                          child: Center(
                            child: IconButton(
                              icon: Image.asset('images/camera.png'),
                              color: Colors.black,
                              iconSize: 50,
                              onPressed: () {
                                provider.pickImages(context);
                              },
                            ),
                          ),
                        ),
                        SizedBox(width: 35),
                        Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(50)),
                          child: IconButton(
                            icon: Icon(Icons.edit_outlined),
                            iconSize: 35,
                            color: Colors.black,
                            onPressed: () => Navigator.of(context).push(
                              PageTransition(
                                child: EditScreen(),
                                type: PageTransitionType.rightToLeft,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
