import 'package:flutter/material.dart';

class ProviderMap extends StatefulWidget {
  @override
  _ProviderMapState createState() => _ProviderMapState();
}

class _ProviderMapState extends State<ProviderMap> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          color: Colors.red,
        ),
      ),
    );
  }
}
