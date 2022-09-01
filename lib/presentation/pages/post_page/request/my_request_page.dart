import 'package:capston/data/services/cloud_functions/create_history.dart';
import 'package:capston/presentation/widgets/appbar_widget.dart';
import 'package:capston/presentation/widgets/button_widget.dart';
import 'package:capston/presentation/widgets/drawer_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class MyRequestPage extends StatelessWidget {
  final box = GetStorage();

  var amountPaid = '';

  String currentDate = DateFormat("MMM d, yyyy").format(DateTime.now());

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
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    ExpansionTile(
                      leading: const Icon(Icons.pending),
                      title: TextBold(
                          text: data.docs[index]['request'],
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
                          height: 5,
                        ),
                        TextBold(
                            text: data.docs[index]['rate'],
                            color: Colors.green,
                            fontSize: 18),
                        const SizedBox(
                          height: 20,
                        ),
                        CircleAvatar(
                          minRadius: 40,
                          maxRadius: 40,
                          backgroundImage: NetworkImage(
                              data.docs[index]['workerProfilePicture']),
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
                        currentDate.compareTo(data.docs[index]['date']) > 0 ||
                                currentDate
                                        .compareTo(data.docs[index]['date']) ==
                                    0
                            ? Container()
                            : Padding(
                                padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
                                child: ButtonWidget(
                                  text: 'Done Service',
                                  onPressed: () {
                                    showDialog(
                                        context: context,
                                        barrierDismissible: true,
                                        builder: (context) => AlertDialog(
                                              title: const TextBold(
                                                  text: 'Enter Amount Paid',
                                                  color: Colors.black,
                                                  fontSize: 14),
                                              content: Container(
                                                  margin: const EdgeInsets.only(
                                                      left: 10, right: 10),
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 20),
                                                  child: TextFormField(
                                                    keyboardType:
                                                        TextInputType.number,
                                                    onChanged: (_input) {
                                                      amountPaid = _input;
                                                    },
                                                    decoration: InputDecoration(
                                                        suffixText: 'php',
                                                        enabledBorder: OutlineInputBorder(
                                                            borderSide:
                                                                const BorderSide(
                                                                    color: Colors
                                                                        .black),
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5)),
                                                        labelText:
                                                            "Amount Paid",
                                                        border:
                                                            const OutlineInputBorder()),
                                                  )),
                                              actions: <Widget>[
                                                FlatButton(
                                                  onPressed: () {
                                                    createHistory1(
                                                        data.docs[index]
                                                            ['userUsername'],
                                                        data.docs[index]
                                                            ['userPassword'],
                                                        data.docs[index]
                                                            ['userName'],
                                                        data.docs[index]
                                                            ['contactNumber'],
                                                        data.docs[index]
                                                            ['date'],
                                                        data.docs[index]
                                                            ['service'],
                                                        data.docs[index]
                                                            ['requesterName'],
                                                        amountPaid);
                                                    createHistory2(
                                                        data.docs[index]
                                                            ['workerUsername'],
                                                        data.docs[index]
                                                            ['workerPassword'],
                                                        data.docs[index]
                                                            ['userName'],
                                                        data.docs[index]
                                                            ['contactNumber'],
                                                        data.docs[index]
                                                            ['date'],
                                                        data.docs[index]
                                                            ['service'],
                                                        data.docs[index]
                                                            ['requesterName'],
                                                        amountPaid);
                                                    showDialog(
                                                        barrierDismissible:
                                                            false,
                                                        context: context,
                                                        builder: (context) =>
                                                            AlertDialog(
                                                              title: const TextBold(
                                                                  text:
                                                                      'Status',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14),
                                                              content: const TextRegular(
                                                                  text:
                                                                      'Operation Successful',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12),
                                                              actions: <Widget>[
                                                                FlatButton(
                                                                  onPressed:
                                                                      () async {
                                                                    FirebaseFirestore
                                                                        .instance
                                                                        .collection(
                                                                            'Booking')
                                                                        .doc(data.docs[index]
                                                                            [
                                                                            'id'])
                                                                        .update({
                                                                      'archive':
                                                                          true
                                                                    });
                                                                    Navigator.of(
                                                                            context)
                                                                        .pushReplacement(MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                MyRequestPage()));
                                                                  },
                                                                  child: const TextBold(
                                                                      text:
                                                                          'Continue',
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          12),
                                                                ),
                                                              ],
                                                            ));
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
                              )
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
