import 'package:cloud_firestore/cloud_firestore.dart';

Future postService(
  String name,
  String username,
  String password,
  String contactNumber,
  String profilePicture,
  String skill,
  String rate,
  String address,
  String capabilities,
  String bir,
  String police,
  int timesHired,
  datePosted,
) async {
  final docUser = FirebaseFirestore.instance
      .collection('Service')
      .doc(username + '-' + skill);

  final json = {
    'name': name,
    'username': username,
    'password': password,
    'contactNumber': contactNumber,
    'profilePicture': profilePicture,
    'skill': skill,
    'rate': rate,
    'address': address,
    'capabilities': capabilities,
    'bir': bir,
    'police': police,
    'timesHired': timesHired,
    'datePosted': datePosted,
  };

  await docUser.set(json);
}
