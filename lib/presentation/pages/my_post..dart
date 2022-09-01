import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/drawer_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MyPost extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const DrawerWidget(),
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          title: const TextRegular(
              text: 'My Post', color: Colors.white, fontSize: 18),
          backgroundColor: appBarColor,
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Image.asset(
                  'assets/images/sw.png',
                  color: Colors.white,
                  height: 18,
                ),
                text: 'Service',
              ),
              Tab(
                icon: Image.asset(
                  'assets/images/jo.png',
                  color: Colors.white,
                  height: 18,
                ),
                text: 'Job Offer',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Service')
                  .where('username', isEqualTo: box.read('username'))
                  .where('password', isEqualTo: box.read('password'))
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('error');
                  return const Center(child: Text('Error'));
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
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onDoubleTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const TextBold(
                                      text: 'Delete Confirmation',
                                      color: Colors.black,
                                      fontSize: 14),
                                  content: const TextRegular(
                                      text:
                                          'Are you sure you want to delete this post?',
                                      color: Colors.black,
                                      fontSize: 12),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const TextBold(
                                          text: 'No',
                                          color: Colors.black,
                                          fontSize: 12),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('Service')
                                            .doc(data.docs[index]['username'] +
                                                '-' +
                                                data.docs[index]['password'] +
                                                '-' +
                                                data.docs[index]['skill'])
                                            .delete();
                                        Navigator.of(context).pop(true);
                                      },
                                      child: const TextBold(
                                          text: 'Yes',
                                          color: Colors.black,
                                          fontSize: 12),
                                    ),
                                  ],
                                ));
                      },
                      splashColor: Colors.grey,
                      child: Ink(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            //border: Border.all(color: appBarColor, width: 2),
                          ),
                          height: 150,
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    maxRadius: 50,
                                    minRadius: 50,
                                    backgroundImage: NetworkImage(
                                        data.docs[index]['profilePicture']),
                                  ),
                                  TextBold(
                                      text: data.docs[index]['name'],
                                      color: Colors.black,
                                      fontSize: 16),
                                ],
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    'I am a',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'QReg',
                                      fontSize: 12,
                                    ),
                                  ),
                                  Text(
                                    data.docs[index]['skill'],
                                    style: const TextStyle(
                                      fontFamily: 'QBold',
                                      fontSize: 24,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    data.docs[index]['rate'],
                                    style: const TextStyle(
                                      fontFamily: 'QRegular',
                                      fontSize: 14,
                                      color: Colors.green,
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox(
                                      height: 5,
                                    ),
                                  ),
                                  const TextRegular(
                                      text: 'Double Tap to Delete this Post',
                                      color: Colors.grey,
                                      fontSize: 10),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                );
              }),
          StreamBuilder<QuerySnapshot>(
              stream: FirebaseFirestore.instance
                  .collection('Job Offer')
                  .where('username', isEqualTo: box.read('username'))
                  .where('password', isEqualTo: box.read('password'))
                  .snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('error');
                  return const Center(child: Text('Error'));
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
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onDoubleTap: () {
                        showDialog(
                            context: context,
                            builder: (context) => AlertDialog(
                                  title: const TextBold(
                                      text: 'Delete Confirmation',
                                      color: Colors.black,
                                      fontSize: 14),
                                  content: const TextRegular(
                                      text:
                                          'Are you sure you want to delete this post?',
                                      color: Colors.black,
                                      fontSize: 12),
                                  actions: <Widget>[
                                    FlatButton(
                                      onPressed: () =>
                                          Navigator.of(context).pop(true),
                                      child: const TextBold(
                                          text: 'No',
                                          color: Colors.black,
                                          fontSize: 12),
                                    ),
                                    FlatButton(
                                      onPressed: () {
                                        FirebaseFirestore.instance
                                            .collection('Job Offer')
                                            .doc(data.docs[index]['name'] +
                                                '-' +
                                                data.docs[index]['typeOfJob'])
                                            .delete();
                                        Navigator.of(context).pop(true);
                                      },
                                      child: const TextBold(
                                          text: 'Yes',
                                          color: Colors.black,
                                          fontSize: 12),
                                    ),
                                  ],
                                ));
                      },
                      splashColor: Colors.grey,
                      child: Ink(
                        child: Container(
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            //border: Border.all(color: appBarColor, width: 2),
                          ),
                          height: 150,
                          width: 200,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  CircleAvatar(
                                    maxRadius: 50,
                                    minRadius: 50,
                                    backgroundImage: NetworkImage(
                                        data.docs[index]['companyLogo']),
                                  ),
                                  TextBold(
                                      text: data.docs[index]['companyName'],
                                      color: Colors.black,
                                      fontSize: 16),
                                ],
                              ),
                              const SizedBox(
                                width: 40,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  const Text(
                                    'Looking for',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      fontFamily: 'QReg',
                                      fontSize: 12,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 120,
                                    child: Text(
                                      data.docs[index]['typeOfJob'],
                                      style: const TextStyle(
                                        fontFamily: 'QBold',
                                        fontSize: 18,
                                      ),
                                    ),
                                  ),
                                  const Expanded(
                                    child: SizedBox(
                                      height: 5,
                                    ),
                                  ),
                                  const TextRegular(
                                      text: 'Double Tap to Delete this Post',
                                      color: Colors.grey,
                                      fontSize: 10),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                );
              }),
        ]),
      ),
    );
  }
}
