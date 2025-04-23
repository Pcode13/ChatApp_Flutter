import 'package:chatapp/components/RoundedButton.dart';
import 'package:flutter/material.dart';
import 'login_screen.dart';
import 'registration_screen.dart';

class WelcomeScreen extends StatefulWidget {
  static const String id = 'welcome_screen';

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation animation;



  @override
  void initState() {
    controller =
        AnimationController(duration: Duration(seconds: 1), vsync: this);
    // animation = ColorTween(begin: Colors.blueGrey, end: Colors.white)
    //     .animate(controller);
    animation = CurvedAnimation(parent: controller, curve: Curves.decelerate);
    controller.forward();
    // animation.addListener((listener){
    //   if(listener == AnimationStatus.completed){
    //     controller.reverse(from: 1.0);
    //   }else if(listener == AnimationStatus.dismissed) {
    //     controller.forward();
    //   }
    //   } as VoidCallback)
    // });
    // animation.addStatusListener((status){
    //   if(status == AnimationStatus.completed){
    //         controller.reverse(from: 1.0);
    //       }else if(status == AnimationStatus.dismissed) {
    //         controller.forward();
    //       }
    // });
    controller.addListener(() {
      setState(() {});
      // print(animation.value);
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Row(
              children: <Widget>[
                Hero(
                  tag: 'logo',
                  child: SizedBox(
                    height:animation.value *100,
                    child: Image.asset('images/logo.png'),
                  ),
                ),
                const Text(
                  'Flash Chat',
                  style: TextStyle(
                    fontSize: 45.0,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 48.0),
           RoundedButton(
             title: 'Log In',
             colour: Colors.lightBlueAccent,
             onPressed: () {
               Navigator.pushNamed(context, LoginScreen.id);
             },
           ),
            RoundedButton(
              title: 'Register',
              colour: Colors.blueAccent,
              onPressed: () {
                Navigator.pushNamed(context, RegistrationScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
