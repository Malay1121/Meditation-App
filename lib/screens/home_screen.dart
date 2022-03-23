import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/course_screen.dart';
import 'package:meditation_app/screens/meditation_screen.dart';
import 'package:meditation_app/screens/music_v2.dart';
import 'package:meditation_app/screens/sleep_welcome.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    // TODO: implement initState
    setState(() {
      FirebaseFirestore.instance
          .collection('courses')
          .where('home', isEqualTo: true)
          .get()
          .then((value) {
        setState(() {
          course1 = value;
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
        body: Stack(
          alignment: Alignment.topCenter,
          children: [
            ListView(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: _mediaQuery.width / 20.7,
                      right: _mediaQuery.width / 20.7),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: _mediaQuery.width / 7.46666667,
                      ),
                      Text(
                        'Good Morning, $username!',
                        style: TextStyle(
                          color: greyTitle,
                          fontFamily: neue,
                          fontWeight: FontWeight.bold,
                          fontSize: _mediaQuery.width / 14.7857143,
                        ),
                      ),
                      Text(
                        'We Wish you have a good day',
                        style: TextStyle(
                          color: Color(0xFFA1A4B3),
                          fontSize: _mediaQuery.width / 20.7,
                          fontFamily: neue,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      SizedBox(
                        height: _mediaQuery.height / 29.8666667,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CourseCard2(
                            content: course1?.docs[0]['content'],
                            mediaQuery: _mediaQuery,
                            image: course1?.docs[0]['image'],
                            minTime: 3,
                            maxTime: 10,
                            courseName: course1?.docs[0]['name'],
                            listening: course1?.docs[0]['listening'],
                            favorites: course1?.docs[0]['favorites'],
                            backgroundColor: Color(0xFFFFC97E),
                            startBackgroundColor: Color(
                              0xFFEBEAEC,
                            ),
                            startColor: greyTitle,
                            titleColor: greyTitle,
                            category: course1?.docs[0]['category'],
                          ),
                          CourseCard2(
                            mediaQuery: _mediaQuery,
                            content: course1?.docs[1]['content'],
                            image: course1?.docs[1]['image'],
                            minTime: 3,
                            maxTime: 10,
                            courseName: course1?.docs[1]['name'],
                            listening: course1?.docs[1]['listening'],
                            favorites: course1?.docs[1]['favorites'],
                            backgroundColor: Color(0xFFFFC97E),
                            startBackgroundColor: greyTitle,
                            startColor: Color(
                              0xFFEBEAEC,
                            ),
                            titleColor: greyTitle,
                            category: course1?.docs[1]['category'],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: _mediaQuery.height / 44.8,
                      ),
                      Container(
                        width: _mediaQuery.width / 1.10695187,
                        height: _mediaQuery.width / 4.35789474,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/course_card3.png'),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: _mediaQuery.height / 22.4,
                      ),
                      Text(
                        'Recomended for you',
                        style: TextStyle(
                          color: greyTitle,
                          fontSize: _mediaQuery.width / 17.25,
                          fontFamily: neue,
                        ),
                      ),
                      SizedBox(
                        height: _mediaQuery.width / 2.57142857,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CourseCard(
                              mediaQuery: _mediaQuery,
                              image: '4',
                              courseName: course1?.docs[0]['name'],
                              listening: course1?.docs[0]['listening'],
                              favorites: course1?.docs[0]['favorites'],
                            ),
                            CourseCard(
                              mediaQuery: _mediaQuery,
                              image: '5',
                              courseName: course1?.docs[0]['name'],
                              listening: course1?.docs[0]['listening'],
                              favorites: course1?.docs[0]['favorites'],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: _mediaQuery.height / 8,
                )
              ],
            ),
            Positioned(
              bottom: 0,
              child: Container(
                color: Colors.white,
                child: NavBar(
                  mediaQuery: _mediaQuery,
                  active: 'home',
                ),
              ),
            ),
            Positioned(
              top: _mediaQuery.height / 80,
              child: Visibility(
                visible: courseNameG != null ? true : false,
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      AwesomePageRoute(
                          exitPage: HomeScreen(),
                          enterPage: Musicv2(
                            audioLink: audioLinkG,
                            category: categoryG,
                            courseName: courseNameG,
                          ),
                          transitionDuration: Duration(
                            milliseconds: 1000,
                          ),
                          transition: StackTransition()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(10),
                          topLeft: Radius.circular(10),
                          bottomLeft: Radius.circular(10)),
                      color: purple,
                    ),
                    width: _mediaQuery.width / 1.10,
                    height: _mediaQuery.height / 16,
                    child: Row(
                      children: [
                        SizedBox(
                          width: _mediaQuery.width / 41,
                        ),
                        courseNameG == null
                            ? Container()
                            : SizedBox(
                                width: _mediaQuery.width / 2,
                                child: Text(
                                  courseNameG,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: neue,
                                    fontSize: _mediaQuery.width / 28,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ),
                        Spacer(),
                        IconButton(
                          onPressed: () {
                            if (musicOn == false) {
                              setState(() {
                                tts.pause();
                                play = Icons.play_arrow;

                                musicOn = true;
                              });
                            } else if (musicOn == true) {
                              setState(() {
                                musicOn = false;
                                play = Icons.pause;
                                tts.resume();
                              });
                            }
                          },
                          icon: Icon(play),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  const NavBar({
    Key? key,
    required Size mediaQuery,
    required this.active,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String active;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: _mediaQuery.width,
      height: _mediaQuery.height / 8,
      child: Row(
        children: [
          NavBarOptions(
            mediaQuery: _mediaQuery,
            pageName: 'Home',
            icon: Icons.home_outlined,
            page: HomeScreen(),
            active: active == 'home' ? true : false,
          ),
          NavBarOptions(
            mediaQuery: _mediaQuery,
            pageName: 'Sleep',
            icon: Icons.dark_mode_outlined,
            page: SleepWelcome(),
            active: active == 'sleep' ? true : false,
          ),
          NavBarOptions(
            mediaQuery: _mediaQuery,
            pageName: 'Meditate',
            icon: Icons.self_improvement_outlined,
            page: MeditationScreen(),
            active: active == 'meditate' ? true : false,
          ),
          NavBarOptions(
            mediaQuery: _mediaQuery,
            pageName: 'Music',
            icon: Icons.music_note_outlined,
            page: HomeScreen(),
            active: active == 'music' ? true : false,
          ),
          NavBarOptions(
            mediaQuery: _mediaQuery,
            pageName: username,
            icon: Icons.person_outline_rounded,
            page: HomeScreen(),
            active: active == 'username' ? true : false,
          ),
        ],
      ),
    );
  }
}

class CourseCard2 extends StatelessWidget {
  const CourseCard2({
    Key? key,
    required Size mediaQuery,
    required this.image,
    required this.minTime,
    required this.maxTime,
    required this.courseName,
    required this.favorites,
    required this.listening,
    required this.backgroundColor,
    required this.startColor,
    required this.startBackgroundColor,
    required this.content,
    required this.category,
    this.titleColor = Colors.white,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String image;
  final int minTime;
  final int maxTime;
  final String courseName;
  final int favorites;
  final int listening;
  final Color backgroundColor;
  final Color startColor;
  final Color startBackgroundColor;
  final String content;
  final Color titleColor;
  final String category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseScreen(
              content: content,
              image: image,
              courseName: courseName,
              listening: listening,
              favorites: favorites,
              category: category,
            ),
          ),
        );
      },
      child: Tooltip(
        message: courseName,
        child: Container(
          width: _mediaQuery.width / 2.33898305,
          height: _mediaQuery.height / 4.26666667 * 1.4,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage('$image'),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: _mediaQuery.width / 27.6,
                    top: _mediaQuery.height / 12.5411765 * 1.4),
                child: SizedBox(
                  height: _mediaQuery.height / 20.4 * 1.4,
                  child: Text(
                    courseName,
                    style: TextStyle(
                      color: titleColor,
                      fontFamily: neue,
                      fontWeight: FontWeight.w700,
                      fontSize: _mediaQuery.width / 23,
                      overflow: TextOverflow.ellipsis,
                    ),
                    maxLines: 2,
                  ),
                ),
              ),
              SizedBox(
                height: _mediaQuery.height / 94.3157895 * 1.4,
              ),
              Padding(
                padding: EdgeInsets.only(
                  left: _mediaQuery.width / 27.6,
                ),
                child: Text(
                  'COURSE'.toUpperCase(),
                  style: TextStyle(
                    color: titleColor,
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(
                  left: _mediaQuery.width / 27.6,
                  bottom: _mediaQuery.height / 34.4615385,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: _mediaQuery.width / 2.81632653,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '$minTime-$maxTime MIN',
                            style: TextStyle(
                              fontFamily: neue,
                              fontSize: _mediaQuery.width / 37.6363636,
                              color: Color(0xFFEBEAEC),
                            ),
                          ),
                          Container(
                            width: _mediaQuery.width / 5.91428571,
                            height: _mediaQuery.width / 11.8285714,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                color: startBackgroundColor),
                            child: Center(
                              child: Text(
                                'START'.toUpperCase(),
                                style: TextStyle(
                                  color: startColor,
                                  fontSize: _mediaQuery.width / 34.5,
                                  fontFamily: neue,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavBarOptions extends StatelessWidget {
  const NavBarOptions({
    Key? key,
    required this.active,
    required Size mediaQuery,
    required this.pageName,
    required this.page,
    required this.icon,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String pageName;
  final Widget page;
  final IconData icon;
  final bool active;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: _mediaQuery.width / 20.7,
        right: _mediaQuery.width / 30.6666667,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            AwesomePageRoute(
                enterPage: page,
                transitionDuration: Duration(
                  milliseconds: 1000,
                ),
                transition: StackTransition()),
          );
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: active == true ? purple : Colors.white,
                borderRadius: BorderRadius.circular(18),
              ),
              height: _mediaQuery.width / 9,
              width: _mediaQuery.width / 9,
              child: Icon(
                icon,
                color: active == true ? Colors.white : Color(0xFFA0A3B1),
              ),
            ),
            Text(
              pageName,
              style: TextStyle(
                color: active == true ? purple : Color(0xFFA0A3B1),
                fontSize: _mediaQuery.width / 29.5714286,
                fontFamily: neue,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CourseCard extends StatelessWidget {
  const CourseCard({
    required this.image,
    required this.courseName,
    required this.favorites,
    required this.listening,
    Key? key,
    required Size mediaQuery,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String image;
  final String courseName;
  final int favorites;
  final int listening;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        right: _mediaQuery.width / 20.7,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CourseScreen(
                content: '',
                image: image,
                courseName: courseName,
                listening: listening,
                favorites: favorites,
                category: '',
              ),
            ),
          );
        },
        child: Container(
          width: _mediaQuery.width / 2.55555556,
          height: _mediaQuery.width / 2.57142857,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/course_card$image.png'),
            ),
          ),
        ),
      ),
    );
  }
}
