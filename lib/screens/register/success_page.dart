import 'dart:async';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:rahyab/Helper/NavHelper.dart';
import 'package:rahyab/screens/mainScreen.dart';

class SuccessRegPage extends StatefulWidget {
  @override
  _SuccessRegPageState createState() => _SuccessRegPageState();
}

class _SuccessRegPageState extends State<SuccessRegPage> with TickerProviderStateMixin{

  AnimationController animationController;

  startTime() async {
    return new Timer(Duration(seconds: 7), (){
      NavHelper.pushR(context, MyHomePage());
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
                _buildLottieAnim(size),
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

  Widget _buildLottieAnim(Size size){
    return Lottie.asset(
      'assets/anim/register_success.json',
      controller: animationController,
      fit: BoxFit.contain,
      height: size.height * .4,
      width: size.width ,
      repeat: true,
      onLoaded: (composition) {
        animationController
          ..duration = composition.duration
          ..forward();
      },
    );
  }
}
