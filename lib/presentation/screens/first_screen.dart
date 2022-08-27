import 'package:flutter/material.dart';

import '../plugins/search_bar.dart';
import '../widgets/text_widget.dart';

class FirstTab extends StatelessWidget {
  const FirstTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 50),
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: ((context, index) {
              return InkWell(
                splashColor: Colors.grey,
                onTap: () {},
                child: Ink(
                  child: Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      //border: Border.all(color: appBarColor, width: 2),
                    ),
                    height: 120,
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
                            Expanded(
                              child: SizedBox(
                                height: 5,
                              ),
                            ),
                            TextRegular(
                                text: '"Tap for more details"',
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
        searchBarUI(),
      ],
    );
  }
}
