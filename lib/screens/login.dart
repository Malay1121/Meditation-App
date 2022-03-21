import 'dart:math';

import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/signup.dart';
import 'package:meditation_app/screens/welcome_screen.dart';

import 'sign_up_in.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

TextEditingController emailControllerLogin = TextEditingController();
TextEditingController passwordControllerLogin = TextEditingController();

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Column(
            children: [
              Row(
                children: [
                  BounceInLeft(
                    child: Container(
                      width: _mediaQuery.width / 2.54612546125,
                      height: _mediaQuery.height / 7.92920353982,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/login_background1.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  BounceInRight(
                    child: Container(
                      width: _mediaQuery.width / 2.54612546125,
                      height: _mediaQuery.height / 7.92920353982,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/login_background2.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: _mediaQuery.height / 15.7192982456,
              ),
              Row(
                children: [
                  BounceInDown(
                    child: Container(
                      width: _mediaQuery.width / 2.54612546125,
                      height: _mediaQuery.height / 7.92920353982,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/login_background3.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                  Spacer(),
                  BounceInDown(
                    child: Container(
                      width: _mediaQuery.width / 2.54612546125,
                      height: _mediaQuery.height / 7.92920353982,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            'assets/login_background4.png',
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: _mediaQuery.height / 17.92,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                        left: _mediaQuery.width / 20.4545454545,
                      ),
                      child: RollIn(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: CircleAvatar(
                            radius: _mediaQuery.width / 15.3333333333 + 1,
                            backgroundColor: Color(0xFFEBEAEC),
                            child: CircleAvatar(
                              child: Icon(
                                Icons.arrow_back,
                                color: Colors.black,
                              ),
                              backgroundColor: Colors.white,
                              radius: _mediaQuery.width / 15.3333333333,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _mediaQuery.height / 32.2766570605,
                ),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                    color: greyTitle,
                    fontWeight: FontWeight.bold,
                    fontSize: _mediaQuery.width / 14.7857142857,
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height / 27.1515151515,
                ),
                Buttons(
                  widget: widget,
                  mediaQuery: _mediaQuery,
                  bgColor: facebook,
                  title: 'Continue with facebook',
                  textColor: white,
                  enterPage: Login(),
                  animationStart: 500,
                  signinup: true,
                ),
                SizedBox(
                  height: _mediaQuery.height / 44.8,
                ),
                Buttons(
                  widget: widget,
                  mediaQuery: _mediaQuery,
                  bgColor: Colors.white,
                  title: 'CONTINUE WITH GOOGLE',
                  textColor: greyTitle,
                  enterPage: Login(),
                  animationStart: 500,
                  signinup: true,
                  facebook: false,
                ),
                SizedBox(
                  height: _mediaQuery.height / 22.4,
                ),
                LightSpeedIn(
                  preferences: AnimationPreferences(
                    duration: Duration(milliseconds: 500),
                    offset: Duration(milliseconds: 1000),
                  ),
                  child: Text(
                    'OR LOG IN WITH EMAIL'.toUpperCase(),
                    style: TextStyle(
                      color: greySubtitle,
                      fontWeight: FontWeight.bold,
                      fontFamily: neue,
                      fontSize: _mediaQuery.width / 29.5714285714,
                    ),
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height / 22.4,
                ),
                FadeInRight(
                  preferences: AnimationPreferences(
                    duration: Duration(milliseconds: 500),
                    offset: Duration(milliseconds: 1500),
                  ),
                  child: UserInput(
                    mediaQuery: _mediaQuery,
                    hint: 'Email address',
                    controller: emailControllerLogin,
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height / 44.8,
                ),
                FadeInLeft(
                  preferences: AnimationPreferences(
                    duration: Duration(milliseconds: 500),
                    offset: Duration(milliseconds: 2000),
                  ),
                  child: UserInput(
                    mediaQuery: _mediaQuery,
                    hint: 'Password',
                    controller: passwordControllerLogin,
                    password: true,
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height / 29.8666666667,
                ),
                Buttons(
                  widget: widget,
                  mediaQuery: _mediaQuery,
                  title: 'Log in'.toUpperCase(),
                  bgColor: purple,
                  textColor: white,
                  enterPage: WelcomeScreen(),
                  animationStart: 2500,
                  signinup: false,
                  disableNavigation: true,
                  login: true,
                ),
                SizedBox(
                  height: _mediaQuery.height / 44.8,
                ),
                RotateIn(
                  preferences: AnimationPreferences(
                    duration: Duration(milliseconds: 500),
                    offset: Duration(milliseconds: 3000),
                  ),
                  child: Text(
                    'Forgot Password?',
                    style: TextStyle(
                      fontSize: _mediaQuery.width / 29.5714285714,
                      fontFamily: neue,
                      color: greyTitle,
                    ),
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height / 8.57170190376,
                ),
                BounceInUp(
                  preferences: AnimationPreferences(
                    duration: Duration(milliseconds: 500),
                    offset: Duration(milliseconds: 3500),
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        AwesomePageRoute(
                            exitPage: widget,
                            enterPage: SignUp(),
                            transitionDuration: Duration(
                              milliseconds: 1000,
                            ),
                            transition: StackTransition()),
                      );
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'Create an account?'.toUpperCase(),
                        style: TextStyle(
                          fontFamily: neue,
                          color: grey,
                          fontSize: _mediaQuery.width / 29.5714285714,
                        ),
                        children: [
                          TextSpan(
                            text: ' Sign up'.toUpperCase(),
                            style: TextStyle(
                              color: purple,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void logIn(String email, String password, context) async {
  await auth
      .signInWithEmailAndPassword(email: email, password: password)
      .then((value) {
    Navigator.pushReplacement(
        context,
        AwesomePageRoute(
            exitPage: SignUp(),
            enterPage: WelcomeScreen(),
            transitionDuration: Duration(
              milliseconds: 1000,
            ),
            transition: StackTransition()));
  });
}

class UserInput extends StatelessWidget {
  const UserInput({
    Key? key,
    required Size mediaQuery,
    required this.hint,
    this.password = false,
    required this.controller,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String hint;
  final bool password;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _mediaQuery.width / 1.10106382979,
      height: _mediaQuery.height / 14.2222222222,
      child: TextFormField(
        controller: controller,
        keyboardType:
            password == true ? TextInputType.text : TextInputType.emailAddress,
        obscureText: password == true ? true : false,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 0.15,
              color: Color(0xFFEBEAEC),
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 0.15,
              color: Color(0xFFEBEAEC),
            ),
          ),
          fillColor: Color(
            0xFFF2F3F7,
          ),
          filled: true,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 0.15,
              color: Color(0xFFEBEAEC),
            ),
          ),
          hintText: hint,
          hintStyle: TextStyle(
            color: greySubtitle,
            fontFamily: neue,
            fontSize: _mediaQuery.width / 25.875,
          ),
        ),
      ),
    );
  }
}
