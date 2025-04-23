import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/RoundedButton.dart';
import '../constants.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen({super.key});
  static const String id = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body:Padding(
          padding:EdgeInsets.symmetric(horizontal: 24.0),
        child:Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children:<Widget> [
            Hero(
              tag: 'logo',
              child: SizedBox(
                height: 200.0,
                child: Image.asset('images/logo.png'),
              ),
            ),
            SizedBox(height: 48.0,),
            TextField(
              onChanged: (value){

              },
              decoration:kTextFieldDecoration.copyWith(hintText: 'Enter your email')

            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              onChanged: (value){

              },
              decoration:kTextFieldDecoration.copyWith(hintText: 'Enter your password')
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: () {
                Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
          ],
        )
      ),
    );
  }
}
