import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rahyab/main.dart';
import 'package:rahyab/screens/mainScreen.dart';
import 'package:rahyab/screens/main_pages/page_view/pazirandegan_items_detailes/main_details_screen.dart';

class SuccessRegPage extends StatefulWidget {
  @override
  _SuccessRegPageState createState() => _SuccessRegPageState();
}

class _SuccessRegPageState extends State<SuccessRegPage> with TickerProviderStateMixin{

  AnimationController animationController;

  startTime() async {
    return new Timer(Duration(seconds: 8), (){
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.upToDown, child: MyHomePage()));
    });
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(vsync: this);

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: Center(
          child: Container(
            height: size.height * .5,
            width: size.width,
            child: Column(
              children: <Widget>[
                Lottie.asset(
                    'assets/anim/register_success.json',
                    controller: animationController,
                    fit: BoxFit.contain,
                    height: size.height * .4,
                    width: size.width ,
                    repeat: true,
                  onLoaded: (composition) {
                    // Configure the AnimationController with the duration of the
                    // Lottie file and start the animation.
                    animationController
                      ..duration = composition.duration
                      ..forward();
                  },
                ),
                Text('عضویت با موفقیت انجام شد' , style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'iranSance'
                ),)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
