import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/choose_topic.dart';
import 'package:meditation_app/screens/home_screen.dart';
import 'package:meditation_app/screens/sign_up_in.dart';
import 'dart:io';

bool su = false;
bool m = true;
bool tu = true;
bool w = true;
bool th = true;
bool f = true;
bool sat = false;

class Reminders extends StatefulWidget {
  const Reminders({Key? key}) : super(key: key);

  @override
  RremindersState createState() => RremindersState();
}

var user = auth.currentUser;

var hour;
var minute;

class RremindersState extends State<Reminders> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: _mediaQuery.height / 10.9268293,
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _mediaQuery.width / 20.7,
                bottom: _mediaQuery.height / 89.6,
              ),
              child: Text(
                'What time would you\nlike to meditate?',
                style: TextStyle(
                  fontFamily: neue,
                  fontSize: _mediaQuery.width / 17.25,
                  fontWeight: FontWeight.bold,
                  color: greyTitle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _mediaQuery.width / 20.7,
                bottom: _mediaQuery.height / 35.84,
              ),
              child: Text(
                'Any time you can choose but We recommend first thing in th morning.',
                style: TextStyle(
                    color: grey,
                    fontSize: _mediaQuery.width / 25.87500,
                    fontWeight: FontWeight.w300),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _mediaQuery.width / 59.1428571,
                right: _mediaQuery.width / 59.1428571,
                bottom: _mediaQuery.height / 29.8666667,
              ),
              child: Container(
                  height: _mediaQuery.height / 4.22641509,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Color(0xFFF5F5F9),
                  ),
                  child: TimePickerSpinner(
                    is24HourMode: true,
                    onTimeChange: (time) {
                      print(time);
                      event = Event(
                        title: 'Event title',
                        description: 'Event description',
                        location: 'Event location',
                        startDate: DateTime(2022, 2, 11, 43),
                        endDate: DateTime(2022, 2, 12, 25),
                        iosParams: IOSParams(
                          reminder: Duration(minutes: 1),
                        ),
                        androidParams: AndroidParams(
                          emailInvites: ['dhara9277@gmail.com'],
                        ),
                      );
                      hour = time.hour;
                      minute = time.minute;
                      firebaseFirestore
                          .collection('users')
                          .doc(user!.uid)
                          .update({'hour': time.hour});
                    },
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _mediaQuery.width / 20.7,
                bottom: _mediaQuery.height / 89.6,
              ),
              child: Text(
                'Which day would you\nlike to meditate?',
                style: TextStyle(
                  fontFamily: neue,
                  fontSize: _mediaQuery.width / 17.25,
                  fontWeight: FontWeight.bold,
                  color: greyTitle,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: _mediaQuery.width / 20.7,
                bottom: _mediaQuery.height / 25.4,
              ),
              child: Text(
                'Everyday is best, but we recommend picking\nat least five.',
                style: TextStyle(
                  color: grey,
                  fontSize: _mediaQuery.width / 25.87500,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WeekOptions(
                  mediaQuery: _mediaQuery,
                  week: 'SU',
                  onTap: () {
                    if (su == true) {
                      setState(() {
                        su = false;
                      });
                    } else if (su == false) {
                      setState(() {
                        su = true;
                      });
                    }
                  },
                  weekDay: su,
                ),
                WeekOptions(
                  mediaQuery: _mediaQuery,
                  week: 'm',
                  onTap: () {
                    if (m == true) {
                      setState(() {
                        m = false;
                      });
                    } else if (m == false) {
                      setState(() {
                        m = true;
                      });
                    }
                  },
                  weekDay: m,
                ),
                WeekOptions(
                  mediaQuery: _mediaQuery,
                  week: 't',
                  onTap: () {
                    if (tu == true) {
                      setState(() {
                        tu = false;
                      });
                    } else if (tu == false) {
                      setState(() {
                        tu = true;
                      });
                    }
                  },
                  weekDay: tu,
                ),
                WeekOptions(
                  mediaQuery: _mediaQuery,
                  week: 'w',
                  onTap: () {
                    if (w == true) {
                      setState(() {
                        w = false;
                      });
                    } else if (w == false) {
                      setState(() {
                        w = true;
                      });
                    }
                  },
                  weekDay: w,
                ),
                WeekOptions(
                  mediaQuery: _mediaQuery,
                  week: 'th',
                  onTap: () {
                    if (th == true) {
                      setState(() {
                        th = false;
                      });
                    } else if (th == false) {
                      setState(() {
                        th = true;
                      });
                    }
                  },
                  weekDay: th,
                ),
                WeekOptions(
                  mediaQuery: _mediaQuery,
                  week: 'f',
                  onTap: () {
                    if (f == true) {
                      setState(() {
                        f = false;
                      });
                    } else if (f == false) {
                      setState(() {
                        f = true;
                      });
                    }
                  },
                  weekDay: f,
                ),
                WeekOptions(
                  mediaQuery: _mediaQuery,
                  week: 's',
                  onTap: () {
                    if (sat == true) {
                      setState(() {
                        sat = false;
                      });
                    } else if (f == false) {
                      setState(() {
                        sat = true;
                      });
                    }
                  },
                  weekDay: sat,
                ),
              ],
            ),
            SizedBox(
              height: _mediaQuery.height / 30.6451895,
            ),
            Center(
              child: Buttons(
                widget: widget,
                mediaQuery: _mediaQuery,
                title: 'Save',
                bgColor: purple,
                textColor: Colors.white,
                enterPage: HomeScreen(),
                animationStart: 500,
                signinup: false,
                reminder: true,
              ),
            ),
            Buttons(
              widget: widget,
              mediaQuery: _mediaQuery,
              title: 'No, Thanks',
              bgColor: Colors.white,
              textColor: greyTitle,
              enterPage: HomeScreen(),
              animationStart: 500,
              signinup: false,
            )
          ],
        ),
      ),
    );
  }
}

class WeekOptions extends StatelessWidget {
  const WeekOptions({
    Key? key,
    required Size mediaQuery,
    required this.week,
    required this.onTap,
    required this.weekDay,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String week;
  final VoidCallback onTap;
  final bool weekDay;

  @override
  Widget build(BuildContext context) {
    bool enabled = true;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: _mediaQuery.width / 10.1595092,
        height: _mediaQuery.width / 10.1595092,
        decoration: BoxDecoration(
          color: weekDay == true
              ? Color(
                  0xFF3F414E,
                )
              : Colors.white,
          border: weekDay == true ? null : Border.all(width: 1, color: grey),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Center(
          child: Text(
            week.toUpperCase(),
            style: TextStyle(
              color: weekDay == true ? Colors.white : grey,
              fontFamily: neue,
              fontSize: _mediaQuery.width / 25.87500,
            ),
          ),
        ),
      ),
    );
  }
}
