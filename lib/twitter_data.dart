import 'package:flutter/material.dart';
import 'package:twitter_clone/tweet.dart';


class TwitterData extends ChangeNotifier{

List<Tweet> tweet = [
  Tweet(name: 'youare crazy'),
  Tweet(name: 'hello mumu'),
  Tweet(name: 'welcome to a new dispensation'),

];

void addTweet(String newTweet){
  tweet.add(Tweet(name: newTweet));
  notifyListeners();
}

}