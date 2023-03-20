import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/components/curved_button.dart';
import 'package:twitter_clone/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'home_screen.dart';

class RegistrationScreen extends StatefulWidget {
  static const String id = 'registration_screen';

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool showSpinner = false;
  final _auth = FirebaseAuth.instance;
  late String email;
  late String password;
  final formkey = GlobalKey<FormState>();
  final FocusNode _passFocusNode = FocusNode();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _nameTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: FaIcon(
            FontAwesomeIcons.twitter,
            size: 25,
            color: Colors.lightBlue,
          ),
        ),
      ),
      body: ModalProgressHUD(
        inAsyncCall: showSpinner,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30, vertical: 11),
              child: Text(
                'Create your account',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Form(
              key: formkey,
              child: Column(
                children: [
                  // Name form
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 11),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_passFocusNode),
                      keyboardType: TextInputType.name,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      decoration: kRegTextFormDecoration,
                      controller: _nameTextController,
                      validator: (value) {
                        if (value!.isEmpty ||
                            !RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                          return 'Enter correct name';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  //Email form
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 11),
                    child: TextFormField(
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_passFocusNode),
                      keyboardType: TextInputType.emailAddress,
                      controller: _emailTextController,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      decoration:
                          kRegTextFormDecoration.copyWith(hintText: 'Email'),
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid Email address';
                        } else {
                          return null;
                        }
                      },
                      onChanged: (value) {
                        email = value;
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 11),
                    child: TextFormField(
                      obscureText: true,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).requestFocus(_passFocusNode),
                      style: TextStyle(color: Colors.white, fontSize: 20),
                      decoration:
                          kRegTextFormDecoration.copyWith(hintText: 'Password'),
                      onChanged: (value) {
                        password = value;
                      },
                    ),
                  ),
                ],
              ),
            ),
            CurvedButton(
              title: 'Next',
              onPress: () async {
                Map <String,dynamic> data={'name':_nameTextController.text, 'email':_emailTextController.text};
                FirebaseFirestore.instance.collection('details').add(data);
                  setState(() {
                    showSpinner = true;
                  });
                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if (newUser != null) {
                      Navigator.pushNamed(context, HomeScreen.id);
                    }
                    setState(() {
                      showSpinner = false;
                    });
                  } catch (e) {
                    print(e);
                  }
                },
            ),
          ],
        ),
      ),
    );
  }
}
