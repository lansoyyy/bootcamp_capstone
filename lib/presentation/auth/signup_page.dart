import 'dart:io';

import 'package:capston/data/services/cloud_functions/create_account.dart';
import 'package:capston/presentation/auth/login_page.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:path/path.dart' as path;

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _fullnameController = TextEditingController();
  final _contactNumberController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

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

  final box = GetStorage();

  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        foregroundColor: Colors.black,
        title: const TextBold(
            text: 'Creating Account', color: Colors.black, fontSize: 18),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
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
              Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    maxLength: 11,
                    controller: _contactNumberController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff303952)),
                            borderRadius: BorderRadius.circular(5)),
                        labelText: "Contact Number",
                        border: const OutlineInputBorder()),
                  )),
              const TextRegular(
                  text: 'Pick Your Location',
                  color: Colors.black,
                  fontSize: 12),
              Padding(
                padding: const EdgeInsets.only(
                    left: 40, right: 40, top: 0, bottom: 0),
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 30, bottom: 10, right: 30),
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(5)),
                  child: DropdownButton(
                      isExpanded: true,
                      iconEnabledColor: Colors.black,
                      value: _value,
                      items: [
                        DropdownMenuItem(
                          child: Center(
                              child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(children: const [
                              SizedBox(
                                width: 30,
                              ),
                              TextBold(
                                  text: 'Dagupan City',
                                  color: Colors.black,
                                  fontSize: 16),
                            ]),
                          )),
                          value: 0,
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
              Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff303952)),
                            borderRadius: BorderRadius.circular(5)),
                        labelText: "Username",
                        border: const OutlineInputBorder()),
                  )),
              Container(
                  margin: const EdgeInsets.only(left: 40, right: 40),
                  padding: const EdgeInsets.only(top: 20),
                  child: TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xff303952)),
                            borderRadius: BorderRadius.circular(5)),
                        labelText: "Password",
                        border: const OutlineInputBorder()),
                  )),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 50, right: 50, top: 0, bottom: 0),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(3),
                  ),
                  color: const Color(0xff303952),
                  onPressed: () async {
                    bool hasInternet =
                        await InternetConnectionChecker().hasConnection;
                    if (hasInternet == true) {
                      try {
                        await FirebaseAuth.instance
                            .createUserWithEmailAndPassword(
                                email: _usernameController.text.trim() +
                                    '@hireme.cdo',
                                password: _passwordController.text.trim());

                        showDialog(
                            barrierDismissible: false,
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const TextBold(
                                      text: 'Account Creation',
                                      color: Colors.black,
                                      fontSize: 14),
                                  content: const TextRegular(
                                      text: 'Account Created Succesfully!',
                                      color: Colors.black,
                                      fontSize: 12),
                                  actions: <Widget>[
                                    MaterialButton(
                                      onPressed: () async {
                                        print(_usernameController.text +
                                            '@hireme.cdo');

                                        box.write(
                                            'username',
                                            _usernameController.text +
                                                '@hireme.cdo');

                                        createAccountFirestore(
                                            _usernameController.text +
                                                '@hireme.cdo',
                                            imageURL,
                                            _fullnameController.text);

                                        Navigator.of(context).pushReplacement(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage()));
                                      },
                                      child: const TextBold(
                                          text: 'Continue',
                                          color: Colors.black,
                                          fontSize: 12),
                                    ),
                                  ],
                                ));
                      } catch (e) {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const TextBold(
                                      text: 'Error',
                                      color: Colors.black,
                                      fontSize: 14),
                                  content: TextRegular(
                                      text: "$e",
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
                                      Navigator.of(context).pushReplacement(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const SignupPage()));
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
                    padding: EdgeInsets.only(
                        top: 10, bottom: 10, left: 80, right: 80),
                    child: TextRegular(
                        text: 'Continue', color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
