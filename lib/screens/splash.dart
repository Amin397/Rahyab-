import 'dart:async';
import 'dart:convert';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:load/load.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rahyab/Helper/NavHelper.dart';
import 'package:rahyab/Helper/PrefHelper.dart';
import 'package:rahyab/model/WorkModel.dart';
import 'login_screen.dart';
import 'package:http/http.dart' as http;

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {

  List<WorkModel> list = List<WorkModel>();

  startTime() async {
    return new Timer(Duration(seconds: 2), (){
      NavHelper.pushR(context, LoginPage());
    });
  }

  init(){
     Timer(Duration(seconds: 3), (){
       _checkInternetConnectivity();
     });
  }

  _checkInternetConnectivity() async {
    var result = await Connectivity().checkConnectivity();
    if(result != ConnectivityResult.none){
      await apiWork();
    }else{
      showDialog(
        barrierDismissible: false,
          context: context,
          builder: (_) => Directionality(
            textDirection: TextDirection.rtl,
            child: AlertDialog(
              actions: <Widget>[
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    init();
                  },
                  child: Container(
                    height: 50.0,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(35.0),
                      color: Colors.orangeAccent,
                    ),
                    child: Center(
                      child: Text('تلاش مجدد' , style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'iranSance'
                      ),),
                    ),
                  ),
                )
              ],
              scrollable: true,
              backgroundColor: Colors.transparent,
              elevation: 50.0,
              content: _buildContentAlert(),
            ),
          )
      );
    }
  }
  Widget _buildContentAlert(){
    return Container(
      padding: EdgeInsets.all(10.0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10.0)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            height: 80.0,
            child: Center(
              child: Icon(Icons.warning , size: 50.0, color: Colors.purple[300],),
            ),
          ),
          Text('اتصال به اینترنت خود را بررسی کنید !' , style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 14.0,
            fontFamily: 'iranSance'
          ),)
        ],
      ),
    );
  }



  apiWork() async
  {
    http.Response r = await http
        .get(
        'http://admin.rahyabkish.ir/WorkGroups/API/_getWorkGroup?token=test');
    if (r.statusCode == 200) {
      Map<String, dynamic> b = jsonDecode(r.body);
//      print(b['data']);
//      for (var item in b['data']) {
//        print('- apiWork');
//        print(item['work_id']);
//        list.add(WorkModel.fromJson(item));

      print('%%%%%%%%%%%%%%%%%%%%%%%%%');
      await PrefHelper.setWorkGroup(b['data']);
      print('%%%%%%%%%%%%%%%%%%%%%%%%%');
      startTime();
    }
  }

  @override
  void initState() {
    super.initState();

    init();
    //startTime();


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

          _buildBg(size),
          _buildBottomContainer(size),
          _buildLoadingSplash(size)
        ],
      ),
    );
  }

  Widget _buildLoadingSplash(Size size){
    return Align(
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
    );
  }

  Widget _buildBottomContainer(Size size){
    return Align(
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
                            fontFamily: 'iranSance',
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
    );
  }

  Widget _buildBg(Size size){
    return Align(
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
    );
  }
}
