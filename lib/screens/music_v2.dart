import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/course_screen.dart';
import 'package:meditation_app/screens/meditation_screen.dart';

class Musicv2 extends StatefulWidget {
  Musicv2(
      {required this.courseName,
      required this.category,
      required this.audioLink});

  final String courseName;
  final String category;
  final String audioLink;

  @override
  State<Musicv2> createState() => _Musicv2State();
}

Duration currentPostion = Duration();

class _Musicv2State extends State<Musicv2> {
  @override
  void initState() {
    // TODO: implement initState
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
        backgroundColor: Color(0xFFFAF7F3),
        body: Stack(
          children: [
            Container(
              height: _mediaQuery.height,
              width: _mediaQuery.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(
                    'assets/music_v2_bg.png',
                  ),
                ),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: _mediaQuery.height / 17.92 * 1.4,
                    left: _mediaQuery.width / 20.7,
                  ),
                  child: Row(
                    children: [
                      Container(
                        height: _mediaQuery.height / 16.2909091 * 1.3,
                        width: _mediaQuery.width / 7.52727273,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: IconButton(
                          icon: Icon(Icons.close),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                      SizedBox(
                        width: _mediaQuery.width / 1.73402062,
                      ),
                      Container(
                        height: _mediaQuery.height / 16.2909091 * 1.3,
                        width: _mediaQuery.width / 7.52727273,
                        decoration: BoxDecoration(
                          color: Color(0xFFB6B8BF).withOpacity(0.6),
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Icon(
                          Icons.favorite_border,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height / 5.12434619,
                ),
                SizedBox(
                  width: _mediaQuery.width / 1.2,
                  child: Text(
                    courseNameG,
                    style: TextStyle(
                      color: greyTitle,
                      fontFamily: neue,
                      fontSize: _mediaQuery.width / 12.1764706,
                      fontWeight: FontWeight.w700,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ),
                Text(
                  category.toUpperCase(),
                  style: TextStyle(
                    color: Color(0xFFA0A3B1),
                    fontFamily: neue,
                    fontSize: _mediaQuery.width / 29.5714286,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.05,
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height / 12.8 * 1.4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        if (currentPostion.inSeconds == 0 ||
                            currentPostion.inSeconds < 10) {
                          seekTo(0);
                        } else if (currentPostion.inSeconds > 10) {
                          seekTo(currentPostion.inSeconds - 10);
                        }
                      },
                      icon: Icon(
                        Icons.skip_previous_outlined,
                        color: Color(0xFFA0A3B1),
                        size: _mediaQuery.width / 10.25,
                      ),
                    ),
                    CircleAvatar(
                      radius: _mediaQuery.width / 7.96153846,
                      backgroundColor: Color(0xFFBABCC6).withOpacity(
                        0.6,
                      ),
                      child: CircleAvatar(
                        radius: _mediaQuery.width / 9.62790698,
                        backgroundColor: greyTitle,
                        child: IconButton(
                          onPressed: () {
                            if (isPlaying) {
                              setState(() {
                                isPlaying = false;
                              });
                              stopMusic();
                            } else {
                              setState(() {
                                isPlaying = true;
                              });
                              playMusic();
                            }
                          },
                          icon: isPlaying
                              ? Icon(Icons.pause)
                              : Icon(Icons.play_arrow),
                          iconSize: 35,
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        if (currentPostion <
                            musicLength - Duration(seconds: 10)) {
                          seekTo(currentPostion.inSeconds + 10);
                        } else {
                          seekTo(musicLength.inSeconds);
                          if (mounted) if (mounted)
                            setState(() {
                              isPlaying = false;
                            });
                          player.stop();
                        }
                      },
                      icon: Icon(
                        Icons.skip_next_outlined,
                        color: Color(0xFFA0A3B1),
                        size: _mediaQuery.width / 10.25,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: _mediaQuery.height / 17.2307692,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text('${currentPostion.inSeconds}'),
                    Container(
                        width: _mediaQuery.width / 1.3,
                        child: Slider(
                            activeColor: greyTitle,
                            inactiveColor: Color(0xFFA0A3B1),
                            value: currentPostion.inSeconds.toDouble(),
                            max: musicLength.inSeconds.toDouble(),
                            thumbColor: greyTitle,
                            onChanged: (val) {
                              if (mounted)
                                setState(() {
                                  seekTo(val.toInt());
                                });
                            })),
                    Text('${musicLength.inSeconds}'),
                  ],
                ),
              ],
            )
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
