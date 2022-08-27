import 'package:capston/presentation/pages/afterclick_pages/worker_details_page.dart';
import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:flutter/material.dart';

import '../widgets/text_widget.dart';

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
                      builder: (context) => const WorkerDetailsPage()));
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
                        child: Row(children: const [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      TextBold(
                          text: 'Technician',
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
                          text: 'Plumer', color: Colors.white, fontSize: 22),
                    ])),
                    value: 2,
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
