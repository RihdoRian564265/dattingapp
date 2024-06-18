import 'package:dattingapp/utils/routes/route_name.dart';
import 'package:flutter/material.dart';

class GetstartedScreen extends StatefulWidget {
  const GetstartedScreen({super.key});

  @override
  State<GetstartedScreen> createState() => _GetstartedScreenState();
}

class _GetstartedScreenState extends State<GetstartedScreen> {
  get buttonClicked => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: const Color(0xFF333333),
        body: Center(
          child: Container(
            width: 414,
            height: 896,
            padding: const EdgeInsets.only(
              top: 209,
              left: 60,
              right: 60,
              bottom: 300,
            ),
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFF333333)),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: 314,
                  height: 299,
                  child: Stack(
                    children: [
                      const Positioned(
                        left: 65,
                        top: 220,
                        child: Center(
                          child: Text(
                            'Find, Chat, Date with M-Lovers',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 40,
                        top: 0,
                        child: Container(
                          width: 250,
                          height: 240,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("images/LogoTangan.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                      Positioned(
                        left: 0,
                        top: 240,
                        child: Center(
                          child: SizedBox(
                            width: 291,
                            height: 58,
                            child: ElevatedButton(
                              onPressed: () {
                                Navigator.pushNamed(context, RouteName.loading);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromRGBO(44, 61, 108, 1),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 88, vertical: 20),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(6)),
                              ),
                              child: const Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'Let’s Started',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w600,
                                      height: 1,
                                    ),
                                  ),
                                ],
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
          ),
        ));
  }
}
