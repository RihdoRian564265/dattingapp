import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  final Widget? child;
  const SplashScreen({super.key, this.child});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 3), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => widget.child!),
          (route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
             Image(image: AssetImage('images/LogoTangan.png',
             )),
              const Padding(
                padding:  EdgeInsets.symmetric(vertical: 20),
                child: Center(child: Text('M-Lovers' ,
                 style: TextStyle(color:Colors.white , fontSize: 40, fontWeight: FontWeight.w700),
                )),
              )
            ],
          )
      ),
    );
  }
}
