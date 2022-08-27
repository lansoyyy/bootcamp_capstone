import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/button_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class WorkerDetailsPage extends StatelessWidget {
  const WorkerDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const TextBold(
            text: 'Skilled Worker', color: Colors.white, fontSize: 18),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Image.asset(
                      'assets/images/profile.png',
                      height: 100,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const TextBold(
                        text: 'Hired: 12 times',
                        color: Colors.green,
                        fontSize: 14),
                  ],
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    TextBold(
                        text: 'Lance Olana', color: Colors.black, fontSize: 24),
                    TextRegular(
                        text: '09090104355', color: Colors.black, fontSize: 14),
                    SizedBox(
                      height: 10,
                    ),
                    TextRegular(text: 'Rate', color: Colors.grey, fontSize: 10),
                    TextBold(
                        text: '350/day', color: Colors.green, fontSize: 16),
                  ],
                ),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Divider(
              color: Colors.grey,
              thickness: 0.5,
              endIndent: 25,
              indent: 25,
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              'Technician',
              style: TextStyle(
                  fontFamily: 'QBold',
                  color: Colors.black,
                  fontSize: 24,
                  decoration: TextDecoration.underline),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextRegular(
                text: 'Capabilities', color: Colors.grey, fontSize: 15),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextRegular(
                  text:
                      '> Job Description Job Description Job Description Job Description Job Description Job Description Job Description Job Description Job DescriptionJob Description Job Description Job Description Job Descriptionv Job Descriptionv  vJob Description Job Description Job Description Job Description Job Description Job DescriptionJob Description Job DescriptionJob DescriptionJob Description Job Description Job DescriptionJob DescriptionJob DescriptionJob Description Job Description Job Description  Job Description',
                  color: Colors.grey,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextRegular(
                text: 'BIR Certificate', color: Colors.grey, fontSize: 15),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                color: Colors.grey,
                height: 350,
                width: 300,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextRegular(
                text: 'Police Clearance', color: Colors.grey, fontSize: 15),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Container(
                color: Colors.grey,
                height: 350,
                width: 300,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            MaterialButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              color: appBarColor,
              onPressed: () async {
                String driverContactNumber = '09090104355';
                final _text = 'tel:$driverContactNumber';
                if (await canLaunch(_text)) {
                  await launch(_text);
                }
              },
              child: const Padding(
                padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
                child: TextRegular(
                    text: 'Call Me', color: Colors.white, fontSize: 14),
              ),
            ),
            ButtonWidget(
              text: 'Hire Me',
              onPressed: () {},
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
