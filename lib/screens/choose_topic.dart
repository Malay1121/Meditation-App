import 'package:flutter/material.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/reminders.dart';

class ChooseTopic extends StatefulWidget {
  const ChooseTopic({Key? key}) : super(key: key);

  @override
  _ChooseTopicState createState() => _ChooseTopicState();
}

class _ChooseTopicState extends State<ChooseTopic> {
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            bottom: _mediaQuery.height / 26.3529411765,
            child: Container(
              height: _mediaQuery.height / 1.18675496689,
              width: _mediaQuery.width,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage('assets/choose_topic_back.png'),
                ),
              ),
            ),
          ),
          ListView(
            children: [
              SizedBox(
                height: _mediaQuery.height / 11.7894736842,
              ),
              Padding(
                padding: EdgeInsets.only(left: _mediaQuery.width / 20.7),
                child: SizedBox(
                  width: _mediaQuery.width / 1.88181818182,
                  child: RichText(
                    overflow: TextOverflow.clip,
                    text: TextSpan(
                      text: 'What Brings you\n',
                      style: TextStyle(
                        color: greyTitle,
                        fontSize: _mediaQuery.width / 14.7857142857,
                        fontWeight: FontWeight.bold,
                        fontFamily: neue,
                      ),
                      children: [
                        TextSpan(
                          text: 'to Meditation App?',
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: _mediaQuery.height / 89.6,
              ),
              Padding(
                padding: EdgeInsets.only(left: _mediaQuery.width / 20.7),
                child: Text(
                  'choose a topic to focus on:',
                  style: TextStyle(
                    color: greySubtitle,
                    fontFamily: neue,
                    fontWeight: FontWeight.w300,
                    fontSize: _mediaQuery.width / 20.7,
                  ),
                ),
              ),
              SizedBox(
                height: _mediaQuery.height / 29.8666666667,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TopicCard(
                        textColor: Color(0xFFFFECCC),
                        mediaQuery: _mediaQuery,
                        text: 'Reduce Stress',
                        backgroundColor: purple,
                        image: '1',
                        small: false,
                      ),
                      TopicCard(
                          mediaQuery: _mediaQuery,
                          image: '3',
                          small: true,
                          textColor: Colors.black,
                          backgroundColor: Color(0xFFFEB18F),
                          text: 'Increase Happiness'),
                      TopicCard(
                        mediaQuery: _mediaQuery,
                        image: '5',
                        small: false,
                        textColor: Colors.white,
                        backgroundColor: Color(0xFF6CB28E),
                        text: 'Personal Growth',
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TopicCard(
                          mediaQuery: _mediaQuery,
                          image: '2',
                          small: true,
                          textColor: Colors.white,
                          backgroundColor: Colors.white,
                          text: ''),
                      TopicCard(
                        mediaQuery: _mediaQuery,
                        image: '4',
                        small: false,
                        textColor: Colors.black,
                        backgroundColor: Color(0xFFFFCF86),
                        text: 'Reduce Anxiety',
                      ),
                      TopicCard(
                        mediaQuery: _mediaQuery,
                        image: '6',
                        small: true,
                        textColor: Colors.black,
                        backgroundColor: Color(0xFFFFCF86),
                        text: '',
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}

class TopicCard extends StatelessWidget {
  const TopicCard({
    Key? key,
    required Size mediaQuery,
    required this.image,
    required this.small,
    required this.textColor,
    required this.backgroundColor,
    required this.text,
  })  : _mediaQuery = mediaQuery,
        super(key: key);

  final Size _mediaQuery;
  final String image;
  final bool small;
  final Color textColor;
  final Color backgroundColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: _mediaQuery.width / 34.3141317862,
        right: _mediaQuery.width / 34.3141317862,
        bottom: _mediaQuery.width / 41.4,
        top: _mediaQuery.width / 41.4,
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Reminders()));
        },
        child: Container(
          width: _mediaQuery.width / 2.34653970413,
          height: small == true
              ? _mediaQuery.width / 2.47904191617
              : _mediaQuery.width / 1.97142857143,
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(
              10,
            ),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/card$image.png'),
            ),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.all(
                _mediaQuery.width / 27.6,
              ),
              child: Text(
                text,
                style: TextStyle(
                  color: textColor,
                  fontSize: _mediaQuery.width / 20.7,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
