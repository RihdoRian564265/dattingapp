import 'dart:async';

import 'package:dattingapp/res/component/input_text_field.dart';
import 'package:dattingapp/res/component/round_botoon.dart';
import 'package:dattingapp/view/login/login_screen.dart';
import 'package:dattingapp/view_model/forgetpw/forgetpw_controller.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class ForgetpwScreen extends StatefulWidget {
  const ForgetpwScreen({super.key});

  @override
  State<ForgetpwScreen> createState() => _ForgetpwScreenState();
}

class _ForgetpwScreenState extends State<ForgetpwScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailControllor = TextEditingController();

  final emailFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailControllor.dispose();
    emailFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: const Color(0xFF333333),
      appBar: AppBar(
        backgroundColor: const Color(0xFF333333),
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
              color: const Color.fromARGB(255, 255, 255, 255)),
          onPressed: () {
            Navigator.of(context).push(
              PageTransition(
                child: LoginScreen(),
                type: PageTransitionType.leftToRight,
              ),
            );
          },
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.symmetric(
              horizontal: 20, vertical: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * .12,
                ),
                Text(
                  'Reset Password in Here',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: height * .02,
                ),
                Text(
                  'Enter your email address\nto Reset Password your account',
                  style: Theme.of(context).textTheme.bodyMedium,
                  textAlign: TextAlign.center,
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: height * .06, bottom: height * 0.01),
                    child: Column(
                      children: [
                        InputTextField(
                            enable: true,
                            myController: emailControllor,
                            focusNode: emailFocusNode,
                            onFieldSubmittedValue: (value) {},
                            keyboardType: TextInputType.emailAddress,
                            isPasswordField: false,
                            hint: 'Email',
                            onValidator: (value) {
                              return value.isEmpty ? 'Enter Email' : null;
                            }),
                        SizedBox(
                          height: height * 0.01,
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                ChangeNotifierProvider(
                  create: (_) => ForgetpwController(),
                  child: Consumer<ForgetpwController>(
                    builder: (context, provider, child) {
                      return RoundBotoon(
                        title: 'Login',
                        loading: provider.loading,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            provider.Forgetpw(context, emailControllor.text);
                          } else {
                            Timer(
                              Duration(seconds: 1),
                              () => Navigator.of(context).push(
                                PageTransition(
                                  child: ForgetpwScreen(),
                                  type: PageTransitionType.fade,
                                ),
                              ),
                            );
                          }
                        },
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: height * 0.03,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
