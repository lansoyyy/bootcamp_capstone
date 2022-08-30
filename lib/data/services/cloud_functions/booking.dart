import 'package:cloud_firestore/cloud_firestore.dart';

Future bookAService(
  userUsername,
  userPassword,
  userName,
  contactNumber,
  date,
  time,
  lat,
  long,
  workerUsername,
  workerPassword,
  userProfilePicture,
) async {
  final docUser = FirebaseFirestore.instance.collection('Booking').doc();

  final json = {
    'userUsername': userUsername,
    'userPassword': userPassword,
    'userName': userName,
    'contactNumber': contactNumber,
    'date': date,
    'time': time,
    'lat': lat,
    'long': long,
    'workerUsername': workerUsername,
    'workerPassword': workerPassword,
    'userProfilePicture': userProfilePicture,
  };

  await docUser.set(json);
}
