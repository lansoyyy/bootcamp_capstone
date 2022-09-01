import 'package:cloud_firestore/cloud_firestore.dart';

Future createHistory1(
  username,
  password,
  userName,
  contactNumber,
  date,
  service,
  requesterName,
  amountPaid,
) async {
  final docUser = FirebaseFirestore.instance.collection('History').doc();

  final json = {
    'username': username,
    'password': password,
    'userName': userName,
    'contactNumber': contactNumber,
    'date': date,
    'service': service,
    'requesterName': requesterName,
    'amountPaid': amountPaid,
  };

  await docUser.set(json);
}

Future createHistory2(
  username,
  password,
  userName,
  contactNumber,
  date,
  service,
  requesterName,
  amountPaid,
) async {
  final docUser = FirebaseFirestore.instance.collection('History').doc();

  final json = {
    'username': username,
    'password': password,
    'userName': userName,
    'contactNumber': contactNumber,
    'date': date,
    'service': service,
    'requesterName': requesterName,
    'amountPaid': amountPaid,
  };

  await docUser.set(json);
}
