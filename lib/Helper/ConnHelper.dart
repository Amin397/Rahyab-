import 'package:flutter/material.dart';

class ConnHelper {


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


}

