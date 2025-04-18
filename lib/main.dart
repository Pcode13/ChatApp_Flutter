import 'package:chatapp/screens/chat_screen.dart';
import 'package:chatapp/screens/login_screen.dart';
import 'package:chatapp/screens/registration_screen.dart';
import 'package:chatapp/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: Colors.black54)
        ),
      ),
      initialRoute:'welcome_screen' ,
      routes: {
        'welcome_screen':(context)=>WelcomeScreen(),
        'login_screen':(context)=>LoginScreen(),
        'registration_screen':(context)=>RegistrationScreen(),
        'chat_screen':(context)=>ChatScreen(),
      },

    );
  }
}

