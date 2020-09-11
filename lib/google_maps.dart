import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class GoogleMaps extends StatefulWidget {
  @override
  _GoogleMapsState createState() => _GoogleMapsState();
}

class _GoogleMapsState extends State<GoogleMaps> {
  LocationData currentLocation;                                              // 追加
  // StreamSubscription<LocationData> locationSubscription;

  Location _locationService = new Location();                                 // 追加
  String error;                                                               // 追加

  @override                                                                   // 追加
  void initState() {                                                          // 追加
    super.initState();                                                        // 追加

    initPlatformState();                                                      // 追加
    _locationService.onLocationChanged().listen((LocationData result) async { // 追加
      setState(() {                                                           // 追加
        currentLocation = result;                                             // 追加
      });                                                                     // 追加
    });                                                                       // 追加
  }                                                                           // 追加



  Completer<GoogleMapController> _controller = Completer();

  void _onMapCreated(GoogleMapController controller) {
    _controller.complete(controller);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter Maps"),
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            // 最初のカメラ位置
            target: LatLng(34.643208, 134.997586),
            zoom: 17.0,
          ),
        ),
      ),
    );
  }
}
