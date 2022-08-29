import 'package:cloud_firestore/cloud_firestore.dart';

Future postJobOffer(
    typeOfJob,
    name,
    contactNumber,
    companyName,
    companyLogo,
    companyAddress,
    jobDescription,
    jobQualifications,
    jobRequirements,
    details,
    username,
    password) async {
  final docUser = FirebaseFirestore.instance
      .collection('Job Offer')
      .doc(name + '-' + typeOfJob);

  final json = {
    'typeOfJob': typeOfJob,
    'name': name,
    'contactNumber': contactNumber,
    'companyName': companyName,
    'companyAddress': companyAddress,
    'jobDescription': jobDescription,
    'jobQualifications': jobQualifications,
    'jobRequirements': jobRequirements,
    'details': details,
    'companyLogo': companyLogo,
    'username': username,
    'password': password,
  };

  await docUser.set(json);
}
