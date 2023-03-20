import 'package:flutter/material.dart';
import 'package:twitter_clone/components/floating_tweet_button.dart';


class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingTweetbutton(),
    );
  }
}
