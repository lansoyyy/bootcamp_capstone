import 'package:capston/presentation/pages/afterclick_pages/worker_details_page.dart';
import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class FirstTab extends StatefulWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  State<FirstTab> createState() => _FirstTabState();
}

class _FirstTabState extends State<FirstTab> {
  int _value = 1;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 80),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: ((context, index) {
              return InkWell(
                splashColor: Colors.grey,
                onTap: () {
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
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset('assets/images/profile.png',
                                height: 80),
                            const TextBold(
                                text: 'Lance Olana',
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
                          children: const [
                            SizedBox(
                              height: 30,
                            ),
                            Text(
                              'I am a',
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontFamily: 'QReg',
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              'Technician',
                              style: TextStyle(
                                fontFamily: 'QBold',
                                fontSize: 24,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '350/day',
                              style: TextStyle(
                                fontFamily: 'QRegular',
                                fontSize: 14,
                                color: Colors.green,
                              ),
                            ),
                            Expanded(
                              child: SizedBox(
                                height: 5,
                              ),
                            ),
                            TextRegular(
                                text: 'Zone 4, Cagayan De Oro City',
                                color: Colors.grey,
                                fontSize: 10),
                            SizedBox(
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
          ),
        ),
        Padding(
          padding:
              const EdgeInsets.only(left: 30, right: 30, top: 20, bottom: 10),
          child: Container(
            padding: const EdgeInsets.only(left: 20, bottom: 10, right: 20),
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
                          text: 'Mason', color: Colors.white, fontSize: 22),
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
                          text: 'Driver', color: Colors.white, fontSize: 22),
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
                          text: 'Tailoring', color: Colors.white, fontSize: 22),
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
                          text: 'Housemaid', color: Colors.white, fontSize: 22),
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
                          text: 'Engineer', color: Colors.white, fontSize: 22),
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
                          text: 'Architect', color: Colors.white, fontSize: 22),
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
      ],
    );
  }
}
