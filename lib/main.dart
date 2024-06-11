import 'package:dattingapp/authenticationScreen/getstarted_screen.dart';
import 'package:dattingapp/authenticationScreen/loading_screen.dart';
import 'package:dattingapp/profile_screen.dart';
import 'package:dattingapp/res/color.dart';
import 'package:dattingapp/res/fonts.dart';
import 'package:dattingapp/view/ForgetPw/forgetpw_screen.dart';
import 'package:dattingapp/view/login/login_screen.dart';
import 'package:dattingapp/view/signup/sign_up_screen.dart';
import 'package:dattingapp/view/splash/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';


Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Flutter Firebase',
      theme: ThemeData(
        primarySwatch: AppColors.primaryMaterialColor,
        scaffoldBackgroundColor: AppColors.backgroundColor,
      appBarTheme: const AppBarTheme(
        color: AppColors.whiteColor,
        centerTitle: true,
        titleTextStyle: TextStyle(fontSize: 22, fontFamily: AppFonts.sfProDisplayMedium,color: AppColors.primaryTextTextColor)
      ),
      textTheme: TextTheme(
        displayLarge : TextStyle(fontSize: 40, fontFamily: AppFonts.sfProDisplayMedium,color: const Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.w500,height: 1.6),
        displayMedium : TextStyle(fontSize: 32, fontFamily: AppFonts.sfProDisplayMedium,color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.w500,height: 1.6),
        displaySmall : TextStyle(fontSize: 30, fontFamily: AppFonts.sfProDisplayMedium,color: const Color.fromARGB(255, 240, 240, 240), fontWeight: FontWeight.w500,height: 1.9),
        headlineMedium : TextStyle(fontSize: 24, fontFamily: AppFonts.sfProDisplayMedium,color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.w500,height: 1.6),
        headlineSmall : TextStyle(fontSize: 19, fontFamily: AppFonts.sfProDisplayMedium,color: Color.fromARGB(255, 224, 224, 224), fontWeight: FontWeight.w500,height: 1.6),
        titleLarge : TextStyle(fontSize: 17, fontFamily: AppFonts.sfProDisplayBold,color: Color.fromARGB(237, 255, 255, 255), fontWeight: FontWeight.w700,height: 1.6),

        bodyLarge : TextStyle(fontSize: 17, fontFamily: AppFonts.sfProDisplayMedium,color: Color.fromARGB(255, 255, 255, 255), fontWeight: FontWeight.w700,height: 1.6),
        bodyMedium : TextStyle(fontSize: 14, fontFamily: AppFonts.sfProDisplayMedium,color: Color.fromARGB(255, 255, 253, 253),height: 1.6),
        
        bodySmall : TextStyle(fontSize: 12, fontFamily: AppFonts.sfProDisplayMedium,color: Color.fromARGB(255, 255, 255, 255),height: 2.26)

        
        
        )
      

      ),     
       routes: {
        '/': (context) => SplashScreen(
          // Here, you can decide whether to show the LoginPage or HomePage based on user authentication
          child: GetstartedScreen(),
        ),
        '/loading': (context) => LoadingScreen(),
        '/profil': (context) => ProfileScreen(),
        '/login': (context) => LoginScreen(),
        '/signUp': (context) => SignUpScreen(),
        '/forget': (context) => ForgetpwScreen(),


      },
    
    );  
    
  }
}