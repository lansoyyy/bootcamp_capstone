import 'package:capston/data/providers/joboffer_details_provider.dart';
import 'package:capston/presentation/pages/afterclick_pages/job_offer_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/text_widget.dart';

class SecondTab extends StatelessWidget {
  const SecondTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: StreamBuilder<QuerySnapshot>(
          stream:
              FirebaseFirestore.instance.collection('Job Offer').snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print('error');
              return const Center(child: Text('Error'));
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              print('waiting');
              return const Padding(
                padding: EdgeInsets.only(top: 50),
                child: Center(
                    child: CircularProgressIndicator(
                  color: Colors.black,
                )),
              );
            }
            final data = snapshot.requireData;
            return ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: snapshot.data?.size ?? 0,
              itemBuilder: ((context, index) {
                return InkWell(
                  splashColor: Colors.grey,
                  onTap: () {
                    context.read<JobOfferProvider>().getJobOfferDetails(
                        data.docs[index]['companyLogo'],
                        data.docs[index]['companyName'],
                        data.docs[index]['companyAddress'],
                        data.docs[index]['typeOfJob'],
                        data.docs[index]['jobDescription'],
                        data.docs[index]['jobQualifications'],
                        data.docs[index]['jobRequirements'],
                        data.docs[index]['details'],
                        data.docs[index]['name'],
                        data.docs[index]['contactNumber']);
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
                              CircleAvatar(
                                maxRadius: 50,
                                minRadius: 50,
                                backgroundImage: NetworkImage(
                                    data.docs[index]['companyLogo']),
                              ),
                              TextBold(
                                  text: data.docs[index]['companyName'],
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
                            children: [
                              const SizedBox(
                                height: 30,
                              ),
                              const Text(
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
                                  data.docs[index]['typeOfJob'],
                                  style: const TextStyle(
                                    fontFamily: 'QBold',
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: SizedBox(
                                  height: 5,
                                ),
                              ),
                              TextRegular(
                                  text: data.docs[index]['companyAddress'],
                                  color: Colors.grey,
                                  fontSize: 10),
                              const SizedBox(
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
            );
          }),
    );
  }
}
