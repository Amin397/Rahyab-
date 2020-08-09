import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:load/load.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rahyab/Helper/RequestHelper.dart';
import 'package:rahyab/functions.dart';
import 'package:rahyab/screens/register/success_page.dart';

class ProfilePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ProfileScreen(),
      ),
    );
  }
}

class ProfileScreen extends StatefulWidget {

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController fName = TextEditingController();
  TextEditingController lName = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController pre_password = TextEditingController();

  bool isSamed = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var contentHeight = size.height * .7;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Material(
        child: Container(
          child: Stack(
            overflow: Overflow.clip,
            fit: StackFit.expand,
            children: <Widget>[
              _buildProfileBg(size),
              _profileForm(size , contentHeight)
            ],
          ),
        ),
      ),
    );
  }

  Widget _profileForm(Size size , contentHeight){
    return Align(
      alignment: Alignment.bottomCenter,
      child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: BouncingScrollPhysics(),
          child: Container(
              width: size.width,
              height: contentHeight,
              decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 5.0,
                        spreadRadius: 1.0)
                  ]),
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: size.width * .05,
                    vertical: (size.height * .7) * .02),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: contentHeight * .02),
                        child: Text(
                          'تکمیل پروفایل',
                          style: TextStyle(
                              fontFamily: 'iranSance',
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0),
                        ),
                      ),
                      _buildUploadImage(size, contentHeight),
                      SizedBox(
                        height: 10.0,
                      ),
                      textField(size, fName, false, false, 'نام'),
                      textField(size, lName, false, false, 'نام خانوادگی'),
                      textField(size, password, false, true, 'رمز عبور'),
                      _buildRePasswordTextField(size),
                      _buildRaisedButton(size)
                    ],
                  ),
                ),
              ))),
    );
  }

  Widget _buildRePasswordTextField(Size size){
    return Padding(
      padding: EdgeInsets.only(
        left: size.height * .01,
        right: size.width * .05,
        bottom: size.height * .02,
      ),
      child: Container(
        height: 50.0,
        child: TextFormField(
          focusNode: FocusScopeNode(),
          onChanged: (text) {
            setState(() {
              if (password.text == text) {
                isSamed = !isSamed;
              } else {
                isSamed = false;
              }
            });
          },
          decoration: InputDecoration(
              alignLabelWithHint: true,
              labelStyle: TextStyle(
                  fontFamily: 'iranSance',
                  color: Colors.grey,
                  fontSize: 14.0),
              labelText: 'تکرار رمز عبور',
              filled: true,
              suffixIcon: (isSamed)
                  ? Icon(
                Icons.check_circle,
                color: Colors.green,
              )
                  : Icon(
                Icons.cancel,
                color: Colors.red,
              ),
              fillColor: Colors.grey[200],
              enabledBorder: new OutlineInputBorder(
                borderRadius:
                new BorderRadius.circular(25.0),
                borderSide: new BorderSide(
                  color: Color(0xff290d66),
                ),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                  BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                      color: Colors.blue))),
          style: TextStyle(color: Colors.blue),
        ),
      ),
    );
  }

  Widget _buildRaisedButton(Size size){
    return RaisedButton(
      elevation: 5.0,
      color: Colors.green,
      onPressed: sendLastReg,
      child: Text(
        'تکمیل ثبت نام',
        style: TextStyle(
            fontFamily: 'iranSance',
            color: Colors.white,
            fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget textField(Size size, controller, number, password, hint) {
    return Padding(
      padding: EdgeInsets.only(
        left: size.height * .01,
        right: size.width * .05,
        bottom: size.height * .02,
      ),
      child: Container(
        height: 50.0,
        child: TextFormField(
          focusNode: FocusScopeNode(),
          keyboardType: (number) ? TextInputType.number : TextInputType.text,
          maxLines: 1,
          controller: controller,
          obscureText: password,
          decoration: InputDecoration(
            enabledBorder: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(25.0),
              borderSide: new BorderSide(
                color: Color(0xff290d66),
              ),
            ),
            filled: true,
            fillColor: Colors.grey[200],
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(color: Colors.blue)),
            labelText: hint,
            labelStyle: TextStyle(
                fontFamily: 'iranSance', color: Colors.grey, fontSize: 14.0),
          ),
        ),
      ),
    );
  }

  Widget _buildUploadImage(Size size , contentHeight){
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        height: contentHeight * .25,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.grey[200],
            border: Border.all(width: .5),
            boxShadow: [
              BoxShadow(
                  color: Color(0xff290d66),
                  blurRadius: 5.0,
                  spreadRadius: 0.5),
            ]),
        child: Center(
          child: Column(
            mainAxisAlignment:
            MainAxisAlignment.center,
            crossAxisAlignment:
            CrossAxisAlignment.center,
            children: <Widget>[
              Icon(
                Icons.camera_alt,
                color: Colors.grey,
                size: 30.0,
              ),
              Text(
                'آپلود تصویر',
                style: TextStyle(
                    fontFamily: 'iranSance',
                    color: Colors.grey),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildProfileBg(Size size){
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: size.height * .05),
        width: size.width,
        height: size.height * .35,
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset('assets/images/background.jpg')
                    .image)),
        child: Center(
          child: Column(
            children: <Widget>[
              Container(
                margin:
                EdgeInsets.only(top: (size.width * .35) * .05),
                width: size.width * .18,
                height: (size.height * .35) * .25,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset('assets/images/logo.png')
                            .image)),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'رهیاب',
                    style: TextStyle(
                        fontFamily: 'iranSance',
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                        color: Colors.white),
                  ),
                  Text(
                    'RAHYAB',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  sendLastReg(){
    if (isSamed) {
      showLoadingDialog();
      RequestHelper.makePost(
          'http://admin.rahyabkish.ir/Customers/API/_register3?token=test&'
              'mobile=521652&'
              'fname=${fName.text}&'
              'lname=${lName.text}&'
              'password${password.text}&'
              'avatar=text'
      ).then((value) {
        if(!value['result']["active"]){
          hideLoadingDialog();
          Navigator.pushReplacement(
              context,
              PageTransition(
                  type: PageTransitionType.upToDown,
                  child: SuccessRegPage()));
        }else{

        }
      });
    } else {
      _showSnackBar(
          'تکرار رمز عبور یکسان نیست !',
          context);
    }
  }

  _showSnackBar(String pin, BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      content: Container(
          height: size.height * .025,
          child: Center(
            child: Text(
              '$pin',
              style: TextStyle(fontSize: 14),
            ),
          )),
      backgroundColor: Colors.red,
    );
    Scaffold.of(context).hideCurrentSnackBar();
    Scaffold.of(context).showSnackBar(snackBar);
  }
}
