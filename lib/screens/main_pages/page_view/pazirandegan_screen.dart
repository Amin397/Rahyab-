import 'package:flutter/material.dart';

class Pazirandegan extends StatefulWidget {
  @override
  _PazirandeganState createState() => _PazirandeganState();
}

class _PazirandeganState extends State<Pazirandegan> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: Colors.green,
        ),
      ),
    );
  }
}
