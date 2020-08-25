import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            height: size.height,
            width: size.width,
            color: Colors.grey[200],
            child: Stack(
              children: <Widget>[
                _buildTopContainer(size),
                _buildMainContainer(size),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMainContainer(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        color: Colors.white,
        elevation: 10.0,
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0), topLeft: Radius.circular(20.0)),
        child: Container(
          width: size.width,
          height: size.height * .75,
          decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0))),
          child: Stack(
            overflow: Overflow.visible,
            fit: StackFit.expand,
            children: <Widget>[
              _buildProfileImage(size),
              _buildProfileMainContainer(size),
              _buildEditProfile(size),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditProfile(Size size) {
    return Positioned(
      top: 20.0,
      right: 20.0,
      child: Material(
        elevation: 5.0,
        color: Colors.grey[500],
        borderRadius: BorderRadius.all(Radius.circular(10.0)),
        child: Container(
          height: size.height * .06,
          width: size.width * .11,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.all(Radius.circular(10.0)),
          ),
          child: Center(
            child: IconButton(
              onPressed: () {
                print('edit');
              },
              icon: Icon(Icons.edit, color: Color(0xff290d66)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProfileMainContainer(Size size) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        margin: EdgeInsets.symmetric(
            horizontal: size.width * .02, vertical: size.height * .01),
        width: size.width,
        height: (size.height * .73) * .86,
        child: Column(
          children: <Widget>[
            Text(
              'مصطفی براتی',
              style: TextStyle(
                  fontFamily: 'iranSance',
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              'مشهد',
              style: TextStyle(
                fontFamily: 'iranSance',
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Material(
              elevation: 5.0,
              borderRadius: BorderRadius.all(Radius.circular(12.0)),
              child: Container(
                width: size.width,
                height: size.height * .07,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade700,
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.monetization_on,
                          size: 20.0,
                        ),
                        SizedBox(
                          width: 5.0,
                        ),
                        Text(
                          'اعتبار',
                          style: TextStyle(
                              fontFamily: 'iranSance',
                              color: Colors.black,
                              fontSize: 12.0),
                        ),
                      ],
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 15.0),
                        height: .3,
                        color: Colors.blueGrey,
                      ),
                    ),
                    Text(
                      '12.000.000 ريال',
                      style: TextStyle(
                          fontFamily: 'iranSance',
                          color: Colors.black,
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Container(
                width: size.width,
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Material(
                        elevation: 10.0,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(15.0),
                            topRight: Radius.circular(15.0)),
                        child: Container(
                          height: size.height * .22,
                          width: size.width,
                          decoration: BoxDecoration(
                              color: Color(0xff290d66),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(15.0),
                                  topRight: Radius.circular(15.0))),
                          child: Stack(
                            children: <Widget>[
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: Container(
                                    padding: EdgeInsets.all(15.0),
                                    height: size.height * .215,
                                    width: size.width,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topRight: Radius.circular(15.0),
                                            topLeft: Radius.circular(15.0))),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Text(
                                              'کد عضویت',
                                              style: TextStyle(
                                                  fontFamily: 'iranSance',
                                                  color: Colors.black,
                                                  fontSize: 12.0),
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.0),
                                                height: .3,
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                            Text(
                                              'ba45124845',
                                              style: TextStyle(
                                                fontFamily: 'iranSance',
                                                color: Colors.blueGrey[400],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.lock,
                                                  size: 20.0,
                                                ),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                Text(
                                                  'رمز عبور',
                                                  style: TextStyle(
                                                      fontFamily: 'iranSance',
                                                      color: Colors.black,
                                                      fontSize: 12.0),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.0),
                                                height: .3,
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                            Text(
                                              '*************',
                                              style: TextStyle(
                                                fontFamily: 'iranSance',
                                                color: Colors.blueGrey[400],
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Row(
                                              children: <Widget>[
                                                Icon(
                                                  Icons.phone_iphone,
                                                  size: 20.0,
                                                ),
                                                SizedBox(
                                                  width: 5.0,
                                                ),
                                                Text(
                                                  'موبایل',
                                                  style: TextStyle(
                                                      fontFamily: 'iranSance',
                                                      color: Colors.black,
                                                      fontSize: 12.0),
                                                ),
                                              ],
                                            ),
                                            Expanded(
                                              flex: 1,
                                              child: Container(
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 15.0),
                                                height: .3,
                                                color: Colors.blueGrey,
                                              ),
                                            ),
                                            Text(
                                              '09383974483',
                                              style: TextStyle(
                                                fontFamily: 'iranSance',
                                                color: Colors.blueGrey[400],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Material(
                            elevation: 10.0,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0)),
                            child: Container(
                              height: size.height * .22,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: Color(0xff290d66),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0))),
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: EdgeInsets.all(15.0),
                                      height: size.height * .215,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15.0),
                                              topLeft: Radius.circular(15.0))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Icon(Icons.mail, size: 20.0),
                                                  SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Text(
                                                    'ایمیل',
                                                    style: TextStyle(
                                                        fontFamily: 'iranSance',
                                                        color: Colors.black,
                                                        fontSize: 12.0),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                                  height: .3,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                              Text(
                                                'RahyabKish@gmail.com',
                                                style: TextStyle(
                                                  fontFamily: 'iranSance',
                                                  color: Colors.blueGrey[400],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Image.asset(
                                                    'assets/images/twitter_logo.png',
                                                    fit: BoxFit.cover,
                                                    height: size.width * .07,
                                                    width: size.width * .07,
                                                  ),
                                                  Text(
                                                    'توئیتر',
                                                    style: TextStyle(
                                                        fontFamily: 'iranSance',
                                                        color: Colors.black,
                                                        fontSize: 12.0),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                                  height: .3,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                              Text(
                                                'RahyabKish@gmail.com',
                                                style: TextStyle(
                                                  fontFamily: 'iranSance',
                                                  color: Colors.blueGrey[400],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Image.asset(
                                                    'assets/images/facebook.png',
                                                    fit: BoxFit.cover,
                                                    height: size.width * .07,
                                                    width: size.width * .07,
                                                  ),
                                                  Text(
                                                    'فیسبوک',
                                                    style: TextStyle(
                                                        fontFamily: 'iranSance',
                                                        color: Colors.black,
                                                        fontSize: 12.0),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                                  height: .3,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                              Text(
                                                'RahyabKish@gmail.com',
                                                style: TextStyle(
                                                  fontFamily: 'iranSance',
                                                  color: Colors.blueGrey[400],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Material(
                            elevation: 10.0,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15.0),
                                topRight: Radius.circular(15.0)),
                            child: Container(
                              height: size.height * .15,
                              width: size.width,
                              decoration: BoxDecoration(
                                  color: Color(0xff290d66),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(15.0),
                                      topRight: Radius.circular(15.0))),
                              child: Stack(
                                children: <Widget>[
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Container(
                                      padding: EdgeInsets.all(15.0),
                                      height: size.height * .145,
                                      width: size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(15.0),
                                              topLeft: Radius.circular(15.0))),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.fingerprint,
                                                    size: 20.0,
                                                  ),
                                                  SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Text(
                                                    'کد ملی',
                                                    style: TextStyle(
                                                        fontFamily: 'iranSance',
                                                        color: Colors.black,
                                                        fontSize: 12.0),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                                  height: .3,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                              Text(
                                                '3770260406',
                                                style: TextStyle(
                                                  fontFamily: 'iranSance',
                                                  color: Colors.blueGrey[400],
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: <Widget>[
                                              Row(
                                                children: <Widget>[
                                                  Icon(
                                                    Icons.location_on,
                                                    size: 20.0,
                                                  ),
                                                  SizedBox(
                                                    width: 5.0,
                                                  ),
                                                  Text(
                                                    'آدرس',
                                                    style: TextStyle(
                                                        fontFamily: 'iranSance',
                                                        color: Colors.black,
                                                        fontSize: 12.0),
                                                  ),
                                                ],
                                              ),
                                              Expanded(
                                                flex: 1,
                                                child: Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 15.0),
                                                  height: .3,
                                                  color: Colors.blueGrey,
                                                ),
                                              ),
                                              Text(
                                                'مشهد،خیابان خلیج فارس',
                                                style: TextStyle(
                                                  fontFamily: 'iranSance',
                                                  color: Colors.blueGrey[400],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          )),
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(Size size) {
    return Positioned(
      top: -100.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: 200.0,
        child: Center(
          child: Material(
            elevation: 10.0,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            child: Container(
              height: size.height * .18,
              width: size.height * .18,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: Image.asset('assets/images/profile_avatar.png')
                          .image)),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTopContainer(Size size) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        width: size.width,
        height: size.height * .3,
        child: Image(
          fit: BoxFit.fill,
          image: Image.asset('assets/images/top_profile.png').image,
        ),
      ),
    );
  }
}
