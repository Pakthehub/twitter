import 'package:flutter/material.dart';
import 'package:twitter_clone/components/tweet_box.dart';
import 'package:twitter_clone/tweet.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/twitter_data.dart';
import 'create_tweet_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ForYouScreen extends StatefulWidget {
  static const String id = 'for_you_tab_screen';

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  User? loggedInUser;

  @override
  void initState() {
    getCurrentUser();
    super.initState();
  }

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
        print(user.email);
      }
    } catch (e) {
      print(e);
    }
  }

  List<Tweet> tweetList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
          stream: _firestore.collection('tweets').snapshots(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.lightBlueAccent,
                ),
              );
            }

            var list = snapshot.data!.docs
                //TODO: Use to Json here, should be Tweet.Json()
                .map((data) => Tweet(text: data['text'], maker: data['text']))
                .toList();

            return ListView.builder(
              itemBuilder: (context, index) {
                final tweet = list[index];
                return TweetBox(tweet: tweet.text ?? '');
              },
              itemCount: list.length,
            );
          }),
    );
  }
}

class Tweet {
  String? text;
  String? maker;

  Tweet({required this.text, required this.maker});


  //TODO: create from Json


  //TODO: Create to Json.
}
