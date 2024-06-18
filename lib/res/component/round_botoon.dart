
import 'package:dattingapp/res/color.dart';
import 'package:flutter/material.dart';

class RoundBotoon extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;
  final Color color, textColor;
  final bool loading;
  const RoundBotoon({Key? key,
   required this.title,
   required this.onPressed,
   this.textColor = Colors.white,
   this.color =  AppColors.primaryColor,
   this.loading = false
  




   }):super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: loading ? null : onPressed,
      child: Container(
        height: 50 ,
        width: double.infinity,
        decoration: BoxDecoration(
          
          color:  color,
          borderRadius: BorderRadius.circular(50)
        ),
        child:loading ? Center(child: CircularProgressIndicator(color: Colors.white,)) : Center(child: Text(title, 
        style: Theme.of(context).textTheme.headlineMedium!.copyWith(fontSize: 20,color: textColor),))),
      );
    
  }
}