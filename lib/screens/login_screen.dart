import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../components/RoundedButton.dart';
import '../constants.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'chat_screen.dart';

class LoginScreen extends StatefulWidget {
  // const LoginScreen({super.key});
  static const String id = 'login_screen';
  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final  _auth = FirebaseAuth.instance;
  String email = "";
  String password = "";


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
              textAlign: TextAlign.center,
              keyboardType: TextInputType.emailAddress,
              onChanged: (value)=>email = value,
              decoration:kTextFieldDecoration.copyWith(hintText: 'Enter your email')

            ),
            SizedBox(
              height: 8.0,
            ),
            TextField(
              textAlign: TextAlign.center,
              obscureText: true,
              onChanged: (value)=>password = value,
              decoration:kTextFieldDecoration.copyWith(hintText: 'Enter your password')
            ),
            SizedBox(
              height: 24.0,
            ),
            RoundedButton(
              title: 'Log In',
              colour: Colors.lightBlueAccent,
              onPressed: ()async {
                try{
                  final UserCredential userCredential =
                      await _auth.signInWithEmailAndPassword(
                      email: email, password: password);
                  if (userCredential.user != null) {
                    Navigator.pushNamed(context, ChatScreen.id);
                  }
                }catch(e){
                  print(e);
                }
                // Navigator.pushNamed(context, LoginScreen.id);
              },
            ),
          ],
        )
      ),
    );
  }
}
