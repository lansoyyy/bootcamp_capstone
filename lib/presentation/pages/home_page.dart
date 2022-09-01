import 'dart:async';

import 'package:capston/presentation/pages/components/first_screen.dart';
import 'package:capston/presentation/pages/components/second_tab.dart';
import 'package:capston/presentation/pages/components/third_tab.dart';
import 'package:capston/presentation/pages/post_page/request/my_request_page.dart';
import 'package:capston/presentation/pages/post_page/request/request_page.dart';
import 'package:capston/presentation/screens/onboarding_screen2.dart';

import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/drawer_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get_storage/get_storage.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin;
  late int selectedIndex = 0;
  late Stream<QuerySnapshot> requests;
  late StreamSubscription<QuerySnapshot> notifyWorker;
  late StreamSubscription<QuerySnapshot> notifyResponse;
  final box = GetStorage();

  @override
  void initState() {
    var initializationSettingAndroid =
        const AndroidInitializationSettings('ic_launcher');
    var initializationSettings =
        InitializationSettings(android: initializationSettingAndroid);
    flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectnotification);
    notifyWorker = FirebaseFirestore.instance
        .collection('Booking')
        .where('workerUsername', isEqualTo: box.read('username'))
        .where('workerPassword', isEqualTo: box.read('password'))
        .where('workerRemove', isEqualTo: false)
        .where('markAsRead', isEqualTo: false)
        .snapshots()
        .listen((event) {
      for (var element in event.docChanges) {
        if (element.type == DocumentChangeType.added ||
            element.type == DocumentChangeType.modified) {
          alertUser('You receive a request', 'View in order to see details',
              'Navigate to Request Panel');
        }
      }
    });

    notifyResponse = FirebaseFirestore.instance
        .collection('Booking')
        .where('userUsername', isEqualTo: box.read('username'))
        .where('userPassword', isEqualTo: box.read('password'))
        .where('request', whereIn: ['Accepted', 'Declined'])
        .where('archive', isEqualTo: false)
        .snapshots()
        .listen((event) {
          for (var element in event.docChanges) {
            if (element.type == DocumentChangeType.added ||
                element.type == DocumentChangeType.modified) {
              alertUser(
                  'A worker responded to offer',
                  'View in order to see details',
                  'Navigate to My Request Panel');
            }
          }
        });
    super.initState();
  }

  Future onSelectnotification(payload) async {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (_) => AlertDialog(
              title: const TextBold(
                  text: 'Received Requests', color: Colors.black, fontSize: 16),
              content:
                  TextRegular(text: payload, color: Colors.grey, fontSize: 12),
              actions: <Widget>[
                TextButton(
                    onPressed: () {
                      (payload == 'Navigate to Request Panel')
                          ? Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => ResquestPage()))
                          : Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => MyRequestPage()));
                    },
                    child: const Text('OK'))
              ],
            ));
  }

  Future alertUser(header, subheader, payload) async {
    var androidPlatformChannelSpecifics = const AndroidNotificationDetails(
        "Job Request", "Pending Request",
        channelDescription: "Notify User",
        enableVibration: true,
        playSound: true,
        importance: Importance.max,
        priority: Priority.high);
    NotificationDetails platformChannelSpecifics =
        NotificationDetails(android: androidPlatformChannelSpecifics);
    await flutterLocalNotificationsPlugin.show(
      0,
      header,
      subheader,
      platformChannelSpecifics,
      payload: payload,
    );
  }

  appBarTitle(int myIndex) {
    if (myIndex == 0) {
      return 'Skilled Workers';
    } else if (myIndex == 1) {
      return 'Job Offers';
    } else {
      return 'Post';
    }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        drawer: const DrawerWidget(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: appBarColor,
          title: TextBold(
              text: appBarTitle(selectedIndex),
              color: Colors.white,
              fontSize: 22),
          centerTitle: true,
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: IconButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => OnboardingScreen2()));
                },
                icon: const Icon(Icons.info),
              ),
            )
          ],
        ),
        body: IndexedStack(
          index: selectedIndex,
          children: const [
            FirstTab(),
            SecondTab(),
            ThirdTab(),
          ],
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: FloatingNavbar(
            borderRadius: 10,
            fontSize: 8,
            backgroundColor: appBarColor,
            selectedItemColor: appBarColor,
            onTap: (int val) {
              setState(() {
                selectedIndex = val;
              });
            },
            currentIndex: selectedIndex,
            items: [
              FloatingNavbarItem(
                  icon: Icons.contact_mail_outlined, title: 'Workers'),
              FloatingNavbarItem(
                  icon: Icons.work_outline_rounded, title: 'Job Offers'),
              FloatingNavbarItem(icon: Icons.create, title: 'Post'),
            ],
          ),
        ),
      ),
    );
  }
}
