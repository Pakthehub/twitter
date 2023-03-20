import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/for_you_tab_screen.dart';
import 'package:like_button/like_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class TweetBox extends StatelessWidget {
  TweetBox({required this.tweet});

  final String tweet;

  final _firestore = FirebaseFirestore.instance;
  late User loggedInUser;


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
              top: BorderSide(width: 0.3),
              bottom: BorderSide(width: 0.3, color: Colors.white60))),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            child: Icon(
              Icons.account_circle_rounded,
            ),
            radius: 15,
          ),
          SizedBox(
            width: 8,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Pakman',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              ),
              Text(
                tweet,
                style: TextStyle(fontSize: 15),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: FaIcon(
                      FontAwesomeIcons.comment,
                      color: Colors.grey,
                      size: 15,
                    ),
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  LikeButton(
                    size: 20,
                    circleColor: CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: BubblesColor(
                        dotPrimaryColor: Color(0xff33b5e5),
                        dotSecondaryColor: Color(0xff0099cc)),
                    likeBuilder: (bool isLiked) {
                      return FaIcon(
                        FontAwesomeIcons.retweet,
                        color: isLiked ? Colors.green : Colors.grey,
                        size: 15,
                      );
                    },
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  LikeButton(
                    size: 20,
                    circleColor: CircleColor(
                        start: Color(0xff00ddff), end: Color(0xff0099cc)),
                    bubblesColor: BubblesColor(
                        dotPrimaryColor: Color(0xff33b5e5),
                        dotSecondaryColor: Color(0xff0099cc)),
                    likeBuilder: (bool isLiked) {
                      return FaIcon(
                        isLiked
                            ? FontAwesomeIcons.solidHeart
                            : FontAwesomeIcons.heart,
                        color: isLiked ? Colors.red : Colors.grey,
                        size: 15,
                      );
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
