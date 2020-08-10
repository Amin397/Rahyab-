import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ProviderMap extends StatefulWidget {
  @override
  _ProviderMapState createState() => _ProviderMapState();
}

class _ProviderMapState extends State<ProviderMap> {
  Completer<GoogleMapController> _mapController = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(35.6892, 51.3890),
    zoom: 15.0,
    tilt: 20
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        floatingActionButton: Align(
          alignment: Alignment.bottomLeft,
          child: FloatingActionButton(
            splashColor: Colors.purple,
            onPressed: _goToTheLake,
          ),
        ),
        body: Stack(
          children: <Widget>[
            Container(
              height: size.height,
              width: size.width,
              child: GoogleMap(
                zoomControlsEnabled: false,
                tiltGesturesEnabled: true,
                initialCameraPosition: _kGooglePlex,
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller){
                  _mapController.complete(controller);
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  static final CameraPosition _myPosition = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(35.6892, 51.3890),
      tilt: 59.440717697143555,
      zoom: 14.151926040649414);

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _mapController.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_myPosition));
  }
}
