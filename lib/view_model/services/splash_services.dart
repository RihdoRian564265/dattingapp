import 'dart:async';

import 'package:dattingapp/utils/routes/route_name.dart';
import 'package:dattingapp/view_model/services/session_manager.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SplashServices {


  void isLogin(BuildContext context){
FirebaseAuth auth = FirebaseAuth.instance;

final User = auth.currentUser;

if(User != null){
  SessionController().userId = User.uid.toString();
Timer(Duration(seconds: 3), ()=> Navigator.pushNamed(context ,RouteName.profil));
}else if(User != null){
  SessionController().userId = User.uid.toString();
Timer(Duration(seconds: 3), ()=> Navigator.pushNamed(context ,RouteName.loginScreen));

}else{
  Timer(Duration(seconds: 3), ()=> Navigator.pushNamed(context ,RouteName.getStart));
}

  }
}