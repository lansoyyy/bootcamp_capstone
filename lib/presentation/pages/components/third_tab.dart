import 'package:capston/presentation/pages/post_page/post_job_offer_page.dart';
import 'package:capston/presentation/pages/post_page/post_service.dart';
import 'package:capston/presentation/utils/constant/colors.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class ThirdTab extends StatelessWidget {
  const ThirdTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => PostService()));
            },
            splashColor: Colors.grey,
            child: Ink(
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.contact_mail_outlined,
                        size: 54,
                        color: Colors.white,
                      ),
                      TextBold(
                          text: 'Post a Service',
                          color: Colors.white,
                          fontSize: 32),
                    ],
                  ),
                ),
              ),
            ),
          ),
          InkWell(
            splashColor: Colors.grey,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => const PostJobOfferPage()));
            },
            child: Ink(
              child: Container(
                margin: const EdgeInsets.all(20),
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: appBarColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(
                        Icons.work_outline_rounded,
                        size: 54,
                        color: Colors.white,
                      ),
                      TextBold(
                          text: 'Post a Job Offer',
                          color: Colors.white,
                          fontSize: 28),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
