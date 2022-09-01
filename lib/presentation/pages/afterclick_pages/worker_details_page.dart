import 'package:capston/data/services/cloud_functions/booking.dart';
import 'package:capston/presentation/pages/home_page.dart';
import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/button_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cool_alert/cool_alert.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../data/providers/worker_details_provider.dart';

class WorkerDetailsPage extends StatefulWidget {
  @override
  State<WorkerDetailsPage> createState() => _WorkerDetailsPageState();
}

class _WorkerDetailsPageState extends State<WorkerDetailsPage> {
  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  late int timesHired = 0;
  late String requesterName = '';

  getData() async {
    // Use provider
    var collection = FirebaseFirestore.instance
        .collection('Users')
        .where('username',
            isEqualTo: context.read<PostProvider>().getUsername())
        .where('password',
            isEqualTo: context.read<PostProvider>().getPassword())
        .where('type', isEqualTo: 'user');

    var querySnapshot = await collection.get();
    setState(() {
      for (var queryDocumentSnapshot in querySnapshot.docs) {
        Map<String, dynamic> data = queryDocumentSnapshot.data();
        timesHired = data['timesHired'];
        requesterName = data['name'];
      }
    });
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  late String dateOfService;

  DateTime selectedDate = DateTime.now();

  TimeOfDay selectedTime = TimeOfDay.now();

  DateTime dateTime = DateTime.now();

  bool showDate = false;

  bool showTime = false;

  bool showDateTime = false;

  final box = GetStorage();

  // Select for Date
  Future<DateTime> _selectDate() async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
      print(getDate());
    }
    return selectedDate;
  }

// Select for Time
  Future<TimeOfDay> _selectTime() async {
    final selected = await showTimePicker(
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });

      print(getTime(selectedTime));
    }
    return selectedTime;
  }

  String getDate() {
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getTime(TimeOfDay tod) {
    final now = DateTime.now();

    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    final format = DateFormat.jm();
    return format.format(dt);
  }

  late String contactNumber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const TextBold(
            text: 'Skilled Worker', color: Colors.white, fontSize: 18),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      minRadius: 50,
                      maxRadius: 50,
                      backgroundImage: NetworkImage(
                        context.read<PostProvider>().getProfilePicture(),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextBold(
                        text:
                            'Hired: ${context.read<PostProvider>().getTimesHired()} times',
                        color: Colors.green,
                        fontSize: 14),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    TextBold(
                        text: context.read<PostProvider>().getName(),
                        color: Colors.black,
                        fontSize: 24),
                    TextRegular(
                        text: context.read<PostProvider>().getContactNumber(),
                        color: Colors.black,
                        fontSize: 14),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextRegular(
                        text: 'Rate', color: Colors.grey, fontSize: 10),
                    TextBold(
                        text: context.read<PostProvider>().getRate(),
                        color: Colors.green,
                        fontSize: 16),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              endIndent: 25,
              indent: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              context.read<PostProvider>().getSkill(),
              style: const TextStyle(
                  fontFamily: 'QBold',
                  color: Colors.black,
                  fontSize: 24,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextRegular(
                text: 'Capabilities', color: Colors.grey, fontSize: 15),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextRegular(
                  text: '> ${context.read<PostProvider>().getCapabilities()}',
                  color: Colors.grey,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextRegular(
                text: 'BIR Clearance', color: Colors.grey, fontSize: 15),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                color: Colors.grey,
                height: 350,
                width: 300,
                child: Image.network(
                  context.read<PostProvider>().getBir(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextRegular(
                text: 'Police Clearance', color: Colors.grey, fontSize: 15),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                color: Colors.grey,
                height: 350,
                width: 300,
                child: Image.network(
                  context.read<PostProvider>().getPolice(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: appBarColor,
              onPressed: () async {
                String driverContactNumber =
                    context.read<PostProvider>().getContactNumber();
                final _text = 'tel:$driverContactNumber';
                if (await canLaunch(_text)) {
                  await launch(_text);
                }
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextRegular(
                    text: 'Call Me', color: Colors.white, fontSize: 14),
              ),
            ),
            ButtonWidget(
              text: 'Hire Me',
              onPressed: () async {
                bool serviceEnabled;
                LocationPermission permission;

                // Test if location services are enabled.
                serviceEnabled = await Geolocator.isLocationServiceEnabled();
                if (!serviceEnabled) {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const TextBold(
                                text: 'Cannot Procceed',
                                color: Colors.black,
                                fontSize: 14),
                            content: const TextRegular(
                                text: 'Location is not turned on',
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
                  Position position = await Geolocator.getCurrentPosition(
                      desiredAccuracy: LocationAccuracy.high);

                  CoolAlert.show(
                    barrierDismissible: false,
                    context: context,
                    backgroundColor: appBarColor,
                    type: CoolAlertType.success,
                    confirmBtnColor: appBarColor,
                    confirmBtnTextStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.white,
                    ),
                    title: '',
                    onConfirmBtnTap: () async {
                      // Book
                      bookAService(
                        box.read('username'),
                        box.read('password'),
                        context.read<PostProvider>().getName(),
                        contactNumber,
                        getDate(),
                        getTime(selectedTime),
                        position.latitude,
                        position.longitude,
                        context.read<PostProvider>().getUsername(),
                        context.read<PostProvider>().getPassword(),
                        context.read<PostProvider>().getProfilePicture(),
                        context.read<PostProvider>().getSkill(),
                        context.read<PostProvider>().getRate(),
                        requesterName,
                      );
                      FirebaseFirestore.instance
                          .collection('Users')
                          .doc(context.read<PostProvider>().getUsername() +
                              '-' +
                              context.read<PostProvider>().getPassword())
                          .update({'timesHired': timesHired += 1});
                      FirebaseFirestore.instance
                          .collection('Service')
                          .doc(context.read<PostProvider>().getUsername() +
                              '-' +
                              context.read<PostProvider>().getPassword() +
                              '-' +
                              context.read<PostProvider>().getSkill())
                          .update({'timesHired': timesHired = timesHired + 1});
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => HomePage()));
                    },
                    text: "Service Booked Successfully!",
                  );
                  _selectTime();
                  _selectDate();
                  showDialog(
                      barrierColor: Colors.white,
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => AlertDialog(
                            title: const TextBold(
                                text: 'Enter your Contact Number',
                                color: Colors.black,
                                fontSize: 14),
                            content: Container(
                                margin:
                                    const EdgeInsets.only(left: 10, right: 10),
                                padding: const EdgeInsets.only(top: 20),
                                child: TextFormField(
                                  maxLength: 11,
                                  keyboardType: TextInputType.number,
                                  onChanged: (_input) {
                                    contactNumber = _input;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                              color: Color(0xff303952)),
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      labelText: "Contact Number",
                                      border: const OutlineInputBorder()),
                                )),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () {
                                  Navigator.of(context).pop(true);
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
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
