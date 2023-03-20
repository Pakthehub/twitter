import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/create_tweet_screen.dart';



class FloatingTweetbutton extends StatelessWidget {
  const FloatingTweetbutton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isScrollControlled: true,
          isDismissible: false,
          builder: (context) => SingleChildScrollView(
            child: Container(
                padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
                child: CreateTweetScreen()),
          ),
        );
      },
      child: Icon(Icons.add),
    );
  }
}
