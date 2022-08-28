import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/appbar_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class PostService extends StatefulWidget {
  @override
  State<PostService> createState() => _PostServiceState();
}

class _PostServiceState extends State<PostService> {
  late String service;

  late String description;
  late String contactNumber;
  late String address;

  int _value = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppbarWidget('Posting a Service'),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const CircleAvatar(
                backgroundColor: Colors.grey,
                minRadius: 40,
                maxRadius: 40,
                child: Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 32,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              const TextRegular(
                  text: 'Add Your Photo', color: Colors.grey, fontSize: 10),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 30, right: 30, top: 0, bottom: 10),
                child: Container(
                  padding:
                      const EdgeInsets.only(left: 20, bottom: 10, right: 20),
                  decoration: BoxDecoration(
                    color: appBarColor,
                    borderRadius: BorderRadius.circular(5),
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
                                  text: 'Carpenter',
                                  color: Colors.white,
                                  fontSize: 22),
                            ]),
                          )),
                          value: 0,
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
                                text: 'Mason',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
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
                                text: 'Air Conditioning Repair',
                                color: Colors.white,
                                fontSize: 22),
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
                                text: 'Cable TV Installer',
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
                                text: 'CCTV Installer',
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
                                text: 'Web Developer',
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
                                text: 'Content Creator',
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
                                text: 'Auto Mechanic',
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
                                text: 'Manicurist',
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
                                text: 'Photographer',
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
                                text: 'Shoe Maker',
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
                                text: 'Driver',
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
                                text: 'Part Time Teacher',
                                color: Colors.white,
                                fontSize: 22),
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
                                text: 'Tailoring',
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
                                text: 'Housemaid',
                                color: Colors.white,
                                fontSize: 22),
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
                                text: 'Engineer',
                                color: Colors.white,
                                fontSize: 22),
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
                                text: 'Architect',
                                color: Colors.white,
                                fontSize: 22),
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
                                text: 'Baby Sitter',
                                color: Colors.white,
                                fontSize: 22),
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
                                text: 'Nanny Services',
                                color: Colors.white,
                                fontSize: 22),
                          ])),
                          value: 18,
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
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 11,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    contactNumber = _input;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Contact Number',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  maxLines: 3,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    address = _input;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Address',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(30, 10, 30, 10),
                child: TextFormField(
                  maxLines: 7,
                  textCapitalization: TextCapitalization.words,
                  style: const TextStyle(
                      color: Colors.black, fontFamily: 'QRegular'),
                  onChanged: (_input) {
                    description = _input;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 1, color: Colors.black),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    labelText: 'Capabilities',
                    labelStyle: const TextStyle(
                      fontFamily: 'QRegular',
                      color: Colors.black,
                      fontSize: 12.0,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 20, bottom: 30),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 300,
                    width: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 42,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextRegular(
                              text: 'Add Photo of BIR Certificate',
                              color: Colors.white,
                              fontSize: 15),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    left: 20, right: 20, top: 10, bottom: 30),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    height: 300,
                    width: 300,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.add,
                            color: Colors.white,
                            size: 42,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextRegular(
                              text: 'Add Photo of Police Clearance',
                              color: Colors.white,
                              fontSize: 15),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
                color: appBarColor,
                onPressed: () {},
                child: const Padding(
                  padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                  child: TextRegular(
                      text: 'Continue', color: Colors.white, fontSize: 14),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
