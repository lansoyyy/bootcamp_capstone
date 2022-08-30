import 'package:flutter/material.dart';

class PostProvider with ChangeNotifier {
  // Variables

  // Functions to Call (Passing Data)
  // void myUserName(String userName) {
  //   username = userName;
  //   notifyListeners();
  // }

  late String name = '';
  late String contactNumber = '';
  late String profilePicture = '';
  late String username = '';
  late String password = '';
  late String rate = '';
  late String skill = '';
  late String capabilities = '';
  late String bir = '';
  late String police = '';
  late int timesHired = 0;

  String getName() => name;
  String getContactNumber() => contactNumber;
  String getUsername() => username;
  String getProfilePicture() => profilePicture;
  String getPassword() => password;
  String getRate() => rate;
  String getSkill() => skill;
  String getCapabilities() => capabilities;
  String getBir() => bir;
  String getPolice() => police;
  int getTimesHired() => timesHired;

  void myUserName(String userName) {
    skill = userName;
    notifyListeners();
  }

  void getWorkerDetails(
    _name,
    _contactNumber,
    _profilePicture,
    _username,
    _password,
    _rate,
    _skill,
    _capabilities,
    _bir,
    _police,
    _timesHired,
  ) {
    name = _name;
    contactNumber = _contactNumber;
    profilePicture = _profilePicture;
    username = _username;
    password = _password;
    rate = _rate;
    skill = _skill;
    capabilities = _capabilities;
    bir = _bir;
    police = _police;
    timesHired = _timesHired;
    notifyListeners();
  }
}
