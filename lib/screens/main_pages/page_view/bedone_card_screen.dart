import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:rahyab/Helper/NavHelper.dart';
import 'package:rahyab/Helper/RequestHelper.dart';
import 'package:rahyab/model/qr_code_model/qr_model.dart';
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
  void initState() {
    super.initState();
    anim_controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    anim_controller.dispose();
    super.dispose();
  }

  String qrScanner = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: _buildScaffoldBody(size),
      ),
    );
  }

  Widget _buildScaffoldBody(Size size){
    return Container(
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
                  _buildQrScannerCode(size),
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
    );
  }

  Widget _buildQrScannerCode(Size size){
    return InkWell(
      onTap: scanningQr,
      child: Material(
        elevation: 5.0,
        child: Container(
          height: 150.0,
          width: 150.0,
          color: Colors.white,
          child: Align(
            alignment: Alignment.center,
            child: Lottie.asset(
                'assets/anim/qr_code_scann.json',
                repeat: true,
                controller: anim_controller,
                onLoaded: (composition) {
                  anim_controller
                    ..duration = composition.duration
                    ..repeat();
                }),
          ),
        ),
      ),
    );
  }

  scanningQr() async{
    String scanning = await BarcodeScanner.scan();
    setState(() {
      qrScanner = scanning;
      RequestHelper.makePost(
          'http://admin.rahyabkish.ir/Providers/API/_scanQR?token=test&'
              'userIdentification=${scanning}')
          .then((value) async {
        if (value['ok']) {
          setState(() {
            qrModel = QrModel.fromJson(value);
          });
          NavHelper.pushR(context, MainDetailScreen(
              qrModel.result.senfUnitName.toString(),
              'assets/images/coffee_logo.png',
              qrModel.result.desc));
        }
      });
      print(qrScanner.toString());
    });
  }
}
