import 'package:capston/presentation/pages/maps_page.dart';
import 'package:capston/presentation/widgets/appbar_widget.dart';
import 'package:capston/presentation/widgets/drawer_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ResquestPage extends StatelessWidget {
  const ResquestPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: const DrawerWidget(),
      appBar: AppbarWidget('Request'),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: 5,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              height: 150,
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40, right: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(children: [
                          Image.asset(
                            'assets/images/profile.png',
                            height: 80,
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          const TextRegular(
                              text: 'Lance Olana',
                              color: Colors.black,
                              fontSize: 14),
                        ]),
                        const Expanded(
                          child: SizedBox(
                            width: 30,
                          ),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => MapSample()));
                            },
                            icon: const Icon(
                              Icons.check_box_rounded,
                              color: Colors.green,
                              size: 38,
                            )),
                        const SizedBox(
                          width: 10,
                        ),
                        IconButton(
                            onPressed: () async {
                              String driverContactNumber = '09090104355';
                              final _text = 'tel:$driverContactNumber';
                              if (await canLaunch(_text)) {
                                await launch(_text);
                              }
                            },
                            icon: const Icon(
                              Icons.phone,
                              color: Colors.blue,
                              size: 38,
                            )),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  const TextRegular(
                      text: 'Requested on', color: Colors.grey, fontSize: 10),
                  const SizedBox(
                    height: 5,
                  ),
                  const TextBold(
                      text: 'January 01, 2022 - 8:30am',
                      color: Colors.black,
                      fontSize: 12),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
