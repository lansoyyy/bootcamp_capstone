import 'package:flutter/material.dart';

class MapDataProvider extends ChangeNotifier {
  late double lat = 0;
  late double long = 0;
  late String id = '';
  late double myLat = 0;
  late double myLong = 0;

  double get getLat => lat;
  double get getLong => long;
  double get getMyLat => myLat;
  double get getMyLong => myLong;

  String get getId => id;

  void getMapData(
    _lat,
    _long,
    _id,
    _myLat,
    _myLong,
  ) {
    lat = _lat;
    long = _long;
    id = _id;
    myLat = _myLat;
    myLong = _myLong;
    notifyListeners();
  }
}
