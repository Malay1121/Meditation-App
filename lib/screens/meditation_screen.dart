import 'package:awesome_page_transitions/awesome_page_transitions.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:meditation_app/column_builder.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/home_screen.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

String category = 'All';

class _MeditationScreenState extends State<MeditationScreen> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  Column(
                    children: [
                      SizedBox(
                        height: _mediaQuery.height / 13.5757576 * 1.4,
                      ),
                      Text(
                        'Meditate',
                        style: TextStyle(
                          color: greyTitle,
                          fontWeight: FontWeight.w700,
                          fontFamily: neue,
                          fontSize: _mediaQuery.width / 14.7857143,
                        ),
                      ),
                      SizedBox(
                        height: _mediaQuery.height / 59.7333333 * 1.4,
                      ),
                      SizedBox(
                        width: _mediaQuery.width / 1.23214286,
                        child: Text(
                          'we can learn how to recognize when our minds are doing their normal everyday acrobatics.',
                          style: TextStyle(
                            color: Color(0xFFA0A3B1),
                            fontFamily: neue,
                            fontWeight: FontWeight.w300,
                            fontSize: _mediaQuery.width / 25.87500,
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
                            ),
                            Categories(
                              mediaQuery: _mediaQuery,
                              categoryName: 'Advice',
                              icon: Icons.favorite_border,
                            ),
                            Categories(
                              mediaQuery: _mediaQuery,
                              categoryName: 'Analytical',
                              icon: Icons.sentiment_dissatisfied_outlined,
                            ),
                            Categories(
                              mediaQuery: _mediaQuery,
                              categoryName: 'Dzogchen',
                              icon: Icons.dark_mode_outlined,
                            ),
                            Categories(
                              mediaQuery: _mediaQuery,
                              categoryName: 'Mahāmudrā',
                              icon: Icons.child_care_outlined,
                            ),
                            Categories(
                              mediaQuery: _mediaQuery,
                              categoryName: 'Śamatha',
                              icon: Icons.child_care_outlined,
                            ),
                            Categories(
                              mediaQuery: _mediaQuery,
                              categoryName: 'Śamatha & Vipaśyanā',
                              icon: Icons.child_care_outlined,
                            ),
                            Categories(
                              mediaQuery: _mediaQuery,
                              categoryName: 'Vipaśyanā',
                              icon: Icons.child_care_outlined,
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
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 10),
                                  itemBuilder: (context, index) {
                                    DocumentSnapshot doc =
                                        snapshot.data!.docs[index];

                                    return Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
                  )
                ],
              ),
            ),
            NavBar(
              mediaQuery: _mediaQuery,
              active: 'meditate',
            ),
          ],
        ),
      ),
    );
  }
}

class Categories extends StatefulWidget {
  const Categories({
    Key? key,
    required Size mediaQuery,
    required this.categoryName,
    required this.icon,
    this.sleep = false,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String categoryName;
  final IconData icon;
  final bool sleep;

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: widget._mediaQuery.width / 41.4,
        right: widget._mediaQuery.width / 41.4,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            category = widget.categoryName;
            print(category);
            Navigator.pushReplacement(
              context,
              AwesomePageRoute(
                  exitPage: MeditationScreen(),
                  enterPage: MeditationScreen(),
                  transitionDuration: Duration(
                    milliseconds: 0,
                  ),
                  transition: StackTransition()),
            );
          });
        },
        child: Column(
          children: [
            Container(
              width: widget._mediaQuery.width / 6.36923077,
              height: widget._mediaQuery.height / 13.7846154 * 1.4,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color: category == widget.categoryName
                    ? purple
                    : widget.sleep == true
                        ? Color(0xFF586894)
                        : Color(0xFFA0A3B1),
              ),
              child: Icon(
                widget.icon,
                color: Colors.white,
                size: widget._mediaQuery.width / 14.56,
              ),
            ),
            SizedBox(
              height: widget._mediaQuery.height / 89.6 * 1.4,
            ),
            Text(
              widget.categoryName,
              style: TextStyle(
                color: category == widget.categoryName
                    ? widget.sleep == true
                        ? Color(0xFFE6E7F2)
                        : greyTitle
                    : widget.sleep == true
                        ? Color(0xFF98A1BD)
                        : Color(0xFFA0A3B1),
                fontWeight: FontWeight.w400,
                fontFamily: neue,
                fontSize: widget._mediaQuery.width / 25.87500,
              ),
            )
          ],
        ),
      ),
    );
  }
}
