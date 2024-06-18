import 'package:dattingapp/utils/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../services/session_manager.dart';

class LoginController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void Login(BuildContext context, String email, String password) async {
    setLoading(true);
    try {
      await auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
            SessionController().userId = value.user!.uid.toString();
        setLoading(false);
        Navigator.pushNamed(context, RouteName.profil);
        Utils.toasstMessage("Anda Berhasil logged in!");
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toasstMessage("Email/Password Salah!");
      });
    } catch (e) {
      setLoading(false);
      
      Utils.toasstMessage(e.toString());
      
    }
  }
}
