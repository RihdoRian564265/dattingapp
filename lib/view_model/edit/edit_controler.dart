import 'package:dattingapp/res/component/costume_iconbutton.dart';
import 'package:dattingapp/res/component/short_H_bar.dart';
import 'package:flutter/material.dart';

class EditControler with ChangeNotifier {
  void pickUserName(context) {
    showBottomSheet(
      backgroundColor: const Color.fromRGBO(44, 61, 108, 1),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ShortHBar(),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Edit UserName',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                CustomIconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icons.close,
                  iconColor: Colors.white,
                )
              ],
            ),
            Divider(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            const SizedBox(
              width: 20,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        );
      },
    );
  }
    void pickPhone(context) {
    showBottomSheet(
      backgroundColor: const Color.fromRGBO(44, 61, 108, 1),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ShortHBar(),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Edit Phone',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                CustomIconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icons.close,
                  iconColor: Colors.white,
                )
              ],
            ),
            Divider(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            const SizedBox(
              width: 20,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        );
      },
    );
  }
    void pickEmail(context) {
    showBottomSheet(
      backgroundColor: const Color.fromRGBO(44, 61, 108, 1),
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const ShortHBar(),
            Row(
              children: [
                SizedBox(
                  width: 20,
                ),
                Text(
                  'Edit Email',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const Spacer(),
                CustomIconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icons.close,
                  iconColor: Colors.white,
                )
              ],
            ),
            Divider(
              color: const Color.fromARGB(255, 255, 255, 255),
            ),
            const SizedBox(
              width: 20,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
        );
      },
    );
  }
}
