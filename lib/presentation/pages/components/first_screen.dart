import 'package:capston/data/providers/worker_details_provider.dart';
import 'package:capston/presentation/pages/afterclick_pages/worker_details_page.dart';
import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../../widgets/text_widget.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  final box = GetStorage();
  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: StreamBuilder<QuerySnapshot>(
              stream:
                  FirebaseFirestore.instance.collection('Service').snapshots(),
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
                      splashColor: Colors.grey,
                      onTap: () {
                        context.read<PostProvider>().getWorkerDetails(
                            data.docs[index]['name'],
                            data.docs[index]['contactNumber'],
                            data.docs[index]['profilePicture'],
                            data.docs[index]['username'],
                            data.docs[index]['password'],
                            data.docs[index]['rate'],
                            data.docs[index]['skill'],
                            data.docs[index]['capabilities'],
                            data.docs[index]['bir'],
                            data.docs[index]['police'],
                            data.docs[index]['timesHired']);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WorkerDetailsPage()));
                      },
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
                                  const TextBold(
                                      text: 'Hired: 12 times',
                                      color: Colors.green,
                                      fontSize: 12),
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
                                  TextRegular(
                                      text: data.docs[index]['address'],
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
        ),
        Padding(
          padding: const EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
          child: Container(
            padding: const EdgeInsets.only(left: 30, bottom: 10, right: 30),
            decoration: const BoxDecoration(
              color: appBarColor,
            ),
            child: DropdownButton(
                dropdownColor: appBarColor,
                isExpanded: true,
                iconEnabledColor: Colors.white,
                value: _value,
                items: [
                  DropdownMenuItem(
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: const [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        TextBold(
                            text: 'All', color: Colors.white, fontSize: 22),
                      ]),
                    )),
                    value: 0,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(children: const [
                        Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        TextBold(
                            text: 'Carpenter',
                            color: Colors.white,
                            fontSize: 22),
                      ]),
                    )),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Mason', color: Colors.white, fontSize: 22),
                    ])),
                    value: 2,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Air Conditioning Repair',
                          color: Colors.white,
                          fontSize: 22),
                    ])),
                    value: 3,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Cable TV Installer',
                          color: Colors.white,
                          fontSize: 22),
                    ])),
                    value: 4,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'CCTV Installer',
                          color: Colors.white,
                          fontSize: 22),
                    ])),
                    value: 5,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Web Developer',
                          color: Colors.white,
                          fontSize: 22),
                    ])),
                    value: 6,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Content Creator',
                          color: Colors.white,
                          fontSize: 22),
                    ])),
                    value: 7,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Auto Mechanic',
                          color: Colors.white,
                          fontSize: 22),
                    ])),
                    value: 8,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Manicurist',
                          color: Colors.white,
                          fontSize: 22),
                    ])),
                    value: 9,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Photographer',
                          color: Colors.white,
                          fontSize: 22),
                    ])),
                    value: 10,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Shoe Maker',
                          color: Colors.white,
                          fontSize: 22),
                    ])),
                    value: 11,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Driver', color: Colors.white, fontSize: 22),
                    ])),
                    value: 12,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Part Time Teacher',
                          color: Colors.white,
                          fontSize: 22),
                    ])),
                    value: 13,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Tailoring', color: Colors.white, fontSize: 22),
                    ])),
                    value: 14,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Housemaid', color: Colors.white, fontSize: 22),
                    ])),
                    value: 15,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Engineer', color: Colors.white, fontSize: 22),
                    ])),
                    value: 16,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Architect', color: Colors.white, fontSize: 22),
                    ])),
                    value: 17,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Baby Sitter',
                          color: Colors.white,
                          fontSize: 22),
                    ])),
                    value: 18,
                  ),
                  DropdownMenuItem(
                    child: Center(
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Nanny Services',
                          color: Colors.white,
                          fontSize: 22),
                    ])),
                    value: 19,
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
      ],
    );
  }
}
