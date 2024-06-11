import 'package:dattingapp/res/color.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Utils {
  
  static void fieldFocus(BuildContext context, FocusNode currentNode, FocusNode nextFocus){
    currentNode.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);

  }

  static toasstMessage(String message){
  Fluttertoast.showToast(
      
      msg: message,
      backgroundColor: AppColors.primaryColor,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

}