import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/tweet.dart';


class TwitterData extends ChangeNotifier {
  final _firestore = FirebaseFirestore.instance;
  // List<Tweet> tweet = [
  //   // Tweet(tweettext: 'youare crazy'),
  //   // Tweet(tweettext: 'hello mumu'),
  //   // Tweet(tweettext: 'welcome to a new dispensation'),
  // ];


  void addTweet(String newTweet) {
    Map<String, dynamic> tweetData = {
      'text' : newTweet
    };

    String tweetJson = json.encode(tweetData);

    //TODO: Use toJson here. should be Tweet.toJson().
    _firestore.collection('tweets').add(json.decode(tweetJson));
    notifyListeners();
  }
}



