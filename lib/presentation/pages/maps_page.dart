import 'dart:async';

import 'package:capston/presentation/pages/request_page.dart';
import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/appbar_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../widgets/text_widget.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  @override
  void initState() {
    super.initState();
    addMarker();
    addMarker1();
    addPolyline();
  }

  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(8.390019, 124.884487),
    zoom: 12,
  );

  final Set<Marker> _marker = <Marker>{};

  addMarker() {
    var sourcePosition = const LatLng(8.390019, 124.884487);
    _marker.add(Marker(
      markerId: const MarkerId('myPosition'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  addMarker1() {
    var sourcePosition = const LatLng(8.483481, 124.661641);
    _marker.add(Marker(
      markerId: const MarkerId('destinationLocation'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  late Polyline _poly;

  addPolyline() {
    _poly = const Polyline(
        color: Colors.red,
        polylineId: PolylineId('lans'),
        points: [
          // User Location
          LatLng(8.390019, 124.884487),
          LatLng(8.483481, 124.661641),
        ],
        width: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppbarWidget('Map'),
      body: Stack(
        children: [
          GoogleMap(
            mapType: MapType.normal,
            markers: _marker,
            polylines: {_poly},
            zoomControlsEnabled: false,
            initialCameraPosition: _kGooglePlex,
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: appBarColor,
                onPressed: () async {
                  // Delete document to Firestore
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const ResquestPage()));
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(80, 15, 80, 15),
                  child: TextRegular(
                      text: 'Done Servicing',
                      color: Colors.white,
                      fontSize: 14),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
