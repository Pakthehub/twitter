import 'package:flutter/material.dart';
import 'package:twitter_clone/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:twitter_clone/screens/registation_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'home_screen.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static const String id= 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late String email;
  late String password;
  final formkey = GlobalKey<FormState>();
  final FocusNode _passFocusNode = FocusNode();
  TextEditingController _emailTextController = TextEditingController();
  TextEditingController _passwordTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  bool showSpinner = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: showSpinner,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                  color: Colors.lightBlue,
                  child: Form(
                    key: formkey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          child: FaIcon(
                            FontAwesomeIcons.twitter,
                            size: 50,
                            color: Colors.lightBlue,
                          ),
                          radius: 45,
                          backgroundColor: Colors.white,
                        ),
                        SizedBox(
                          height: 100.0,
                        ),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context).requestFocus(_passFocusNode),
                            controller: _emailTextController,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            decoration: kLoginTextFieldDecoration.copyWith(hintText: 'Enter your email'),
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        SizedBox(
                          width: 300,
                          child: TextFormField(
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            onEditingComplete: () => FocusScope.of(context).requestFocus(_passFocusNode),
                            controller: _passwordTextController,
                            style: TextStyle(color: Colors.black, fontSize: 20),
                            decoration: kLoginTextFieldDecoration.copyWith(hintText: 'Password'),
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 40,
                        width: 300,
                        decoration: kCurvedButtonDecoration.copyWith(
                            color: Colors.lightBlue),
                        child: MaterialButton(
                          onPressed: ()async{
                            setState(() {
                              showSpinner = true;
                            });
                            try {
                              final existingUser = await _auth.signInWithEmailAndPassword(
                                  email: email, password: password);
                              if (existingUser != null) {
                                Navigator.pushNamed(context, HomeScreen.id);
                              }
                              setState(() {
                                showSpinner = false;
                              });
                            } catch (e) {
                              print(e);
                            }
                          },
                          child: Text(
                            'Log In',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('New to Twitter?', style: TextStyle(color: Colors.black),),
                          TextButton(
                            child: Text('Sign up now', style: TextStyle(color: Colors.lightBlue),),
                            onPressed: (){
                              Navigator.pushNamed(context, RegistrationScreen.id);
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
