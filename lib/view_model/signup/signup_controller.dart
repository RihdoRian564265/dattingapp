import 'package:dattingapp/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class SignUpController with ChangeNotifier {
DatabaseReference ref = FirebaseDatabase.instance.ref().child("User");

 FirebaseAuth auth = FirebaseAuth.instance;
 bool _loading = false;
bool get loading => _loading;


 setLoading(bool value){
  _loading = value; 
  notifyListeners();
 }
 

void signUp(BuildContext context, username, String email, String password){
  setLoading(true);
  try{ 
    auth.createUserWithEmailAndPassword(
      email: email, 
      password: password
      ).then((value){

        ref.child(value.user!.uid.toString()).set({
          'uid': value.user!.uid.toString(),
          'email': value.user!.email.toString(),
          'onlineStatus':'noOne',
          'phone': '' ,
          'userName': username,
          'profile': '' 
        }).then((value){
          
          setLoading(false);
        }).onError((error, stackTrace){
          setLoading(false);
          Utils.toasstMessage(error.toString());
        });
        
        setLoading(false);
        Navigator.pushNamed(context, '/profil');
      }).onError((error, stackTrace){
        setLoading(false);
        Utils.toasstMessage(error.toString());
      });


  }catch(e){
    setLoading(false);
    Utils.toasstMessage(e.toString());
  }

}


}