import 'package:flutter/material.dart';

class CardManagementScreen extends StatefulWidget {
  @override
  _CardManagementScreenState createState() => _CardManagementScreenState();
}

class _CardManagementScreenState extends State<CardManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text('card management'),
        ),
      ),
    );
  }
}
