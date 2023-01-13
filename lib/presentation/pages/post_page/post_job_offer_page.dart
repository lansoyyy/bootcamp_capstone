import 'dart:io';

import 'package:capston/data/services/cloud_functions/post_job_offer.dart';
import 'package:capston/presentation/pages/home_page.dart';
import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/appbar_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path/path.dart' as path;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class PostJobOffer extends StatefulWidget {
  @override
  State<PostJobOffer> createState() => _PostServiceState();
}

class _PostServiceState extends State<PostJobOffer> {
  late String typeOfJob;
  late String name;
  late String contactNumber;
  late String companyName;

  late String companyAddress;
  late String jobDescription;
  late String jobQualifications;
  late String jobRequirements;
  late String details;

  final int _value = 0;

  bool hasLoaded = false;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  late String fileName = '';
  late File imageFile;

  late String imageURL = '';

  final box = GetStorage();

  @override
  void initState() {
    getData();

    super.initState();
  }

  late String password = '';
  late String username = '';

  getData() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('Users')
        .where('username', isEqualTo: box.read('username'))
        .where('type', isEqualTo: 'user');

    var querySnapshot = await collection.get();
    setState(() {
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = queryDocumentSnapshot.data();

        password = data['password'];
        username = data['username'];
      }
    });
  }

  Future<void> uploadPicture(String inputSource) async {
    final picker = ImagePicker();
    XFile pickedImage;
    try {
      pickedImage = (await picker.pickImage(
          source: inputSource == 'camera'
              ? ImageSource.camera
              : ImageSource.gallery,
          maxWidth: 1920))!;

      fileName = path.basename(pickedImage.path);
      imageFile = File(pickedImage.path);

      try {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const Padding(
            padding: EdgeInsets.only(left: 30, right: 30),
            child: AlertDialog(
                title: Text(
              '         Loading . . .',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Quicksand'),
            )),
          ),
        );

        await firebase_storage.FirebaseStorage.instance
            .ref('Company/$fileName')
            .putFile(imageFile);
        imageURL = await firebase_storage.FirebaseStorage.instance
            .ref('Company/$fileName')
            .getDownloadURL();

        setState(() {
          hasLoaded = true;
        });

        Navigator.of(context).pop();
      } on firebase_storage.FirebaseException catch (error) {
        if (kDebugMode) {
          print(error);
        }
      }
    } catch (err) {
      if (kDebugMode) {
        print(err);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppbarWidget('Posting Job Offer'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              hasLoaded
                  ? CircleAvatar(
                      backgroundColor: Colors.grey,
                      minRadius: 40,
                      maxRadius: 40,
                      backgroundImage: NetworkImage(imageURL),
                    )
                  : GestureDetector(
                      onTap: () {
                        uploadPicture('gallery');
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.grey,
                        minRadius: 40,
                        maxRadius: 40,
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 32,
                        ),
                      ),
                    ),
              const SizedBox(
                height: 5,
              ),
              const TextRegular(
                  text: 'Add Company Logo', color: Colors.grey, fontSize: 10),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    typeOfJob = _input;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Type of Job',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    name = _input;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Name',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    contactNumber = _input;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Contact Number',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    companyName = _input;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Company Name',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  maxLines: 3,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    companyAddress = _input;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Company Address',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  maxLines: 7,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    jobDescription = _input;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Job Description',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  maxLines: 7,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    jobQualifications = _input;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Job Qualifications',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  maxLines: 7,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    jobRequirements = _input;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Job Requirements',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  maxLines: 3,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    details = _input;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText:
                        'Details on where to send the specified requirements',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: appBarColor,
                onPressed: () async {
                  bool hasInternet =
                      await InternetConnectionChecker().hasConnection;
                  if (hasInternet == true) {
                    if (imageURL == '') {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const TextBold(
                                    text: 'Cannot Procceed',
                                    color: Colors.black,
                                    fontSize: 14),
                                content: const TextRegular(
                                    text: 'Upload Company Logo',
                                    color: Colors.black,
                                    fontSize: 12),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () =>
                                        Navigator.of(context).pop(true),
                                    child: const TextBold(
                                        text: 'Close',
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                ],
                              ));
                    } else {
                      showDialog(
                          barrierDismissible: false,
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const TextBold(
                                    text: 'Post Status',
                                    color: Colors.black,
                                    fontSize: 14),
                                content: const TextRegular(
                                    text: 'Posted Succesfully!',
                                    color: Colors.black,
                                    fontSize: 12),
                                actions: <Widget>[
                                  MaterialButton(
                                    onPressed: () async {
                                      postJobOffer(
                                          typeOfJob,
                                          name,
                                          contactNumber,
                                          companyName,
                                          imageURL,
                                          companyAddress,
                                          jobDescription,
                                          jobQualifications,
                                          jobRequirements,
                                          details,
                                          username,
                                          password);
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage()));
                                    },
                                    child: const TextBold(
                                        text: 'Continue',
                                        color: Colors.black,
                                        fontSize: 12),
                                  ),
                                ],
                              ));
                    }
                  } else {
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        builder: (context) => AlertDialog(
                              title: const TextBold(
                                  text: 'Cannot Procceed',
                                  color: Colors.black,
                                  fontSize: 14),
                              content: const TextRegular(
                                  text: 'NO INTERNET CONNECTION',
                                  color: Colors.black,
                                  fontSize: 12),
                              actions: <Widget>[
                                MaterialButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const TextBold(
                                      text: 'Continue',
                                      color: Colors.black,
                                      fontSize: 12),
                                ),
                              ],
                            ));
                  }
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: TextRegular(
                      text: 'Continue', color: Colors.white, fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
