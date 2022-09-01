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
  service,
  rate,
  requesterName,
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
    'request': 'Pending',
    'workerRemove': false,
    'id': docUser.id,
    'service': service,
    'rate': rate,
    'requesterName': requesterName,
  };

  await docUser.set(json);
}
