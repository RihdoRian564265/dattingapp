import 'dart:async';

import 'package:dattingapp/utils/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, RouteName.loginScreen);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF333333),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 414,
                height: 100,
                clipBehavior: Clip.antiAlias,
                decoration:
                    const BoxDecoration(color: Color.fromRGBO(51, 51, 51, 1)),
                child: Stack(
                  children: [
                    const Center(
                      child: Positioned(
                        child: SpinKitRing(
                          color: Color.fromRGBO(44, 61, 108, 1),
                          size: 80,
                        ),
                      ),
                    ),
                    Center(
                      child: Positioned(
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/LogoTangan.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
