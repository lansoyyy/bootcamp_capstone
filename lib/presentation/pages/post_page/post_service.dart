import 'dart:io';

import 'package:capston/data/services/cloud_functions/post_service.dart';
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

class PostService extends StatefulWidget {
  @override
  State<PostService> createState() => _PostServiceState();
}

class _PostServiceState extends State<PostService> {
  final box = GetStorage();

  @override
  void initState() {
    getData();

    super.initState();
  }

  late String name = '';
  late String profilePicture = '';
  late String password = '';
  late String username = '';

  late int timesHired = 0;

  getData() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('Users')
        .where('username', isEqualTo: box.read('username'))
        .where('password', isEqualTo: box.read('password'))
        .where('type', isEqualTo: 'user');

    var querySnapshot = await collection.get();
    setState(() {
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = queryDocumentSnapshot.data();
        name = data['name'];

        profilePicture = data['profilePicture'];

        password = data['password'];
        username = data['username'];
        timesHired = data['timesHired'];
      }
    });
  }

  late String service;

  late String description;
  late String contactNumber;
  late String address;

  int _value = 0;

  late String rate;

  bool hasLoaded = false;
  bool hasLoaded1 = false;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  late String fileName = '';
  late File imageFile;

  late String imageURL = '';
  late String imageURL1 = '';

  Future<void> uploadPictureBIR(String inputSource) async {
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
            .ref('BIR/$fileName')
            .putFile(imageFile);
        imageURL = await firebase_storage.FirebaseStorage.instance
            .ref('BIR/$fileName')
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

  Future<void> uploadPicturePolice(String inputSource) async {
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
            .ref('Police/$fileName')
            .putFile(imageFile);
        imageURL1 = await firebase_storage.FirebaseStorage.instance
            .ref('Police/$fileName')
            .getDownloadURL();

        setState(() {
          hasLoaded1 = true;
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

  getSkill() {
    if (_value == 0) {
      return 'Carpenter';
    } else if (_value == 1) {
      return 'Mason';
    } else if (_value == 2) {
      return 'Air Conditioning Repair';
    } else if (_value == 3) {
      return 'Cable TV Installer';
    } else if (_value == 4) {
      return 'CCTV Installer';
    } else if (_value == 5) {
      return 'Web Developer';
    } else if (_value == 6) {
      return 'Content Creator';
    } else if (_value == 7) {
      return 'Auto Mechanic';
    } else if (_value == 8) {
      return 'Manicurist';
    } else if (_value == 9) {
      return 'Photographer';
    } else if (_value == 10) {
      return 'Shoe Maker';
    } else if (_value == 11) {
      return 'Driver';
    } else if (_value == 12) {
      return 'Part Time Teacher';
    } else if (_value == 13) {
      return 'Tailoring';
    } else if (_value == 14) {
      return 'Housemaid';
    } else if (_value == 15) {
      return 'Engineer';
    } else if (_value == 16) {
      return 'Architect';
    } else if (_value == 17) {
      return 'Baby Sitter';
    } else if (_value == 18) {
      return 'Nanny Services';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppbarWidget('Posting a Service'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const SizedBox(
                height: 20,
              ),
              const TextRegular(
                  text: 'Choose your Expertise',
                  color: Colors.grey,
                  fontSize: 10),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 0, bottom: 10),
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 10, right: 20),
                  decoration: BoxDecoration(
                    color: appBarColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: DropdownButton(
                      dropdownColor: appBarColor,
                      isExpanded: true,
                      iconEnabledColor: Colors.white,
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: const [
                              Icon(
                                Icons.person,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 30,
                              ),
                              TextBold(
                                  text: 'Carpenter',
                                  color: Colors.white,
                                  fontSize: 22),
                            ]),
                          )),
                          value: 0,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Mason',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 1,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Air Conditioning Repair',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 2,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Cable TV Installer',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 3,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'CCTV Installer',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 4,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Web Developer',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 5,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Content Creator',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 6,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Auto Mechanic',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 7,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Manicurist',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 8,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Photographer',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 9,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Shoe Maker',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 10,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Driver',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 11,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Part Time Teacher',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 12,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Tailoring',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 13,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Housemaid',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 14,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Engineer',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 15,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Architect',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 16,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Baby Sitter',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 17,
                        ),
                        DropdownMenuItem(
                          child: Center(
                              child: Row(children: const [
                            Icon(
                              Icons.person,
                              color: Colors.white,
                            ),
                            SizedBox(
                              width: 30,
                            ),
                            TextBold(
                                text: 'Nanny Services',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 18,
                        ),
                      ],
                      onChanged: (value) {
                        setState(() {
                          _value = int.parse(value.toString());
                        });
                      },
                      hint: const Text("Remainders before Redeeming")),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    rate = _input;
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
                    labelText: 'Rate (ex. 350pesos/day)',
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
                  maxLines: 3,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    address = _input;
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
                    labelText: 'Address',
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
                    description = _input;
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
                    labelText: 'Capabilities',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              hasLoaded
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 30),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        height: 300,
                        width: 300,
                        child: Image.network(
                          imageURL,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 20, bottom: 30),
                      child: GestureDetector(
                        onTap: () {
                          uploadPictureBIR('gallery');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 300,
                          width: 300,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 42,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextRegular(
                                    text: 'Add Photo of BIR Certificate',
                                    color: Colors.white,
                                    fontSize: 15),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
              hasLoaded1
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 30),
                      child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 300,
                          width: 300,
                          child: Image.network(
                            imageURL1,
                            fit: BoxFit.cover,
                          )),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 30),
                      child: GestureDetector(
                        onTap: () {
                          uploadPicturePolice('gallery');
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          height: 300,
                          width: 300,
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 42,
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                TextRegular(
                                    text: 'Add Photo of Police Clearance',
                                    color: Colors.white,
                                    fontSize: 15),
                              ],
                            ),
                          ),
                        ),
                      ),
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
                    if (imageURL == '' || imageURL1 == '') {
                      showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                                title: const TextBold(
                                    text: 'Cannot Procceed',
                                    color: Colors.black,
                                    fontSize: 14),
                                content: const TextRegular(
                                    text: 'Upload needed forms',
                                    color: Colors.black,
                                    fontSize: 12),
                                actions: <Widget>[
                                  FlatButton(
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
                                  FlatButton(
                                    onPressed: () async {
                                      postService(
                                          name,
                                          username,
                                          password,
                                          contactNumber,
                                          profilePicture,
                                          getSkill(),
                                          rate,
                                          address,
                                          description,
                                          imageURL,
                                          imageURL1,
                                          timesHired);
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
                                FlatButton(
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
