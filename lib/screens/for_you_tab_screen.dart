import 'package:flutter/material.dart';
import 'package:twitter_clone/components/tweet_box.dart';
import 'package:twitter_clone/tweet.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/twitter_data.dart';
import 'create_tweet_screen.dart';


class ForYouScreen extends StatefulWidget {
  static const String id= 'for_you_tab_screen';

  @override
  State<ForYouScreen> createState() => _ForYouScreenState();
}

class _ForYouScreenState extends State<ForYouScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(itemBuilder: (context, index){
        return TweetBox(tweet: context.watch<TwitterData>().tweet[index].name);
      },
      itemCount: context.watch<TwitterData>().tweet.length,)
    );
  }
}


