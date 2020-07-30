import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'mainScreen.dart';
import 'sign_in_screen.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var size = MediaQuery.of(context).size;

    return Material(
      child: Container(
        child: Stack(
          overflow: Overflow.clip,
          fit: StackFit.expand,
          children: <Widget>[
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                padding: EdgeInsets.only(top: size.height * .05),
                width: size.width,
                height: size.height * .5,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: Image.asset('assets/images/background.jpg')
                            .image)),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.only(top: (size.width * .35) * .05),
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
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  physics: BouncingScrollPhysics(),
                  child: Container(
                      width: size.width,
                      height: size.height * .55,
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
                            vertical: (size.height * .7) * .05),
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[

                              textField(size, username, false, false, 'شماره موبایل'),
                              textField(size, password, false, true , 'رمز عبور'),

                              Divider(),
                              FlatButton(
                                onPressed: (){

                                },
                                child: Text('بازیابی رمز عبور' , style: TextStyle(
                                    color: Colors.blueAccent,
                                    fontSize: 12.0
                                ),),
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: (size.height * .7) * .1 , left: size.width * .1 , right:  size.width * .1 ),
                                child: RaisedButton(
                                  onPressed: (){
//                                  showLoadingDialog();
//                                  makePostRequest(
//                                      'http://demo.offerlee.ir/Customers/API/login',
//                                      {
//                                        'username': username.text,
//                                        'password': password.text,
//                                        'token': 'test'
//                                      }).then((value) async {
//                                    if(value['result'] == 'success'){
//                                      hideLoadingDialog();
                                    Navigator.pushReplacement(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.upToDown, child: MyHomePage()));
//                                    }else{
//                                      hideLoadingDialog();
//                                      print('amin');
//                                    }
//                                  });
                                  },
                                  splashColor: Colors.white,
                                  color: Color(0xff860d9b). withOpacity(.85),
                                  child: Center(
                                    child: Text('ورود' , style: TextStyle(
                                        fontSize: 16.0,fontFamily: "iranSance",
                                        color: Colors.white , fontWeight: FontWeight.w600
                                    ),),
                                  ),
                                ),
                              ),
                              Divider(),
                              Center(
                                child: FlatButton(
                                  onPressed: (){
                                    Navigator.push(
                                        context,
                                        PageTransition(
                                            type: PageTransitionType.upToDown, child: SignInPage()));
                                  },
                                  child: Text('عضویت در باشگاه' , style: TextStyle(
                                      color: Color(0xff860d9b),
                                      fontWeight: FontWeight.bold
                                  ),),
                                ),
                              )
                            ],
                          ),
                        )
                      )),
                ))
          ],
        ),
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
            fillColor: Colors.white,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: BorderSide(
                    color: Colors.blue
                )
            ),
            labelText: hint,
            labelStyle: TextStyle(
                fontFamily: 'iranSance', color: Colors.grey, fontSize: 14.0), ),
        ),
      ),
    );
  }
}
