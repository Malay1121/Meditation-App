import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/music_v2.dart';
import 'package:meditation_app/screens/reminders.dart';
import 'package:text_to_speech/text_to_speech.dart';

TextToSpeech tts = TextToSpeech();

late AudioPlayer player;
late AudioCache cache;
bool isPlaying = false;

Duration musicLength = Duration();
AudioPlayer audio = AudioPlayer();

class CourseScreen extends StatefulWidget {
  CourseScreen({
    Key? key,
    required this.image,
    required this.courseName,
    required this.favorites,
    required this.listening,
    required this.content,
    required this.category,
  }) : super(key: key);

  final String image;
  final String courseName;
  final int favorites;
  final int listening;
  final String content;
  final String category;

  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  void initState() {
    player = AudioPlayer(mode: PlayerMode.MEDIA_PLAYER);
    setUp();
  }

  setUp() {
    player.onAudioPositionChanged.listen((d) {
      if (mounted)
        setState(() {
          currentPostion = d;
        });

      player.onDurationChanged.listen((d) {
        if (mounted)
          setState(() {
            musicLength = d;
          });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: _mediaQuery.width,
                      height: _mediaQuery.width / 1.43361729,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            widget.image,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: _mediaQuery.width / 20.40414,
                      top: _mediaQuery.width / 17.92,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: CircleAvatar(
                          radius: _mediaQuery.width / 15.0545455,
                          backgroundColor: Color(
                            0xFFF2F2F2,
                          ),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: _mediaQuery.width / 4.62053571,
                      top: _mediaQuery.width / 17.92,
                      child: CircleAvatar(
                        radius: _mediaQuery.width / 15.0545455,
                        backgroundColor: Color(
                          0xFF03174C,
                        ).withOpacity(0.7),
                        child: Icon(
                          Icons.favorite_border,
                          color: Color(0xFFE6E7F2),
                        ),
                      ),
                    ),
                    Positioned(
                      right: _mediaQuery.width / 21.122449,
                      top: _mediaQuery.width / 17.92,
                      child: CircleAvatar(
                        radius: _mediaQuery.width / 15.0545455,
                        backgroundColor: Color(
                          0xFF03174C,
                        ).withOpacity(0.7),
                        child: Icon(
                          Icons.download_outlined,
                          color: Color(0xFFE6E7F2),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _mediaQuery.height / 28.5714286,
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: _mediaQuery.width / 20.7,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.courseName,
                        style: TextStyle(
                          color: greyTitle,
                          fontWeight: FontWeight.bold,
                          fontFamily: neue,
                          fontSize: _mediaQuery.width / 12.1764706,
                        ),
                      ),
                      SizedBox(
                        height: _mediaQuery.height / 58.2953806,
                      ),
                      Text(
                        'course'.toUpperCase(),
                        style: TextStyle(
                          color: greySubtitle,
                          fontFamily: neue,
                          fontSize: _mediaQuery.width / 29.5714286,
                        ),
                      ),
                      SizedBox(
                        height: _mediaQuery.height / 44.8,
                      ),
                      SizedBox(
                        width: _mediaQuery.width / 1.31428571,
                        child: Text(
                          'Ease the mind into a restful night’s sleep  with these deep, amblent tones.',
                          style: TextStyle(
                            color: greySubtitle,
                            fontFamily: neue,
                            fontWeight: FontWeight.w300,
                            fontSize: _mediaQuery.width / 25.87500,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _mediaQuery.height / 29.8666667,
                      ),
                      Row(
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.favorite,
                                color: Color(0xFFFF84A2),
                              ),
                              SizedBox(
                                width: _mediaQuery.width / 41.4,
                              ),
                              Text(
                                '${widget.favorites.toString()} Favorites',
                                style: TextStyle(
                                  color: greySubtitle,
                                  fontSize: _mediaQuery.width / 29.5714286,
                                  fontFamily: neue,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: _mediaQuery.width / 8.44897959,
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.headphones,
                                color: Color(0xFF7FD2F2),
                              ),
                              SizedBox(
                                width: _mediaQuery.width / 41.4,
                              ),
                              Text(
                                '${widget.listening.toString()} Listening',
                                style: TextStyle(
                                  color: greySubtitle,
                                  fontSize: _mediaQuery.width / 29.5714286,
                                  fontFamily: neue,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _mediaQuery.height / 20.45,
                      ),
                      Text(
                        'Pick a Narrator',
                        style: TextStyle(
                          color: greyTitle,
                          fontSize: _mediaQuery.width / 20.7,
                          fontFamily: neue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                DefaultTabController(
                  length: 2,
                  child: Column(
                    children: [
                      Container(
                        child: TabBar(
                          indicatorPadding: EdgeInsets.only(
                            left: _mediaQuery.width / 6,
                            right: _mediaQuery.width / 6,
                          ),
                          indicatorColor: purple,
                          labelColor: purple,
                          labelStyle: TextStyle(
                            fontFamily: neue,
                            fontSize: _mediaQuery.width / 25.87500,
                          ),
                          tabs: [
                            Tab(
                              text: 'Male Voice'.toUpperCase(),
                            ),
                            Tab(
                              text: 'Female Voice'.toUpperCase(),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        height: 1,
                        color: Color(0xFFE4E6FD),
                      ),
                      SizedBox(
                        height: 400,
                        child: TabBarView(
                          children: [
                            Column(
                              children: [
                                CourseSteps(
                                  mediaQuery: _mediaQuery,
                                  title: 'Focus Attention',
                                  time: '10 mins',
                                  locked: false,
                                  text: widget.content,
                                  lang: 'en-US',
                                  courseName: widget.courseName,
                                  categoryName: widget.category,
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                CourseSteps(
                                  mediaQuery: _mediaQuery,
                                  title: 'Focus Attention',
                                  time: '10 mins',
                                  locked: false,
                                  text: widget.content,
                                  lang: 'en-GB',
                                  courseName: widget.courseName,
                                  categoryName: widget.category,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  playMusic() {
    // t play the Audio
    player.play(audioLinkG);
  }

  stopMusic() {
    // to pause the Audio
    player.pause();
  }

  seekTo(int sec) {
    // To seek the audio to a new position
    player.seek(Duration(seconds: sec));
  }
}

class CourseSteps extends StatefulWidget {
  const CourseSteps({
    Key? key,
    required Size mediaQuery,
    required this.title,
    required this.time,
    required this.text,
    required this.lang,
    this.locked = true,
    required this.courseName,
    required this.categoryName,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String title;
  final String time;
  final bool locked;
  final String text;
  final String lang;
  final String courseName;
  final String categoryName;

  State<CourseSteps> createState() => _CourseStepsState();
}

class _CourseStepsState extends State<CourseSteps> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            top: widget._mediaQuery.height / 54.8,
            bottom: widget._mediaQuery.height / 54.8,
          ),
          child: ListTile(
            leading: GestureDetector(
              onTap: () async {
                setState(() {
                  courseNameG = widget.courseName;
                  categoryG = widget.categoryName;
                });
                // setState(() {
                //   audioLinkG = widget.text;
                //   musicName = widget.courseName;
                // });
                // await player.stop;
                // await player.play(widget.text);
                if (widget.lang == 'en-GB') {
                  tts.setPitch(2);
                  tts.setRate(1.2);
                }
                await tts.setLanguage(widget.lang);
                await tts.speak(widget.text);

                if (musicOn == false) {
                  setState(() {
                    musicOn = true;
                    play = Icons.play_arrow;
                    tts.pause();
                  });
                } else if (musicOn == true) {
                  setState(() {
                    musicOn = false;
                    play = Icons.pause;

                    tts.resume();
                  });
                }
              },
              child: CircleAvatar(
                backgroundColor:
                    widget.locked == true ? grey : Colors.transparent,
                radius: widget._mediaQuery.width / 17.7 + 2,
                child: CircleAvatar(
                  child: Icon(
                    Icons.play_arrow,
                    color: widget.locked ? grey : Colors.white,
                    size: widget._mediaQuery.width / 17.7,
                  ),
                  backgroundColor:
                      widget.locked == true ? Colors.white : purple,
                  radius: widget._mediaQuery.width / 20.7,
                ),
              ),
            ),
            title: Text(
              widget.title,
              style: TextStyle(
                color: greyTitle,
                fontFamily: neue,
                fontSize: widget._mediaQuery.width / 30.87500,
              ),
            ),
            subtitle: Text(
              widget.time.toUpperCase(),
              style: TextStyle(
                color: grey,
                fontFamily: neue,
                fontSize: widget._mediaQuery.width / 37.6363636,
              ),
            ),
          ),
        ),
        Divider(
          indent: widget._mediaQuery.width / 20.7,
          endIndent: widget._mediaQuery.width / 20.7,
        ),
      ],
    );
  }
}
