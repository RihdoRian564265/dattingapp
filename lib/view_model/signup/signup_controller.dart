
import 'package:dattingapp/utils/routes/route_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import '../../utils/utils.dart';
import '../services/session_manager.dart';

class SignUpController with ChangeNotifier {
  FirebaseAuth auth = FirebaseAuth.instance;
  final DatabaseReference dbref = FirebaseDatabase.instance.ref().child("User");

  bool _loading = false;
  bool get loading => _loading;

  setLoading(bool value) {
    _loading = value;
    notifyListeners();
  }

  void signUp(
      BuildContext context, username, String email, String password) async {
    setLoading(true);
    try {
      await auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) {
            SessionController().userId = value.user!.uid.toString();
        dbref.child(value.user!.uid.toString()).set({
          'Uid': value.user!.uid.toString(),
          'Email': value.user!.email.toString(),
          'OnlineStatus': false,
          'Phone': '',
          'UserName': username,
          'Profile': ''
        }).then((value) {
          setLoading(false);
        }).onError((error, stackTrace) {
          setLoading(false);
          Utils.toasstMessage(error.toString());
        });

        setLoading(false);
        Navigator.pushNamed(context, RouteName.loginScreen);
      }).onError((error, stackTrace) {
        setLoading(false);
        Utils.toasstMessage(error.toString());
      });
    } catch (e) {
      setLoading(false);
      Utils.toasstMessage(e.toString());
    }
  }
}
