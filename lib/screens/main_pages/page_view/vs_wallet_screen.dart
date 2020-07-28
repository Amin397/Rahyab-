import 'package:flutter/material.dart';

class VsWallet extends StatefulWidget {
  @override
  _VsWalletState createState() => _VsWalletState();
}

class _VsWalletState extends State<VsWallet> {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: Colors.red,
        ),
      ),
    );
  }
}
