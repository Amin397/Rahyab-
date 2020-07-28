import 'package:flutter/material.dart';

class KharidBedoneCard extends StatefulWidget {
  @override
  _KharidBedoneCardState createState() => _KharidBedoneCardState();
}

class _KharidBedoneCardState extends State<KharidBedoneCard> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          color: Colors.blue,
        ),
      ),
    );
  }
}
