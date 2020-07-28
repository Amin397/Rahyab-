import 'package:flutter/material.dart';

class PishnehadVizhe extends StatefulWidget {
  @override
  _PishnehadVizheState createState() => _PishnehadVizheState();
}

class _PishnehadVizheState extends State<PishnehadVizhe> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: Colors.yellow,
          child: Center(
            child: Text('پیشنهاد ویژه' , style: TextStyle(
              color: Colors.black , fontSize: 20.0
            ),),
          ),
        ),
      ),
    );
  }
}
