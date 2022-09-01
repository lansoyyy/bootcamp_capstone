import 'package:capston/presentation/auth/login_page.dart';
import 'package:capston/presentation/pages/history_page.dart';
import 'package:capston/presentation/pages/home_page.dart';
import 'package:capston/presentation/pages/my_post..dart';
import 'package:capston/presentation/pages/post_page/request/my_request_page.dart';
import 'package:capston/presentation/pages/post_page/request/request_page.dart';
import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<DrawerWidget> {
  @override
  void initState() {
    getData();

    super.initState();
  }

  late String name = '';
  late String profilePicture = '';

  getData() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('Users')
        .where('username', isEqualTo: box.read('username'))
        .where('password', isEqualTo: box.read('password'))
        .where('type', isEqualTo: 'user');

    var querySnapshot = await collection.get();
    if (mounted) {
      setState(() {
        for (var queryDocumentSnapshot in querySnapshot.docs) {
          Map<String, dynamic> data = queryDocumentSnapshot.data();
          name = data['name'];

          profilePicture = data['profilePicture'];
        }
      });
    }
  }

  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 220,
      child: Drawer(
        child: ListView(
          padding: const EdgeInsets.only(top: 0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(),
              accountEmail: TextRegular(
                  text: box.read('number') ?? '',
                  color: Colors.black,
                  fontSize: 10),
              accountName:
                  TextBold(text: name, color: Colors.black, fontSize: 15),
              currentAccountPicture: CircleAvatar(
                minRadius: 50,
                maxRadius: 50,
                backgroundImage: NetworkImage(profilePicture == ''
                    ? 'https://cdn-icons-png.flaticon.com/512/149/149071.png'
                    : 'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: appBarColor,
                onPressed: () {
                  // Navigator.of(context).pushReplacement(MaterialPageRoute(
                  //     builder: (context) => const SignupPage()));
                },
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: TextRegular(
                      text: 'Update Profile', color: Colors.white, fontSize: 8),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage()));
              },
              leading: const Icon(Icons.home),
              title: const TextBold(
                  text: 'Home', color: Colors.black, fontSize: 12),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HistoryPage()));
              },
              leading: const Icon(Icons.history),
              title: const TextBold(
                  text: 'History', color: Colors.black, fontSize: 12),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MyPost()));
              },
              leading: const Icon(Icons.person),
              title: const TextBold(
                  text: 'My Post', color: Colors.black, fontSize: 12),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => ResquestPage()));
              },
              leading: const Icon(Icons.list),
              title: const TextBold(
                  text: 'Customer Request', color: Colors.black, fontSize: 12),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            ListTile(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MyRequestPage()));
              },
              leading: const Icon(Icons.my_library_books_outlined),
              title: const TextBold(
                  text: 'My Request', color: Colors.black, fontSize: 12),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            ListTile(
              onTap: () {
                showAboutDialog(
                    context: context,
                    applicationName: 'Hire Me',
                    applicationIcon: Image.asset(
                      'assets/images/logo.png',
                      height: 20,
                    ),
                    applicationLegalese: "For Cagayan De Oro only",
                    applicationVersion: 'v1.0');
              },
              leading: const Icon(Icons.info),
              title: const TextBold(
                  text: 'About', color: Colors.black, fontSize: 12),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: Divider(
                color: Colors.grey,
                thickness: 0.5,
              ),
            ),
            ListTile(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                          title: const TextBold(
                              text: 'Logout Confirmation',
                              color: Colors.black,
                              fontSize: 14),
                          content: const TextRegular(
                              text: 'Are you sure you want to logout?',
                              color: Colors.black,
                              fontSize: 12),
                          actions: <Widget>[
                            FlatButton(
                              onPressed: () => Navigator.of(context).pop(true),
                              child: const TextBold(
                                  text: 'Close',
                                  color: Colors.black,
                                  fontSize: 12),
                            ),
                            FlatButton(
                              onPressed: () async {
                                await FirebaseAuth.instance.signOut();
                                Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage()));
                              },
                              child: const TextBold(
                                  text: 'Continue',
                                  color: Colors.black,
                                  fontSize: 12),
                            ),
                          ],
                        ));
              },
              leading: Icon(
                Icons.logout,
                color: Colors.red[700],
              ),
              title: TextBold(
                  text: 'Logout', color: Colors.red[700]!, fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
