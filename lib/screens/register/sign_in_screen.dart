import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:load/load.dart';
import 'package:lottie/lottie.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:page_transition/page_transition.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:rahyab/Helper/NavHelper.dart';
import 'package:rahyab/Helper/PrefHelper.dart';
import 'package:rahyab/Helper/RequestHelper.dart';
import 'profile_screen.dart';

class SignInPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        body: SignInScreen(),
      ),
    );
  }
}

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen>
    with TickerProviderStateMixin {
  AnimationController _controller;

  bool checked = false;
  String code;

  TextEditingController phone_Number = TextEditingController();

  TextEditingController pin_code = TextEditingController();

  var phoneMask = MaskTextInputFormatter(
      mask: '++++-+++-++-++', filter: {"+": RegExp(r'[0-9]')});
  final FocusNode _pinPutFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Material(
        child: Container(
          child: Stack(
            overflow: Overflow.clip,
            fit: StackFit.expand,
            children: <Widget>[
              _buildSignUpBg(size),
              Align(
                  alignment: Alignment.bottomCenter,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: BouncingScrollPhysics(),
                    child: Container(
                        width: size.width,
                        height: size.height * .5,
                        decoration: BoxDecoration(
                            color: Colors.white,
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
                              vertical: (size.height * .5) * .05),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'ثبت نام',
                                style: TextStyle(
                                    fontFamily: 'iranSance',
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20.0),
                              ),
                              _buildTextField(size),
                              Divider(
                                height: 5,
                                color: Colors.black26,
                              ),
                              _buildReadLogic(size),
                              Divider(
                                height: 5,
                                color: Colors.black26,
                              ),
                              Padding(
                                padding: EdgeInsets.only(
                                    top: (size.height * .7) * .1),
                                child: RaisedButton(
                                  onPressed: getRegCode,
                                  splashColor: Colors.white,
                                  color: Color(0xff860d9b),
                                  child: Center(
                                    child: Text(
                                      'دریافت کد یکبارمصرف',
                                      style: TextStyle(
                                          fontFamily: 'iranSance',
                                          color: Colors.white,
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        )),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  getRegCode(){
    if(phone_Number.text.length == 11){
      showLoadingDialog();
      RequestHelper.makePost(
        'http://admin.rahyabkish.ir/Customers/API/_register1?token=test&mobile=${phone_Number.text}',
      ).then((value) async {
        print(value);
        if(value['result']['codeSend'] || value['result']['codeSendAgain']){
          hideLoadingDialog();
          setState(() {
            code = value['code'];
            print(code);
          });
          _validationAlert(context);
        }
      });
      if (checked) {
      } else {
        hideLoadingDialog();
        _showSnackBar(
            'قوانین را تائید نکردید', context);
      }
    }else{
      _showSnackBar(
          'شماره موبایل صحیح نیست', context);
    }
  }

  _buildReadLogic(Size size){
    return Row(
      mainAxisAlignment:
      MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Container(
              width: 50.0,
              height: 50.0,
              child: InkWell(
                onTap: () {
                  if (!checked) {
                    _controller
                      ..duration =
                      Duration(seconds: 3)
                      ..forward();
                  } else {
                    _controller
                      ..duration =
                      Duration(seconds: 2)
                      ..reverse();
                  }
                  setState(() {
                    checked = !checked;
                    print(checked);
                  });
                },
                child: Lottie.asset(
                  'assets/anim/checked.json',
                  controller: _controller,
                  fit: BoxFit.cover,
                  repeat: false,
                ),
              ),
            ),
            Text(
              'قوانین مورد تایید میباشد !',
              style: TextStyle(
                  fontFamily: 'iranSance',
                  color: Colors.black,
                  fontSize: 14.0),
            ),
          ],
        ),
        FlatButton(
          onPressed: () {},
          child: Center(
            child: Text(
              'قوانین و مقررات',
              style: TextStyle(
                  color: Color(0xff860d9b),
                  fontFamily: 'iranSance',
                  fontSize: 10.0),
            ),
          ),
        )
      ],
    );
  }

  Widget _buildTextField(Size size){
    return Padding(
      padding: EdgeInsets.only(
        top: size.height * .05,
        left: size.height * .01,
        right: size.width * .05,
        bottom: size.height * .02,
      ),
      child: Container(
        height: 50.0,
        child: TextFormField(
          textAlign: TextAlign.end,
          focusNode: FocusScopeNode(),
          keyboardType: TextInputType.number,
          maxLines: 1,
          controller: phone_Number,
          decoration: InputDecoration(
            enabledBorder: new OutlineInputBorder(
              borderRadius:
              new BorderRadius.circular(25.0),
              borderSide: new BorderSide(
                color: Color(0xff290d66),
              ),
            ),
            filled: true,
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderRadius:
                BorderRadius.circular(25.0),
                borderSide:
                BorderSide(color: Colors.blue)),
            labelText: 'شماره موبایل',
            labelStyle: TextStyle(
                fontFamily: 'iranSance',
                color: Colors.grey,
                fontSize: 14.0),
          ),
        ),
      ),
    );
  }

  Widget _buildSignUpBg(Size size){
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        padding: EdgeInsets.only(top: size.height * .05),
        width: size.width,
        height: size.height * .55,
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
                EdgeInsets.only(top: (size.height * .45) * .25),
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

  BoxDecoration get _pinPutDecoration {
    return BoxDecoration(
      border: Border.all(color: Colors.deepPurpleAccent),
      borderRadius: BorderRadius.circular(15),
    );
  }

  _validationAlert(BuildContext context) async {
    Size size = MediaQuery.of(context).size;

    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              height: size.height * .05,
              child: _buildPinCodeContainer(size),
            ),
            actions: <Widget>[
              new FlatButton(
                child: new Text(
                  'بررسی کد',
                  style: TextStyle(fontFamily: 'iranSance'),
                ),
                onPressed: sendReqCode,
              )
            ],
          );
        });
  }

  void _showSnackBar(String pin, BuildContext context) {
    final snackBar = SnackBar(
      duration: Duration(seconds: 3),
      content: Container(
          height: MediaQuery.of(context).size.height * .03,
          child: Center(
            child: Text(
              '$pin',
              style: TextStyle(fontSize: 18.0),
            ),
          )),
      backgroundColor: Colors.redAccent,
    );
//    Scaffold.of(context).hideCurrentSnackBar();
//    Scaffold.of(context).showSnackBar(snackBar);
  }

  Widget _buildPinCodeContainer(Size size){
    return PinPut(
      fieldsCount: 5,
      onSubmit: (String pin) => _showSnackBar(pin, context),
      focusNode: _pinPutFocusNode,
      controller: pin_code,
      submittedFieldDecoration: _pinPutDecoration.copyWith(
          borderRadius: BorderRadius.circular(20)),
      selectedFieldDecoration: _pinPutDecoration,
      followingFieldDecoration: _pinPutDecoration.copyWith(
        borderRadius: BorderRadius.circular(5),
        border: Border.all(
          color: Colors.deepPurpleAccent.withOpacity(.5),
        ),
      ),
    );
  }

  sendReqCode(){
    showLoadingDialog();
    RequestHelper.makePost('http://admin.rahyabkish.ir/Customers/API/_register2?token=test&'
        'mobile=${phone_Number.text}&code=${code.toString()}').then((value) {
      if (value['result']['codeValid']) {
        PrefHelper.userMobileSet(phone_Number.text);
        hideLoadingDialog();
        NavHelper.pushR(context, ProfilePage());
      } else {
        hideLoadingDialog();
        _showSnackBar('کد اشتباه است', context);
        pin_code.clearComposing();
      }
    });
    pin_code.clearComposing();
  }
}
