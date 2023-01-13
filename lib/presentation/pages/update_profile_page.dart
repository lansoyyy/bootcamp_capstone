import 'dart:io';

import 'package:capston/presentation/pages/home_page.dart';
import 'package:capston/presentation/widgets/appbar_widget.dart';
import 'package:capston/presentation/widgets/button_widget.dart';
import 'package:capston/presentation/widgets/drawer_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;

import '../widgets/text_widget.dart';

class UpdateProfileDetails extends StatefulWidget {
  const UpdateProfileDetails({Key? key}) : super(key: key);

  @override
  State<UpdateProfileDetails> createState() => _UpdateProfileDetailsState();
}

class _UpdateProfileDetailsState extends State<UpdateProfileDetails> {
  bool hasLoaded = false;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;

  late String fileName = '';

  late File imageFile;

  late String imageURL = '';

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
            .ref('UsersProfile/$fileName')
            .putFile(imageFile);
        imageURL = await firebase_storage.FirebaseStorage.instance
            .ref('UsersProfile/$fileName')
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

  final _fullnameController = TextEditingController();
  final _contactNumberController = TextEditingController();

  @override
  void initState() {
    getData();

    super.initState();
  }

  late String name = '';
  late String profilePicture = '';
  final box = GetStorage();

  late String username = '';
  late String password = '';

  getData() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('Users')
        .where('username', isEqualTo: box.read('username'))
        .where('type', isEqualTo: 'user');

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          username = data['username'];
          password = data['password'];
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppbarWidget('Update Profile'),
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            hasLoaded
                ? CircleAvatar(
                    backgroundColor: Colors.grey,
                    minRadius: 50,
                    maxRadius: 50,
                    backgroundImage: NetworkImage(imageURL),
                  )
                : GestureDetector(
                    onTap: () {
                      uploadPicture('gallery');
                    },
                    child: const CircleAvatar(
                      backgroundColor: Colors.grey,
                      minRadius: 50,
                      maxRadius: 50,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
            const SizedBox(
              height: 10,
            ),
            const TextRegular(
                text: 'Add Photo', color: Colors.grey, fontSize: 12),
            const SizedBox(
              height: 20,
            ),
            Container(
                margin: const EdgeInsets.only(left: 40, right: 40),
                padding: const EdgeInsets.only(top: 20),
                child: TextFormField(
                  textCapitalization: TextCapitalization.words,
                  controller: _fullnameController,
                  decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Color(0xff303952)),
                          borderRadius: BorderRadius.circular(5)),
                      labelText: "Full Name",
                      border: const OutlineInputBorder()),
                )),
            const SizedBox(
              height: 20,
            ),
            ButtonWidget(
              text: 'Update',
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const TextBold(
                              text: 'Confirmation',
                              color: Colors.black,
                              fontSize: 14),
                          content: const TextRegular(
                              text: 'Details Updated Successfully',
                              color: Colors.black,
                              fontSize: 12),
                          actions: <Widget>[
                            MaterialButton(
                              onPressed: () {
                                print(username + '-' + password);
                                FirebaseFirestore.instance
                                    .collection('Users')
                                    .doc(username)
                                    .update({
                                  'profilePicture': imageURL,
                                  'name': _fullnameController.text,
                                });
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => HomePage()));
                              },
                              child: const TextBold(
                                  text: 'Continue',
                                  color: Colors.black,
                                  fontSize: 12),
                            ),
                          ],
                        ));
              },
            ),
          ],
        ),
      ),
    );
  }
}
