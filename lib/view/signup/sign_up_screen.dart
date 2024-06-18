import 'dart:async';

import 'package:dattingapp/res/component/input_text_field.dart';
import 'package:dattingapp/res/component/round_botoon.dart';
import 'package:dattingapp/utils/utils.dart';
import 'package:dattingapp/view/login/login_screen.dart';
import 'package:dattingapp/view_model/signup/signup_controller.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final usernameFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
    usernameController.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    usernameFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(
                horizontal: 20, vertical: 10),
            child: ChangeNotifierProvider(
              create: (_) => SignUpController(),
              child: Consumer<SignUpController>(
                  builder: (context, provider, child) {
                return SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: height * .15,
                      ),
                      Text(
                        'Create an Account',
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                      SizedBox(
                        height: height * .01,
                      ),
                      Text(
                        'Enter your username,email address and password\nto Create your account',
                        style: Theme.of(context).textTheme.bodyMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: height * .01,
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
                                  myController: usernameController,
                                  focusNode: usernameFocusNode,
                                  onFieldSubmittedValue: (value) {},
                                  keyboardType: TextInputType.emailAddress,
                                  isPasswordField: false,
                                  hint: 'Username',
                                  onValidator: (value) {
                                    return value.isEmpty
                                        ? 'Enter Username'
                                        : null;
                                  }),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              InputTextField(
                                  enable: true,
                                  myController: emailController,
                                  focusNode: emailFocusNode,
                                  onFieldSubmittedValue: (value) {
                                    Utils.fieldFocus(context, emailFocusNode,
                                        passwordFocusNode);
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  isPasswordField: false,
                                  hint: 'Email',
                                  onValidator: (value) {
                                    return value.isEmpty ? 'Enter Email' : null;
                                  }),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              InputTextField(
                                  enable: true,
                                  myController: passwordController,
                                  focusNode: passwordFocusNode,
                                  onFieldSubmittedValue: (value) {},
                                  keyboardType: TextInputType.visiblePassword,
                                  isPasswordField: true,
                                  hint: 'Password',
                                  onValidator: (value) {
                                    return value.isEmpty
                                        ? 'Enter Password'
                                        : null;
                                  })
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      RoundBotoon(
                        title: 'Sign Up',
                        loading: provider.loading,
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            provider.signUp(context, usernameController.text,
                                emailController.text, passwordController.text);
                          } else {
                            Timer(
                              Duration(seconds: 1),
                              () => Navigator.of(context).push(
                                PageTransition(
                                  child: SignUpScreen(),
                                  type: PageTransitionType.fade,
                                ),
                              ),
                            );
                          }
                        },
                      ),
                      SizedBox(
                        height: height * 0.03,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageTransition(
                              child: LoginScreen(),
                              type: PageTransitionType.fade,
                            ),
                          );
                        },
                        child: Text.rich(
                          TextSpan(
                            text: "Already have an account? ",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(fontSize: 14),
                            children: [
                              TextSpan(
                                  text: 'LogIn',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(
                                          fontSize: 14,
                                          decoration:
                                              TextDecoration.underline)),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              }),
            )),
      ),
    );
  }
}
