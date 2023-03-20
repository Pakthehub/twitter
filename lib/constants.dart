import 'package:flutter/material.dart';

const kTextFielddecoration = InputDecoration(
border: InputBorder.none,
hintText: "What's happening?",
hintStyle: TextStyle(color: Colors.white24,
fontSize: 20)
);


const kLoginTextFieldDecoration = InputDecoration(
  filled: true,
  fillColor: Colors.white,
  hintText: 'Enter a value',
  hintStyle: TextStyle(
      color: Colors.black12
  ),
  contentPadding:
  EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide:
    BorderSide(color: Colors.lightBlueAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kCurvedButtonDecoration= BoxDecoration(
color: Colors.blue,
borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60), bottomRight: Radius.circular(60),bottomLeft: Radius.circular(60)),
);

const kRegTextFormDecoration = InputDecoration(
  enabledBorder: UnderlineInputBorder(
    borderSide: BorderSide(width: 1, color: Colors.white30),
  ),
  hintText: 'Name',
  hintStyle: TextStyle(
      color: Colors.grey,
      fontSize: 17
  ),
);