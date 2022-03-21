import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/course_screen.dart';
import 'package:meditation_app/screens/sign_up_in.dart';

void main() async {
  runApp(const MyApp());
  await Firebase.initializeApp();

  tts.setPitch(0.6);
  tts.setRate(0.7);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Signupin(),
    );
  }
}
