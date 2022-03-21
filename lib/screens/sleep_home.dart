import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/course_screen.dart';
import 'package:meditation_app/screens/home_screen.dart';
import 'package:meditation_app/screens/meditation_screen.dart';

class SleepHome extends StatefulWidget {
  const SleepHome({Key? key}) : super(key: key);

  @override
  State<SleepHome> createState() => _SleepHomeState();
}

class _SleepHomeState extends State<SleepHome> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: darkBlue,
      body: Stack(
        children: [
          Container(
            height: _mediaQuery.height / 3.51372549 + 1.4,
            width: _mediaQuery.width,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage('assets/sleep_asset2.png'),
              ),
            ),
          ),
          ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: _mediaQuery.height / 13.5757576 * 1.4,
                    ),
                    Text(
                      'Sleep Stories',
                      style: TextStyle(
                        color: Color(
                          0xFFE6E7F2,
                        ),
                        fontSize: _mediaQuery.width / 14.7857143,
                        fontFamily: neue,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 59.7333333 * 1.4,
                    ),
                    SizedBox(
                      width: _mediaQuery.width / 1.5,
                      child: Text(
                        'Soothing bedtime stories to help you fall into a deep and natural sleep',
                        style: TextStyle(
                          color: Color(
                            0xFFEBEAEC,
                          ),
                          fontFamily: neue,
                          fontSize: _mediaQuery.width / 25.87500,
                          fontWeight: FontWeight.w300,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 26.3529412 * 1.4,
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 8.53913043 * 1.4,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Categories(
                            mediaQuery: _mediaQuery,
                            categoryName: 'All',
                            icon: Icons.grid_3x3,
                            sleep: true,
                          ),
                          Categories(
                            mediaQuery: _mediaQuery,
                            categoryName: 'Advice',
                            icon: Icons.favorite_border,
                            sleep: true,
                          ),
                          Categories(
                            mediaQuery: _mediaQuery,
                            categoryName: 'Analytical',
                            icon: Icons.sentiment_dissatisfied_outlined,
                            sleep: true,
                          ),
                          Categories(
                            mediaQuery: _mediaQuery,
                            categoryName: 'Dzogchen',
                            icon: Icons.dark_mode_outlined,
                            sleep: true,
                          ),
                          Categories(
                            mediaQuery: _mediaQuery,
                            categoryName: 'Mahāmudrā',
                            icon: Icons.child_care_outlined,
                            sleep: true,
                          ),
                          Categories(
                            mediaQuery: _mediaQuery,
                            categoryName: 'Śamatha',
                            icon: Icons.child_care_outlined,
                            sleep: true,
                          ),
                          Categories(
                            mediaQuery: _mediaQuery,
                            categoryName: 'Śamatha & Vipaśyanā',
                            icon: Icons.child_care_outlined,
                            sleep: true,
                          ),
                          Categories(
                            mediaQuery: _mediaQuery,
                            categoryName: 'Vipaśyanā',
                            icon: Icons.child_care_outlined,
                            sleep: true,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: _mediaQuery.height / 89.6 * 1.4,
                    ),
                    StreamBuilder<QuerySnapshot>(
                      stream: category == 'All'
                          ? FirebaseFirestore.instance
                              .collection('courses')
                              .snapshots()
                          : FirebaseFirestore.instance
                              .collection('courses')
                              .where('category', isEqualTo: category)
                              .snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              child: GridView.builder(
                                shrinkWrap: true,
                                physics: ScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                        crossAxisCount: 2, mainAxisSpacing: 10),
                                itemBuilder: (context, index) {
                                  DocumentSnapshot doc =
                                      snapshot.data!.docs[index];

                                  return Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      CourseCard2(
                                        mediaQuery: _mediaQuery,
                                        image: doc['image'],
                                        minTime: doc['minTime'],
                                        maxTime: doc['maxTime'],
                                        courseName: doc['name'],
                                        favorites: doc['favorites'],
                                        listening: doc['listening'],
                                        backgroundColor: purple,
                                        startColor: Color(0xFFFEFFFE),
                                        startBackgroundColor: greyTitle,
                                        maleVoice: doc['maleVoice'],
                                        femaleVoice: doc['femaleVoice'],
                                        category: doc['category'],
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                          );
                        } else {
                          return Text(
                              "There was an error or no Courses Found! Please check back later!");
                        }
                      },
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CourseCard3 extends StatelessWidget {
  const CourseCard3({
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
    required this.maleVoice,
    required this.femaleVoice,
    required this.category,
    required this.img,
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
  final String maleVoice;
  final String femaleVoice;
  final Color titleColor;
  final String category;
  final int img;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CourseScreen(
              maleVoice: maleVoice,
              femaleVoice: femaleVoice,
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
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    image: DecorationImage(
                        image: AssetImage('assets/music_image$img.png'))),
              ),
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
