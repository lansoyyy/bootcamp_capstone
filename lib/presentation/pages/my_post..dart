import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/drawer_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class MyPost extends StatelessWidget {
  const MyPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        drawer: const DrawerWidget(),
        backgroundColor: Colors.grey[200],
        appBar: AppBar(
          centerTitle: true,
          title: const TextRegular(
              text: 'My Post', color: Colors.white, fontSize: 18),
          backgroundColor: appBarColor,
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Service',
              ),
              Tab(
                text: 'Job Offer',
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: ((context, index) {
              return InkWell(
                onDoubleTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const TextBold(
                                text: 'Delete Confirmation',
                                color: Colors.black,
                                fontSize: 14),
                            content: const TextRegular(
                                text:
                                    'Are you sure you want to delete this post?',
                                color: Colors.black,
                                fontSize: 12),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const TextBold(
                                    text: 'No',
                                    color: Colors.black,
                                    fontSize: 12),
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: const TextBold(
                                    text: 'Yes',
                                    color: Colors.black,
                                    fontSize: 12),
                              ),
                            ],
                          ));
                },
                splashColor: Colors.grey,
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
                                text: 'Double Tap to Delete this Post',
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
          ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: 5,
            itemBuilder: ((context, index) {
              return InkWell(
                onDoubleTap: () {
                  showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                            title: const TextBold(
                                text: 'Delete Confirmation',
                                color: Colors.black,
                                fontSize: 14),
                            content: const TextRegular(
                                text:
                                    'Are you sure you want to delete this post?',
                                color: Colors.black,
                                fontSize: 12),
                            actions: <Widget>[
                              FlatButton(
                                onPressed: () =>
                                    Navigator.of(context).pop(true),
                                child: const TextBold(
                                    text: 'No',
                                    color: Colors.black,
                                    fontSize: 12),
                              ),
                              FlatButton(
                                onPressed: () {},
                                child: const TextBold(
                                    text: 'Yes',
                                    color: Colors.black,
                                    fontSize: 12),
                              ),
                            ],
                          ));
                },
                splashColor: Colors.grey,
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
                                text: 'Double Tap to Delete this Post',
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
        ]),
      ),
    );
  }
}
