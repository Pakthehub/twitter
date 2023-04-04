import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/for_you_tab_screen.dart';
import 'package:like_button/like_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TweetBox extends StatelessWidget {
  TweetBox({required this.tweet});

  final String tweet;

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
                  FaIcon(
                    FontAwesomeIcons.retweet,
                    color: Colors.grey,
                    size: 15,
                  ),
                  SizedBox(
                    width: 40.0,
                  ),
                  FaIcon(
                    FontAwesomeIcons.heart,
                    color: Colors.grey,
                    size: 15,
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
