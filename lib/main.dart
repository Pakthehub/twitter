import 'package:flutter/material.dart';
import 'package:twitter_clone/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'twitter_data.dart';
import 'screens/login_screen.dart';
import 'screens/registation_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'screens/home_screen.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(
      providers: [ChangeNotifierProvider(
        create: (_) => TwitterData(),
      )],
      child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.white),
        ),
      ),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context)=> RegistrationScreen(),
        HomeScreen.id: (context)=> HomeScreen(),

      },
    );
  }
}
