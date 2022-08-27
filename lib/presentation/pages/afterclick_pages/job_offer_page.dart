import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class JobOfferPage extends StatelessWidget {
  const JobOfferPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appBarColor,
        title: const TextBold(
            text: 'Job Offer', color: Colors.white, fontSize: 18),
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
                Image.asset(
                  'assets/images/fblogo.png',
                  height: 100,
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TextBold(
                        text: 'Facebook Inc.',
                        color: Colors.black,
                        fontSize: 24),
                    Row(
                      children: const [
                        Icon(
                          Icons.location_on_rounded,
                          color: appBarColor,
                          size: 18,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 120,
                          child: TextRegular(
                              text: 'Cagayan De Oro, Philippines',
                              color: Colors.grey,
                              fontSize: 14),
                        ),
                      ],
                    ),
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
            const TextRegular(
                text: 'Looking for a', color: Colors.grey, fontSize: 12),
            const Text(
              'Computer Engineer',
              style: TextStyle(
                fontFamily: 'QBold',
                color: Colors.black,
                fontSize: 24,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextRegular(
                text: 'Job Description', color: Colors.grey, fontSize: 15),
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
                text: 'Job Qualification', color: Colors.grey, fontSize: 15),
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
                text: 'Job Requirements', color: Colors.grey, fontSize: 15),
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
                text: 'Where to pass the job requirements',
                color: Colors.grey,
                fontSize: 15),
            const SizedBox(
              height: 10,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: TextRegular(
                  text: '> Email @olanalans12345@gmail.com',
                  color: Colors.grey,
                  fontSize: 12),
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
