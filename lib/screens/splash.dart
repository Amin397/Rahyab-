import 'dart:async';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rahyab/other/const.dart';

import '../functions.dart';
import 'login_screen.dart';
import 'mainScreen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  startTime() async {
    return new Timer(Duration(seconds: 5), (){
      Navigator.pushReplacement(
          context,
          PageTransition(
              type: PageTransitionType.upToDown, child: LoginPage()));
    });
  }

  void navigationPage() async {
    print(await getPref('expert_id'));
    if (await getPref('expert_id') != null) {
      var connectivityResult = await (Connectivity().checkConnectivity());
      if (connectivityResult == ConnectivityResult.mobile ||
          connectivityResult == ConnectivityResult.wifi) {
        var data = await GetExpert(await getPref('expert_id'));
        var expertId =
        int.parse(data['data']['expert_id'] != null ? data['data']['expert_id'] : '0');
        print(await getPref('expert_id'));
        if (expertId > 0) {
          Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.upToDown, child: MyHomePage()));
        } else {
          Navigator.of(context).pushReplacementNamed(SIGN_IN);
        }
      } else {
        Navigator.of(context).pushReplacementNamed(SIGN_IN);
      }
    } else {
      Navigator.of(context).pushReplacementNamed(SIGN_IN);
    }
//    Navigator.pushReplacement(
//        context,
//        PageTransition(
//            type: PageTransitionType.upToDown, child: SignInPage()));
  }

  @override
  void initState() {
    super.initState();

    startTime();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery
        .of(context)
        .size;

    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[

          Align(
            alignment: Alignment.center,
            child: Container(
              height: size.height,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image
                          .asset('assets/images/background.jpg')
                          .image
                  )
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: size.height * .2,
              width: size.width * .35,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20.0),
                      topLeft: Radius.circular(20.0)),
                  color: Colors.white
              ),
              child: Stack(
                children: <Widget>[
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      margin: EdgeInsets.only(top: (size.width * .35) * .05),
                      width: (size.width * .35) * .57,
                      height: (size.height * .2) * .52,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: Image
                                  .asset('assets/images/logo.png')
                                  .image
                          )
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      height: (size.height * .2) * .4,
                      width: (size.width * .35),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Text('رهیاب',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0,
                              height: 1
                            ),),
                            Text('RAHYAB', style: TextStyle(
                              height: 1,
                                fontWeight: FontWeight.w600
                            ),),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: size.height * .25,
              width: size.width * .5,
              child: Center(
                child: Lottie.asset('assets/anim/loading.json',
                    height: size.height * .1,
                    width: size.width * .3,
                    repeat: true
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
