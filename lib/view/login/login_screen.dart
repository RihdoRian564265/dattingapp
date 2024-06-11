import 'package:dattingapp/res/component/input_text_field.dart';
import 'package:dattingapp/res/component/round_botoon.dart';
// import 'package:dattingapp/view/ForgetPw/forgetpw_screen.dart';
// import 'package:dattingapp/view/signup/sign_up_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailControllor = TextEditingController();
  final passwoardControllor = TextEditingController();

  final emailFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    emailControllor.dispose();
    passwoardControllor.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
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
                  height: height * .15,
                ),
                Text(
                  'Welcome to App',
                  style: Theme.of(context).textTheme.displaySmall,
                ),
                SizedBox(
                  height: height * .01,
                ),
                Text(
                  'Enter your email address\nto connect your account',
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
                          height: height * 0.02,
                        ),
                        InputTextField(
                            enable: true,
                            myController: passwoardControllor,
                            focusNode: passwordFocusNode,
                            onFieldSubmittedValue: (value) {},
                            keyboardType: TextInputType.visiblePassword,
                            isPasswordField: true,
                            hint: 'Password',
                            onValidator: (value) {
                              return value.isEmpty ? 'Enter Pas' : null;
                            }),
                                                    SizedBox(
                          height: height * 0.02,
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
            
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      'Forget Password',
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          fontSize: 14, decoration: TextDecoration.underline),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                RoundBotoon(
                  title: 'Login',
                  loading: false,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {

                    }
                  },
                ),
                SizedBox(
                  height: height * 0.03,
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/signUp');
                  },
                  child: Text.rich(
                    TextSpan(
                      text: "Don't have an account? ",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(fontSize: 14),
                      children: [
                        TextSpan(
                            text: 'Sing Up',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    fontSize: 14,
                                    decoration: TextDecoration.underline)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
