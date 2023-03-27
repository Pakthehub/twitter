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
  late User loggedInUser;
  late  String tweetsText;
  late String tweetMaker;

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




  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('tweets').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          {
            final tweets = snapshot.data?.docs;
            for (var tweet in tweets!) {
              final data = tweet.data() as Map;
              tweetsText = data['text'];
              tweetMaker = data['tweetmaker'];


              final currentUser = loggedInUser.email;



            }

              return ListView.builder(
                itemBuilder: (context, index) {
                  return TweetBox(
                      tweet: tweetsText= context.watch<TwitterData>().tweet[index].tweettext);
                },
                itemCount: context.watch<TwitterData>().tweet.length,
              );
          }
        }
    ),
    );
  }
}
