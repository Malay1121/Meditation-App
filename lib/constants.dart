import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

var neue = 'Neue';

Color purple = Color(0xFF8E97FD);

Color white = Color(0xFFF6F1FB);

Color grey = Color(0xFFA1A4B2);

Color greyTitle = Color(0xFF3F414E);

Color facebook = Color(0xFF7583CA);

Color greySubtitle = Color(0xFFA1A4B2);

Color darkBlue = Color(0xFF03174C);

bool musicSet = false;

String musicName = '';

bool musicOn = false;

bool musicUp = false;

IconData play = Icons.play_arrow;

var auth = FirebaseAuth.instance;

var courseNameG;
var audioLinkG;
var categoryG;

FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

var username;

QuerySnapshot<Map<String, dynamic>>? course1;
QuerySnapshot<Map<String, dynamic>>? course2;

final messaging = FirebaseMessaging.instance;

var token = messaging.getToken(
  vapidKey:
      "BLq3hXGDMmB2NMjWh8O287pKRexXGy8hQ1GAXCT7LfObQSQ4BAnoZnkHd5EF3ije8DyDPVcPTKKITzUghh4R9FI",
);

var status;

var playerId;

var event;
