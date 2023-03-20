import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';

class CurvedButton extends StatelessWidget {
  CurvedButton({required this.title, required this.onPress});
  final String title;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 27,
      width: 65,
      decoration: kCurvedButtonDecoration,
      child: MaterialButton(
        onPressed: onPress,
        child: Text(
          title,
          style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: Colors.white70),
        ),
      ),
    );
  }
}