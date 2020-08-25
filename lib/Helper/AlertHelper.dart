import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lottie/lottie.dart';

class AlertHelper {

  static splashDialog(context , func){
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
                  func();
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
            content: Container(
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
            ),
          ),
        )
    );
  }

  static kharidProviderDialog(context , size , imagePath , cartPriceMask){
    showDialog(
        context: context,
        builder: (_) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            scrollable: true,
            backgroundColor: Colors.transparent,
            elevation: 50.0,
            content: Container(
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
                    width: size.width,
                    height: size.height * .2,
                    child: Center(
                      child: Image(
                        fit: BoxFit.cover,
                        image: Image.asset(imagePath).image,
                      ),
                    ),
                  ),
                  Container(
                    height: size.height * .3,
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: size.height * .05,
                        left: size.height * .01,
                        right: size.width * .05,
                        bottom: size.height * .02,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(
                            height: size.height * .06,
                            child: TextFormField(
                              textAlign: TextAlign.end,
                              focusNode: FocusScopeNode(),
                              inputFormatters: <TextInputFormatter>[
                                cartPriceMask
                              ],
                              keyboardType: TextInputType.number,
                              maxLines: 1,
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
                                labelText: 'مبلغ خرید(ريال)',
                                labelStyle: TextStyle(
                                    fontFamily: 'iranSance',
                                    color: Colors.grey,
                                    fontSize: 14.0),
                              ),
                            ),
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Expanded(
                                flex: 2,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Flexible(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            height: size.height * .07,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(20.0)
                                            ),
                                            child: Center(
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: <Widget>[
                                                  Text(
                                                    'پرداخت از کیف پول',
                                                    style: TextStyle(
                                                      fontSize: 12.0,
                                                      color: Colors.blue,
                                                      fontFamily: 'iranSance',
                                                    ),
                                                  ),
                                                  Lottie.asset('assets/anim/wallet.json',
                                                    fit: BoxFit.cover,
                                                    height: (size.height * .07) * .6,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        )
                                    ),
                                    Flexible(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: (){
                                            Navigator.of(context).pop();
                                          },
                                          child: Container(
                                            height: size.height * .07,
                                            decoration: BoxDecoration(
                                            ),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: <Widget>[
                                                Text(
                                                  'پرداخت آنلاین',
                                                  style: TextStyle(
                                                    fontSize: 12.0,
                                                    color: Colors.blue,
                                                    fontFamily: 'iranSance',
                                                  ),
                                                ),
                                                Lottie.asset('assets/anim/online_payment.json',
                                                  fit: BoxFit.cover,
                                                  height: (size.height * .07) * .6,
                                                )
                                              ],
                                            ),
                                          ),
                                        )
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  static exitAlertDialog(context , func){
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => Directionality(
          textDirection: TextDirection.rtl,
          child: AlertDialog(
            actions: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                      func();
                    },
                    child: Container(
                      height: 50.0,
                      width: MediaQuery.of(context).size.width * .3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.redAccent,
                      ),
                      child: Center(
                        child: Text('خروج' , style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'iranSance'
                        ),),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.0,
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pop(context);
                    },
                    child: Container(

                      height: 50.0,
                      width: MediaQuery.of(context).size.width * .3,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(35.0),
                        color: Colors.greenAccent,
                      ),
                      child: Center(
                        child: Text('بازگشت' , style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'iranSance'
                        ),),
                      ),
                    ),
                  ),
                ],
              )
            ],
            scrollable: true,
            backgroundColor: Colors.transparent,
            elevation: 80.0,
            content: Container(
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
                    height: 60.0,
                    child: Center(
                      child: Icon(Icons.warning , size: 50.0, color: Colors.red[300],),
                    ),
                  ),
                  Text('برای خروج مطمئنید !' , style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 14.0,
                      fontFamily: 'iranSance'
                  ),)
                ],
              ),
            ),
          ),
        )
    );
  }
}