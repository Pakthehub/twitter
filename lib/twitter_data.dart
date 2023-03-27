import 'package:flutter/material.dart';
import 'package:twitter_clone/components/tweet_box.dart';
import 'package:twitter_clone/tweet.dart';




class TwitterData extends ChangeNotifier{






List<Tweet> tweet = [
  // Tweet(tweettext: 'youare crazy'),
  // Tweet(tweettext: 'hello mumu'),
  // Tweet(tweettext: 'welcome to a new dispensation'),

];

void addTweet(String newTweet){


  tweet.add(Tweet(tweettext: newTweet));
  notifyListeners();
}

}