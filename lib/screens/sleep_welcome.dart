import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/sign_up_in.dart';
import 'package:meditation_app/screens/sleep_home.dart';

class SleepWelcome extends StatefulWidget {
  const SleepWelcome({Key? key}) : super(key: key);

  @override
  State<SleepWelcome> createState() => _SleepWelcomeState();
}

class _SleepWelcomeState extends State<SleepWelcome> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkBlue,
      body: Stack(
        children: [
          Container(
            height: _mediaQuery.height,
            width: _mediaQuery.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(
                  'assets/sleep_welcome.png',
                ),
              ),
            ),
          ),
          Positioned(
            right: 1,
            top: _mediaQuery.height / 2.48888889,
            child: SlideInRight(
              preferences: AnimationPreferences(
                offset: Duration(
                  milliseconds: 500,
                ),
                duration: Duration(
                  milliseconds: 500,
                ),
              ),
              child: Container(
                width: _mediaQuery.width / 1.12195122,
                height: _mediaQuery.height / 3.91266376,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage(
                      'assets/sleep_asset1.png',
                    ),
                  ),
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              children: [
                SizedBox(
                  height: _mediaQuery.height / 5.78064516,
                ),
                Text(
                  'Welcome to Sleep',
                  style: TextStyle(
                      color: Color(0xFFE6E7F2),
                      fontSize: _mediaQuery.width / 13.8,
                      fontWeight: FontWeight.w700,
                      fontFamily: neue),
                ),
                SizedBox(
                  height: _mediaQuery.height / 59.7333333,
                ),
                SizedBox(
                  width: _mediaQuery.width / 1.30599369,
                  child: Text(
                    'Explore the new king of sleep. It uses sound and vesualization to create perfect conditions for refreshing sleep.',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFFEBEAEC),
                      fontFamily: neue,
                      fontSize: _mediaQuery.width / 25.87500,
                    ),
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height / 2.99603466 * 1.4,
                ),
                Buttons(
                  widget: widget,
                  mediaQuery: _mediaQuery,
                  title: 'Get Started',
                  bgColor: purple,
                  textColor: Colors.white,
                  enterPage: SleepHome(),
                  animationStart: 1000,
                  signinup: false,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
