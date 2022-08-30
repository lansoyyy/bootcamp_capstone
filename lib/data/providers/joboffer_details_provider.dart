import 'package:flutter/cupertino.dart';

class JobOfferProvider extends ChangeNotifier {
  late String companyLogo = '';
  late String companyName = '';
  late String companyAddress = '';
  late String typeOfJob = '';
  late String jobDescription = '';
  late String jobQualification = '';
  late String jobRequirements = '';
  late String whereToPass = '';
  late String name = '';
  late String contactNumber = '';

  String get getCompanyLogo => companyLogo;
  String get getCompanyName => companyName;
  String get getCompanyAddress => companyAddress;
  String get getTypeOfJob => typeOfJob;
  String get getJobDescription => jobDescription;
  String get getJobQualification => jobQualification;
  String get getJobRequirements => jobRequirements;
  String get getWhereToPass => whereToPass;
  String get getName => name;
  String get getContactNumber => contactNumber;

  void getJobOfferDetails(
      _companyLogo,
      _companyName,
      _companyAddress,
      _typeOfJob,
      _jobDescription,
      _jobQualification,
      _jobRequirements,
      _whereToPass,
      _name,
      _contactNumber) {
    companyLogo = _companyLogo;
    companyName = _companyName;
    companyAddress = _companyAddress;
    typeOfJob = _typeOfJob;
    jobDescription = _jobDescription;
    jobQualification = _jobQualification;
    jobRequirements = _jobRequirements;
    whereToPass = _whereToPass;
    name = _name;
    contactNumber = _contactNumber;
  }
}
