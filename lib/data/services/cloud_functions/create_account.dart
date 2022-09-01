import 'package:cloud_firestore/cloud_firestore.dart';

Future createAccountFirestore(
  String username,
  String profilePicture,
  String name,
) async {
  final docUser = FirebaseFirestore.instance.collection('Users').doc(username);

  final json = {
    'username': username,
    'name': name,
    'profilePicture': profilePicture,
    'type': 'user',
    'timesHired': 0,
  };

  await docUser.set(json);
}
