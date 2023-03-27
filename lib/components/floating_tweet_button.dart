import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/create_tweet_screen.dart';




class FloatingTweetbutton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Navigator.pushNamed(context, CreateTweetScreen.id);
      },
      child: Icon(Icons.add),
    );
  }
}

