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
            backgroundImage: NetworkImage('https://www.thesprucepets.com/thmb/3ABKoAPm0Hu4PcWsDH1giawq7ck=/750x0/filters:no_upscale():max_bytes(150000):strip_icc():format(webp)/chinese-dog-breeds-4797219-hero-2a1e9c5ed2c54d00aef75b05c5db399c.jpg',), 
            radius: 15,
          ),
          SizedBox(
            width: 8,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 3.0,),
                Text(
                  'Pakman',
                  style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                ),
                Text(
                  tweet,
                  style: TextStyle(fontSize: 15),
                ),
                SizedBox(height: 10.0,),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Row(
                    children: [
                      FaIcon(
                        FontAwesomeIcons.comment,
                        color: Colors.grey,
                        size: 13,
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      FaIcon(
                        FontAwesomeIcons.retweet,
                        color: Colors.grey,
                        size: 13,
                      ),
                      SizedBox(
                        width: 50.0,
                      ),
                      FaIcon(
                        FontAwesomeIcons.heart,
                        color: Colors.grey,
                        size: 13,
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
