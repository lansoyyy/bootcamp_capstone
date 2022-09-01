import 'package:capston/presentation/widgets/appbar_widget.dart';
import 'package:capston/presentation/widgets/drawer_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get_storage/get_storage.dart';

class HistoryPage extends StatelessWidget {
  HistoryPage({Key? key}) : super(key: key);

  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: const DrawerWidget(),
      appBar: AppbarWidget('My History'),
      body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance
              .collection('History')
              .where('username', isEqualTo: box.read('username'))
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
                return Padding(
                  padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                  child: Slidable(
                    startActionPane: ActionPane(
                      motion: const ScrollMotion(),
                      children: [
                        SlidableAction(
                          onPressed: (context) {
                            // Yaawa implement ni, okay?
                            FirebaseFirestore.instance
                                .collection('History')
                                .doc(data.docs[index].id)
                                .delete();
                          },
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          icon: Icons.delete,
                          label: 'Delete',
                        )
                      ],
                    ),
                    child: ListTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      leading: const Icon(
                        Icons.check_box,
                        color: Colors.green,
                      ),
                      title: Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextRegular(
                                text: 'Worker: ' + data.docs[index]['userName'],
                                color: Colors.black,
                                fontSize: 14),
                            TextRegular(
                                text: 'Employer: ' +
                                    data.docs[index]['requesterName'],
                                color: Colors.black,
                                fontSize: 14),
                          ],
                        ),
                      ),
                      tileColor: Colors.white,
                      trailing: TextBold(
                          text: data.docs[index]['amountPaid'] + 'php',
                          color: Colors.green,
                          fontSize: 18),
                      subtitle: Row(
                        children: [
                          const Icon(
                            Icons.calendar_today,
                            color: Colors.grey,
                            size: 14,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextRegular(
                              text: data.docs[index]['date'],
                              color: Colors.grey,
                              fontSize: 12),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            );
          }),
    );
  }
}
