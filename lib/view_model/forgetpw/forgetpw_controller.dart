import 'package:dattingapp/utils/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';

class ForgetpwController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void Forgetpw(BuildContext context, String email) async {
    setLoading(true);
    try {
      await auth
          .sendPasswordResetEmail(
        email: email,
      )
          .then((value) {
        setLoading(false);
        Navigator.pushNamed(context, RouteName.loginScreen);
        Utils.toasstMessage("Please check your email to recover your password");
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toasstMessage("Email Belum Terdaftar");
      });
    } catch (e) {
      setLoading(false);

      Utils.toasstMessage(e.toString());
    }
  }
}
