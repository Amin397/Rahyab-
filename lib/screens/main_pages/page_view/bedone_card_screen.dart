import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rahyab/functions.dart';
import 'package:rahyab/model/qr_code_model/qr_model.dart';
import 'package:url_launcher/url_launcher.dart';

import 'pazirandegan_items_detailes/main_details_screen.dart';

class KharidBedoneCard extends StatefulWidget {
  @override
  _KharidBedoneCardState createState() => _KharidBedoneCardState();
}

class _KharidBedoneCardState extends State<KharidBedoneCard>
    with TickerProviderStateMixin {
  AnimationController anim_controller;

  QrModel qrModel;

  @override
  void dispose() {
    super.dispose();
    anim_controller.dispose();
  }

  @override
  void initState() {
    super.initState();
    anim_controller = AnimationController(vsync: this);
  }

  String qrScanner = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          color: Colors.grey[200],
          padding: EdgeInsets.symmetric(
              horizontal: size.width * .04, vertical: size.height * .01),
          height: size.height,
          width: size.width,
          child: Stack(
            children: <Widget>[
              Align(
                alignment: Alignment.center,
                child: Container(
                  height: 200.0,
                  width: 200.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      InkWell(
                        onTap: () async {
                          String scanning = await BarcodeScanner.scan();
                          setState(() {
                            qrScanner = scanning;
                            makePostReg1(
                                    'http://admin.rahyabkish.ir/Providers/API/_scanQR?token=test&'
                                    'userIdentification=${scanning}')
                                .then((value) async {
                              if (value['ok']) {
                                setState(() {
                                  qrModel = QrModel.fromJson(value);
                                  print('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%');
                                  print(qrModel.result.desc);
                                  print(qrModel.result.fname);
                                  print(qrModel.result.mobile);
                                  print(value);
                                });
                                Navigator.pushReplacement(
                                    context,
                                    PageTransition(
                                        type: PageTransitionType.upToDown,
                                        child: MainDetailScreen(
                                            qrModel.result.senfUnitName.toString(),
                                            'assets/images/coffee_logo.png',
                                            qrModel.result.desc)));
                              }
                            });
//                            _launchURL();
                            print(qrScanner.toString());
                          });
                        },
                        child: Material(
                          elevation: 5.0,
                          child: Container(
                            height: 100.0,
                            width: 100.0,
                            color: Colors.white,
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: size.width,
                                height: size.height * .3,
                                child: Column(
                                  children: <Widget>[
                                    Container(
                                      height: 100.0,
                                      width: 100.0,
                                      child: Lottie.asset(
                                          'assets/anim/qr_code_scann.json',
                                          repeat: true,
                                          controller: anim_controller,
                                          onLoaded: (composition) {
                                        anim_controller
                                          ..duration = composition.duration
                                          ..repeat();
                                      }),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'برای اسکن کد ضربه بزنید !',
                        style:
                            TextStyle(fontSize: 16.0, fontFamily: 'iranSance'),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _launchURL() async {
    String url = qrScanner;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
