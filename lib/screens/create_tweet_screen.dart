import 'package:twitter_clone/main.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/components/curved_button.dart';
import 'package:twitter_clone/constants.dart';
import 'package:provider/provider.dart';
import 'package:twitter_clone/twitter_data.dart';

class CreateTweetScreen extends StatelessWidget {
  late String newTweet;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      color: Colors.black,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: (){
                  Navigator.pop(context);
                  },
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 18),
                ),
                style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white)),
              ),
             Row(
               children: [
                 TextButton(
                   onPressed: null,
                   child: Text(
                     'Drafts',
                     style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                   ),
                   style: ButtonStyle(
                       foregroundColor: MaterialStateProperty.all(Colors.lightBlue)),
                 ),
                 CurvedButton(title: 'Tweet', onPress: (){
                   context.read<TwitterData>().addTweet(newTweet);
                   Navigator.pop(context);
                 },),
                 SizedBox(width: 12,)
               ],
             )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 30.0, right: 30.0),
            child: TextField(
              autofocus: true,
              onChanged: (value){
                newTweet = value;
              },
              style: TextStyle(
                color: Colors.white, fontSize: 20
              ),
              decoration: kTextFielddecoration
            ),
          )
        ],
      ),
    );
  }
}


