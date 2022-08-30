import 'dart:async';

import 'package:capston/data/providers/dataonmap_provider.dart';
import 'package:capston/presentation/pages/request_page.dart';
import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/appbar_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

import '../widgets/text_widget.dart';

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

late double lat;
late double long;

class MapSampleState extends State<MapSample> {
  @override
  void initState() {
    super.initState();
    addMarker();
    addMarker1();
    addPolyline();
    _determinePosition();
    getLocation();
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  bool hasLoaded = false;

  final Completer<GoogleMapController> _controller = Completer();

  getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    setState(() {
      lat = position.latitude;
      long = position.longitude;
      hasLoaded = true;
    });
  }

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(lat, long),
    zoom: 18,
  );

  final Set<Marker> _marker = <Marker>{};

  addMarker() {
    var sourcePosition = LatLng(context.read<MapDataProvider>().getMyLat,
        context.read<MapDataProvider>().getMyLong);
    _marker.add(Marker(
      infoWindow: const InfoWindow(
        title: 'Your Location',
      ),
      markerId: const MarkerId('myPosition'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  addMarker1() {
    var sourcePosition = LatLng(context.read<MapDataProvider>().getLat,
        context.read<MapDataProvider>().getLong);
    _marker.add(Marker(
      infoWindow: const InfoWindow(
        title: 'Customer Location',
      ),
      markerId: const MarkerId('destinationLocation'),
      icon: BitmapDescriptor.defaultMarker,
      position: sourcePosition,
    ));
  }

  late Polyline _poly;

  addPolyline() {
    _poly = Polyline(
        color: Colors.red,
        polylineId: const PolylineId('lans'),
        points: [
          // User Location
          LatLng(context.read<MapDataProvider>().getMyLat,
              context.read<MapDataProvider>().getMyLong),
          LatLng(context.read<MapDataProvider>().getLat,
              context.read<MapDataProvider>().getLong),
        ],
        width: 4);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppbarWidget('Map'),
        body: hasLoaded
            ? Stack(
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
                          FirebaseFirestore.instance
                              .collection('Booking')
                              .doc(context.read<MapDataProvider>().getId)
                              .delete();
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => ResquestPage()));
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
              )
            : const Center(
                child: CircularProgressIndicator(
                color: Colors.black,
              )));
  }
}
