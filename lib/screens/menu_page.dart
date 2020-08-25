import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rahyab/Helper/AlertHelper.dart';
import 'package:rahyab/Helper/NavHelper.dart';
import 'package:rahyab/other/zoom_scaffold.dart';
import 'package:rahyab/screens/card_management_screen.dart';
import 'package:rahyab/screens/profile_screen.dart';

class MenuScreen extends StatelessWidget {

  final List<MenuItem> options = [
    MenuItem(Icons.person, 'پروفایل'),
    MenuItem(Icons.credit_card, 'مدیریت کارت'),
    MenuItem(Icons.assignment, 'صورتحساب'),
  ];

//  Future<bool> onWillPop() {
//    DateTime now = DateTime.now();
//    if (currentBackPressTime == null ||
//        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
//      currentBackPressTime = now;
//      Fluttertoast.showToast(msg: exit_warning);
//      return Future.value(false);
//    }
//    return Future.value(true);
//  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        padding: EdgeInsets.only(top: 62, bottom: 8, left: size.width / 2.9),
        color: Color(0xff290d66),
        child: Column(
          children: <Widget>[
            _buildMenuProfilePic(size),
            Spacer(),
            _buildMenuOption(size, (){
              NavHelper.push(context, ProfileScreen());
            }, Icons.person, 'پروفایل'),
            _buildMenuOption(size, (){
              NavHelper.push(context, CardManagementScreen());
            }, Icons.credit_card, 'مدیریت کارت'),
            _buildMenuOption(size, (){}, Icons.assignment, 'صورتحساب'),
            Spacer(),
            _buildMenuOption(size, (){}, Icons.vpn_key, 'تغییر رمزعبور'),
            _buildMenuOption(size, (){
              AlertHelper.exitAlertDialog(context, (){exit(0);});
            }, Icons.exit_to_app, 'خروج'),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuOption(Size size , Function func , icon , text){
    return GestureDetector(
      onTap: func,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        title: Text(
          text,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              color: Colors.white, fontFamily: 'iranSance'),
        ),
      ),
    );
  }

  Widget _buildMenuProfilePic(size) {
    return Container(
      height: size.height * .12,
      decoration:
          BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8.0))),
      child: Row(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(5.0),
            width: size.width * .25,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.black26, spreadRadius: 1.2, blurRadius: 5.0)
                ],
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 2.0),
                image: DecorationImage(
                    fit: BoxFit.contain,
                    image: Image.asset('assets/images/avatar.png').image)),
          ),
          Expanded(
              flex: 1,
              child: Flex(
                direction: Axis.vertical,
                children: <Widget>[
                  Container(
                    width: size.width * .75,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'مصطفی براتی',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18.0,
                              fontFamily: 'iranSance'),
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'کد عضویت: ',
                              style: TextStyle(
                                  fontFamily: 'iranSance',
                                  fontSize: 10.0,
                                  color: Colors.white60),
                            ),
                            Text(
                              'ba45124845',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontFamily: 'IRANSans',
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              'موجودی: ',
                              style: TextStyle(
                                  fontFamily: 'iranSance',
                                  fontSize: 10.0,
                                  color: Colors.white60),
                            ),
                            Text(
                              '500.000',
                              style: TextStyle(
                                fontSize: 14.0,
                                color: Colors.white,
                                fontFamily: 'IRANSans',
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}

class MenuItem {
  String title;
  IconData icon;

  MenuItem(this.icon, this.title);
}
