import 'package:capston/presentation/widgets/appbar_widget.dart';
import 'package:capston/presentation/widgets/drawer_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class MyRequestPage extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppbarWidget('My Request'),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('Booking')
              .where('userUsername', isEqualTo: box.read('username'))
              .where('userPassword', isEqualTo: box.read('password'))
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
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    ExpansionTile(
                      leading: const Icon(Icons.pending),
                      title: TextBold(
                          text: data.docs[index]['request'] +
                              ' ' +
                              data.docs[index]['rate'],
                          color: Colors.black,
                          fontSize: 18),
                      subtitle: TextRegular(
                          text: data.docs[index]['date'],
                          color: Colors.grey,
                          fontSize: 12),
                      children: [
                        TextBold(
                            text: data.docs[index]['service'],
                            color: Colors.black,
                            fontSize: 24),
                        const SizedBox(
                          height: 20,
                        ),
                        CircleAvatar(
                          minRadius: 40,
                          maxRadius: 40,
                          backgroundImage: NetworkImage(
                              data.docs[index]['userProfilePicture']),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        TextRegular(
                            text: data.docs[index]['userName'],
                            color: Colors.black,
                            fontSize: 18),
                        TextRegular(
                            text: data.docs[index]['contactNumber'],
                            color: Colors.grey,
                            fontSize: 14),
                      ],
                    ),
                  ],
                );
              }),
            );
          }),
    );
  }
}
