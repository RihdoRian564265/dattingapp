import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      body: Container(
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
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                    icon: Icon(Icons.person),
                    color: Colors.white,
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 65),
                IconButton(
                  icon: Icon(Icons.search_outlined),
                  color: Colors.blue,
                  iconSize: 45,
                  onPressed: () {},
                ),
                SizedBox(width: 65),
                IconButton(
                  icon: Icon(Icons.messenger_outline_rounded),
                  color: Colors.blue,
                  iconSize: 45,
                  onPressed: () {},
                ),
              ],
            ),
            SizedBox(height: 80),
            // Circular Avatars
            CircleAvatar(
              radius: 100,
              backgroundColor: Colors.grey,
            ),
            SizedBox(height:5),
            // Bottom icons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                    icon: Icon(Icons.settings_outlined),
                    iconSize: 45,
                    color: Colors.black,
                    onPressed: () {},
                  ),
                ),
                SizedBox(
                  width: 35,
                ),
                Container(
                  width: 90,
                  height: 90,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  margin: EdgeInsets.only(top: 155),
                  child: IconButton(
                    icon: Icon(Icons.camera_alt_outlined),
                    color: Colors.black,
                    iconSize: 65,
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 35),
                Container(
                  width: 70,
                  height: 70,
                   decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(50)),
                  child: IconButton(
                    icon: Icon(Icons.edit_outlined),
                    iconSize: 45,
                    color: Colors.black,
                    onPressed: () {},
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
