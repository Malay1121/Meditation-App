import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:meditation_app/models/user_model.dart';
import 'package:meditation_app/screens/welcome_screen.dart';

import '../constants.dart';
import 'login.dart';
import 'sign_up_in.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

TextEditingController usernameController = TextEditingController();
TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

class _SignUpState extends State<SignUp> {
  bool privacy = false;
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
                  'Create your account  ',
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
                  enterPage: SignUp(),
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
                  enterPage: SignUp(),
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
                    hint: 'Username',
                    controller: usernameController,
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
                    hint: 'Email',
                    email: true,
                    controller: emailController,
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height / 44.8,
                ),
                FadeInRight(
                  preferences: AnimationPreferences(
                    duration: Duration(milliseconds: 500),
                    offset: Duration(milliseconds: 2500),
                  ),
                  child: UserInput(
                    mediaQuery: _mediaQuery,
                    hint: 'Password',
                    password: false,
                    controller: passwordController,
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height / 59.7333333333,
                ),
                SizedBox(
                  width: _mediaQuery.width / 1.10695187166,
                  child: Row(
                    children: [
                      RotateIn(
                        preferences: AnimationPreferences(
                          duration: Duration(milliseconds: 500),
                          offset: Duration(milliseconds: 3500),
                        ),
                        child: RichText(
                          text: TextSpan(
                            text: 'I have read the ',
                            style: TextStyle(
                              fontFamily: neue,
                              color: grey,
                              fontSize: _mediaQuery.width / 29.5714285714,
                            ),
                            children: [
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: purple,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Spacer(),
                      RollIn(
                        preferences: AnimationPreferences(
                          duration: Duration(milliseconds: 500),
                          offset: Duration(milliseconds: 3500),
                        ),
                        child: GestureDetector(
                          onTap: () {
                            if (privacy == true) {
                              setState(() {
                                privacy = false;
                              });
                            } else if (privacy == false) {
                              setState(() {
                                privacy = true;
                              });
                            }
                          },
                          child: Container(
                            width: _mediaQuery.width / 17.1286719073,
                            height: _mediaQuery.width / 17.1286719073,
                            decoration: BoxDecoration(
                              color: privacy == true ? purple : Colors.white,
                              border: Border.all(
                                width: 2,
                                color: privacy == true ? purple : grey,
                              ),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: privacy == true
                                ? Center(
                                    child: Icon(
                                      Icons.done,
                                      size: _mediaQuery.width / 25.875,
                                      color: Colors.white,
                                    ),
                                  )
                                : null,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: _mediaQuery.width / 41.4,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height / 29.8666666667,
                ),
                Buttons(
                  widget: widget,
                  mediaQuery: _mediaQuery,
                  title: 'Sign up'.toUpperCase(),
                  bgColor: purple,
                  textColor: white,
                  enterPage: Container(),
                  animationStart: 3000,
                  signinup: false,
                  signup: true,
                  disableNavigation: true,
                ),
                SizedBox(
                  height: _mediaQuery.height / 44.8,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

void signUp(String email, String password, context) async {
  await auth
      .createUserWithEmailAndPassword(email: email, password: password)
      .then((value) => {postDetailsToFirestore(context)});
}

postDetailsToFirestore(context) async {
  User? user = auth.currentUser;

  UserModel userModel = UserModel();

  userModel.email = user!.email;
  userModel.username = usernameController.text;
  userModel.uid = user.uid;

  await firebaseFirestore
      .collection('users')
      .doc(user.uid)
      .set(userModel.toMap());

  Navigator.pushReplacement(
    context,
    AwesomePageRoute(
        exitPage: SignUp(),
        enterPage: WelcomeScreen(),
        transitionDuration: Duration(
          milliseconds: 1000,
        ),
        transition: StackTransition()),
  );
}

class UserInput extends StatelessWidget {
  const UserInput({
    Key? key,
    required Size mediaQuery,
    required this.hint,
    required this.controller,
    this.password = false,
    this.email = false,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String hint;
  final TextEditingController controller;
  final bool password;
  final bool email;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _mediaQuery.width / 1.10106382979,
      height: _mediaQuery.height / 14.2222222222,
      child: TextFormField(
        obscureText: password == true ? true : false,
        keyboardType:
            email == true ? TextInputType.emailAddress : TextInputType.text,
        controller: controller,
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
