import 'package:capston/data/providers/dataonmap_provider.dart';
import 'package:capston/presentation/pages/post_page/request/maps_page.dart';
import 'package:capston/presentation/widgets/appbar_widget.dart';
import 'package:capston/presentation/widgets/drawer_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

class ResquestPage extends StatefulWidget {
  @override
  State<ResquestPage> createState() => _ResquestPageState();
}

class _ResquestPageState extends State<ResquestPage> {
  final box = GetStorage();

  @override
  void initState() {
    super.initState();

    _determinePosition();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: const DrawerWidget(),
      appBar: AppbarWidget('Customer Request'),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Booking')
              .where('workerUsername', isEqualTo: box.read('username'))
              .where('workerPassword', isEqualTo: box.read('password'))
              .where('workerRemove', isEqualTo: false)
              .where('archive', isEqualTo: false)
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('error');
              return const Center(
                child: TextRegular(
                    text: 'No Request', color: Colors.black, fontSize: 24),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('waiting');
              return const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
              );
            }

            final data = snapshot.requireData;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data?.size ?? 0,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 170,
                    width: double.infinity,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(children: [
                                CircleAvatar(
                                  maxRadius: 40,
                                  minRadius: 40,
                                  backgroundImage: NetworkImage(data.docs[index]
                                          ['userProfilePicture'] ??
                                      'https://cdn-icons-png.flaticon.com/512/149/149071.png'),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                TextRegular(
                                    text: data.docs[index]['requesterName'],
                                    color: Colors.black,
                                    fontSize: 14),
                              ]),
                              const Expanded(
                                child: SizedBox(
                                  width: 30,
                                ),
                              ),
                              IconButton(
                                  onPressed: () async {
                                    Position position =
                                        await Geolocator.getCurrentPosition(
                                            desiredAccuracy:
                                                LocationAccuracy.high);
                                    bool serviceEnabled;
                                    LocationPermission permission;

                                    // Test if location services are enabled.
                                    serviceEnabled = await Geolocator
                                        .isLocationServiceEnabled();
                                    if (!serviceEnabled) {
                                      showDialog(
                                          context: context,
                                          builder: (context) => AlertDialog(
                                                title: const TextBold(
                                                    text: 'Cannot Procceed',
                                                    color: Colors.black,
                                                    fontSize: 14),
                                                content: const TextRegular(
                                                    text:
                                                        'Location is not turned on',
                                                    color: Colors.black,
                                                    fontSize: 12),
                                                actions: <Widget>[
                                                  FlatButton(
                                                    onPressed: () =>
                                                        Navigator.of(context)
                                                            .pop(true),
                                                    child: const TextBold(
                                                        text: 'Close',
                                                        color: Colors.black,
                                                        fontSize: 12),
                                                  ),
                                                ],
                                              ));
                                    } else {
                                      context
                                          .read<MapDataProvider>()
                                          .getMapData(
                                            data.docs[index]['lat'],
                                            data.docs[index]['long'],
                                            data.docs[index].id,
                                            position.latitude,
                                            position.longitude,
                                          );
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  MapSample()));
                                    }
                                  },
                                  icon: Image.asset('assets/images/map.png')),
                              const SizedBox(
                                width: 10,
                              ),
                              data.docs[index]['request'] != 'Accepted'
                                  ? IconButton(
                                      onPressed: () async {
                                        FirebaseFirestore.instance
                                            .collection('Booking')
                                            .doc(data.docs[index].id)
                                            .update({
                                          'request': 'Declined',
                                          'workerRemove': true,
                                          'archive': true,
                                        });
                                      },
                                      icon: const Icon(
                                        Icons.cancel,
                                        color: Colors.red,
                                        size: 38,
                                      ))
                                  : Container(),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        TextBold(
                            text: data.docs[index]['request'],
                            color: Colors.green,
                            fontSize: 14),
                        const SizedBox(
                          height: 5,
                        ),
                        const TextRegular(
                            text: 'Requested on',
                            color: Colors.grey,
                            fontSize: 10),
                        const SizedBox(
                          height: 5,
                        ),
                        TextBold(
                            text:
                                '${data.docs[index]['date']} - ${data.docs[index]['time']}',
                            color: Colors.black,
                            fontSize: 12),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
