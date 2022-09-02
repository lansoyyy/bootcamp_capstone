import 'package:capston/presentation/pages/home_page.dart';
import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingScreen2 extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LiquidSwipe(
          waveType: WaveType.liquidReveal,
          enableLoop: false,
          enableSideReveal: true,
          pages: [
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/1.gif'),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextBold(
                          text: 'Find Skilled Workers',
                          color: Colors.black,
                          fontSize: 26),
                      const TextRegular(
                          text:
                              'Look for Skilled Workers online in a fast and efficient way',
                          color: Colors.grey,
                          fontSize: 16),
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          TextBold(
                              text: 'Swipe', color: Colors.black, fontSize: 14),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.arrow_forward_rounded),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/3.gif'),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextBold(
                          text: 'Find Available Jobs',
                          color: Colors.black,
                          fontSize: 26),
                      const TextRegular(
                          text: "Look Who's Hiring",
                          color: Colors.grey,
                          fontSize: 16),
                      const SizedBox(
                        height: 80,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          TextBold(
                              text: 'Swipe', color: Colors.black, fontSize: 14),
                          SizedBox(
                            width: 20,
                          ),
                          Icon(Icons.arrow_forward_rounded),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/2.gif'),
                      const SizedBox(
                        height: 20,
                      ),
                      const TextBold(
                          text: 'Post for Services \nand Job Vacancies',
                          color: Colors.black,
                          fontSize: 26),
                      const TextRegular(
                          text:
                              'Post and Broadcast Services and Job Availability',
                          color: Colors.grey,
                          fontSize: 16),
                      const SizedBox(
                        height: 80,
                      ),
                      Center(
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                          color: appBarColor,
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          },
                          child: const Padding(
                            padding: EdgeInsets.fromLTRB(40, 10, 40, 10),
                            child: TextRegular(
                                text: 'Continue',
                                color: Colors.white,
                                fontSize: 18),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
