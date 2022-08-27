import 'package:capston/presentation/pages/afterclick_pages/job_offer_page.dart';
import 'package:flutter/material.dart';

import '../../widgets/text_widget.dart';

class SecondTab extends StatelessWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: ((context, index) {
          return InkWell(
            splashColor: Colors.grey,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const JobOfferPage()));
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
                        Image.asset('assets/images/fblogo.png', height: 80),
                        const TextBold(
                            text: 'Facebook Inc.',
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
                      children: const [
                        SizedBox(
                          height: 30,
                        ),
                        Text(
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
                            'Computer Engineer',
                            style: TextStyle(
                              fontFamily: 'QBold',
                              fontSize: 18,
                            ),
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
    );
  }
}
