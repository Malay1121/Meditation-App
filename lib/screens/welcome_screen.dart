import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/choose_topic.dart';
import 'package:meditation_app/screens/login.dart';
import 'package:meditation_app/screens/reminders.dart';
import 'package:meditation_app/screens/sign_up_in.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      FirebaseFirestore.instance
          .collection('users')
          .where('uid', isEqualTo: auth.currentUser!.uid)
          .get()
          .then((value) {
        setState(() {
          username = value.docs[0]['username'];
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: purple,
      body: Center(
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Container(
                width: _mediaQuery.width,
                height: _mediaQuery.height / 1.56097560976,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/welcome_background.png'),
                  ),
                ),
              ),
            ),
            Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: _mediaQuery.height / 5.78064516129,
                  ),
                  FadeIn(
                    preferences: AnimationPreferences(
                      offset: Duration(milliseconds: 0),
                      duration: Duration(milliseconds: 3000),
                    ),
                    child: Text(
                      'Hi $username, Welcome',
                      style: TextStyle(
                        fontFamily: neue,
                        fontSize: _mediaQuery.width / 13.8,
                        fontWeight: FontWeight.w600,
                        color: Color(0xFFFFECCC),
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(0, 4),
                          ),
                        ],
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  FadeIn(
                    preferences: AnimationPreferences(
                      offset: Duration(milliseconds: 1000),
                      duration: Duration(milliseconds: 3000),
                    ),
                    child: Text(
                      'to Silent Moon',
                      style: TextStyle(
                        fontFamily: neue,
                        fontSize: _mediaQuery.width / 13.8,
                        fontWeight: FontWeight.w100,
                        color: Color(0xFFFFECCC),
                        shadows: [
                          Shadow(
                            color: Colors.black.withOpacity(0.25),
                            offset: Offset(0, 4),
                          ),
                        ],
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 59.7333333333,
                  ),
                  SizedBox(
                    width: _mediaQuery.width / 1.30599369085,
                    child: ZoomIn(
                      preferences: AnimationPreferences(
                        offset: Duration(milliseconds: 1000),
                        duration: Duration(milliseconds: 3000),
                      ),
                      child: Text(
                        'Explore the app, Find some peace of mind to prepare for meditation.',
                        style: TextStyle(
                          fontFamily: neue,
                          fontSize: _mediaQuery.width / 25.875,
                          fontWeight: FontWeight.w100,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 9.33333333333,
                  ),
                  JackInTheBox(
                    preferences: AnimationPreferences(
                      offset: Duration(milliseconds: 1500),
                      duration: Duration(milliseconds: 3000),
                    ),
                    child: Container(
                      width: _mediaQuery.width / 1.63986374079,
                      height: _mediaQuery.height / 3.61596513176,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage('assets/lady2.png'),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: _mediaQuery.height / 9.51066765736,
                  ),
                  Buttons(
                    widget: widget,
                    mediaQuery: _mediaQuery,
                    title: 'Get Started',
                    bgColor: Color(0xFFEBEAEC),
                    textColor: greyTitle,
                    enterPage: ChooseTopic(),
                    animationStart: 3000,
                    signinup: false,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
