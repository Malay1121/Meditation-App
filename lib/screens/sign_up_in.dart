import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/login.dart';
import 'package:meditation_app/screens/reminders.dart';
import 'package:meditation_app/screens/signup.dart';

class Signupin extends StatefulWidget {
  const Signupin({Key? key}) : super(key: key);

  @override
  _SignupinState createState() => _SignupinState();
}

class _SignupinState extends State<Signupin> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: _mediaQuery.height / 1.78131212724,
                width: _mediaQuery.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/welcome_asset.png',
                    ),
                  ),
                ),
              ),
              Positioned(
                top: _mediaQuery.height / 5.5652173913,
                left: _mediaQuery.width / 9.97590361446,
                child: BounceInDown(
                  preferences: AnimationPreferences(
                    offset: Duration(milliseconds: 500),
                    duration: Duration(milliseconds: 500),
                  ),
                  child: Container(
                    height: _mediaQuery.height / 3.86606834657,
                    width: _mediaQuery.width / 7.27720161716,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/lamp.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: _mediaQuery.height / 4.08126081807,
                left: _mediaQuery.width / 6.30136986301,
                child: FadeInLeft(
                  preferences: AnimationPreferences(
                    offset: Duration(milliseconds: 1000),
                    duration: Duration(milliseconds: 500),
                  ),
                  child: Container(
                    height: _mediaQuery.height / 5.12322030991,
                    width: _mediaQuery.width / 6.65380906461,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/plant.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: _mediaQuery.height / 3.84648407315,
                left: _mediaQuery.width / 3.20284697509,
                child: Bounce(
                  preferences: AnimationPreferences(
                    offset: Duration(milliseconds: 1500),
                    duration: Duration(milliseconds: 500),
                  ),
                  child: Container(
                    height: _mediaQuery.height / 5.52813425469,
                    width: _mediaQuery.width / 1.97547358878,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/lady.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: _mediaQuery.height / 4.20598037835,
                left: _mediaQuery.width / 8.90322580645,
                child: BounceInRight(
                  preferences: AnimationPreferences(
                    offset: Duration(milliseconds: 2000),
                    duration: Duration(milliseconds: 500),
                  ),
                  child: Container(
                    height: _mediaQuery.height / 4.82238966631,
                    width: _mediaQuery.width / 1.26846007721,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/other_plants.png'),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: _mediaQuery.height / 2.29696472518,
                left: _mediaQuery.width / 10.1744900467,
                child: Container(
                  height: _mediaQuery.height / 65.8339456282,
                  width: _mediaQuery.width / 1.26042744931,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage('assets/shadow.png'),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: _mediaQuery.height / 28,
          ),
          LightSpeedIn(
            preferences: AnimationPreferences(
              offset: Duration(milliseconds: 2500),
              duration: Duration(milliseconds: 500),
            ),
            child: Text(
              'We are what we do',
              style: TextStyle(
                fontFamily: neue,
                fontSize: _mediaQuery.width / 13.8,
                fontWeight: FontWeight.bold,
                color: greyTitle,
              ),
            ),
          ),
          SizedBox(
            height: _mediaQuery.height / 59.7333333333,
          ),
          ZoomIn(
            preferences: AnimationPreferences(
              offset: Duration(milliseconds: 3000),
              duration: Duration(milliseconds: 500),
            ),
            child: SizedBox(
              width: _mediaQuery.width / 1.38926174497,
              child: Text(
                'Thousand of people are usign silent moon for smalls meditation',
                style: TextStyle(
                  color: grey,
                  fontFamily: neue,
                  fontSize: _mediaQuery.width / 25.875,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          SizedBox(
            height: _mediaQuery.height / 14.4516129032,
          ),
          Buttons(
            widget: widget,
            mediaQuery: _mediaQuery,
            bgColor: purple,
            title: 'SIGN UP',
            textColor: white,
            enterPage: SignUp(),
            animationStart: 3500,
            signinup: false,
          ),
          SizedBox(
            height: _mediaQuery.height / 44.8,
          ),
          RotateInUpRight(
            preferences: AnimationPreferences(
              offset: Duration(milliseconds: 4000),
              duration: Duration(milliseconds: 500),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  AwesomePageRoute(
                      exitPage: widget,
                      enterPage: Login(),
                      transitionDuration: Duration(
                        milliseconds: 1000,
                      ),
                      transition: StackTransition()),
                );
              },
              child: RichText(
                text: TextSpan(
                  text: 'Already have an account?'.toUpperCase(),
                  style: TextStyle(
                    fontFamily: neue,
                    color: grey,
                    fontSize: _mediaQuery.width / 29.5714285714,
                  ),
                  children: [
                    TextSpan(
                      text: ' log in'.toUpperCase(),
                      style: TextStyle(
                        color: purple,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void Null() {}

class Buttons extends StatelessWidget {
  const Buttons({
    Key? key,
    required this.widget,
    required Size mediaQuery,
    required this.title,
    required this.bgColor,
    required this.textColor,
    required this.enterPage,
    required this.animationStart,
    required this.signinup,
    this.signup = false,
    this.facebook = true,
    this.disableNavigation = false,
    this.login = false,
    this.reminder = false,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Widget widget;
  final Size _mediaQuery;
  final String title;
  final Color bgColor;
  final Color textColor;
  final Widget enterPage;
  final int animationStart;
  final bool signinup;
  final bool facebook;
  final bool signup;
  final bool disableNavigation;
  final bool login;
  final bool reminder;

  @override
  Widget build(BuildContext context) {
    return JackInTheBox(
      preferences: AnimationPreferences(
        offset: Duration(milliseconds: animationStart),
        duration: Duration(milliseconds: 500),
      ),
      child: GestureDetector(
        onTap: () async {
          await signup == true
              ? signUp(emailController.text, passwordController.text, context)
              : null;
          await login == true
              ? logIn(emailControllerLogin.text, passwordControllerLogin.text,
                  context)
              : null;
          await reminder == true ? Add2Calendar.addEvent2Cal(event) : null;
          disableNavigation == true
              ? null
              : Navigator.push(
                  context,
                  AwesomePageRoute(
                      exitPage: widget,
                      enterPage: enterPage,
                      transitionDuration: Duration(
                        milliseconds: 1000,
                      ),
                      transition: StackTransition()),
                );
        },
        child: Container(
          width: _mediaQuery.width / 1.10695187166,
          height: _mediaQuery.height / 14.2222222222,
          decoration: BoxDecoration(
            color: bgColor,
            borderRadius: BorderRadius.circular(
              38,
            ),
            border: facebook == true
                ? null
                : Border.all(
                    color: Color(0xFFEBEAEC),
                    width: 1,
                  ),
          ),
          child: Center(
            child: Row(
              children: [
                Row(
                  children: [
                    signinup == true
                        ? Row(
                            children: [
                              SizedBox(
                                width: _mediaQuery.width / 11.8828932262,
                              ),
                              facebook == true
                                  ? Icon(
                                      FontAwesomeIcons.facebookF,
                                      color: Colors.white,
                                      size: _mediaQuery.width / 17.25,
                                    )
                                  : SvgPicture.asset(
                                      'assets/google.svg',
                                      width: _mediaQuery.width / 17.25,
                                      height: _mediaQuery.width / 17.25,
                                    ),
                              SizedBox(
                                width: _mediaQuery.width / 9.04325032765,
                              ),
                              Text(
                                title.toUpperCase(),
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: _mediaQuery.width / 29.5714285714,
                                  fontFamily: neue,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              SizedBox(
                                width: _mediaQuery.width / 2.65384615385,
                              ),
                              Text(
                                title.toUpperCase(),
                                style: TextStyle(
                                  color: textColor,
                                  fontSize: _mediaQuery.width / 29.5714285714,
                                  fontFamily: neue,
                                ),
                              ),
                            ],
                          ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
