import 'package:capston/data/providers/joboffer_details_provider.dart';
import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                CircleAvatar(
                  minRadius: 50,
                  maxRadius: 50,
                  backgroundImage: NetworkImage(
                    context.read<JobOfferProvider>().getCompanyLogo,
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextBold(
                        text: context.read<JobOfferProvider>().getCompanyName,
                        color: Colors.black,
                        fontSize: 24),
                    Row(
                      children: [
                        const Icon(
                          Icons.location_on_rounded,
                          color: appBarColor,
                          size: 18,
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 120,
                          child: TextRegular(
                              text: context
                                  .read<JobOfferProvider>()
                                  .getCompanyAddress,
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
            Text(
              context.read<JobOfferProvider>().getTypeOfJob,
              style: const TextStyle(
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextRegular(
                  text:
                      '> ${context.read<JobOfferProvider>().getJobDescription}',
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextRegular(
                  text:
                      '> ${context.read<JobOfferProvider>().getJobQualification}',
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
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextRegular(
                  text:
                      '> ${context.read<JobOfferProvider>().getJobRequirements}',
                  color: Colors.grey,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 20,
            ),
            const TextRegular(
                text: 'Where to pass the job requirements?',
                color: Colors.grey,
                fontSize: 15),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextRegular(
                  text: '> ${context.read<JobOfferProvider>().getWhereToPass}',
                  color: Colors.grey,
                  fontSize: 12),
            ),
            const SizedBox(
              height: 30,
            ),
            const TextRegular(
                text: 'Posted by', color: Colors.grey, fontSize: 10),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextBold(
                  text: context.read<JobOfferProvider>().getName,
                  color: Colors.black,
                  fontSize: 15),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: TextRegular(
                  text: context.read<JobOfferProvider>().getContactNumber,
                  color: Colors.black,
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
