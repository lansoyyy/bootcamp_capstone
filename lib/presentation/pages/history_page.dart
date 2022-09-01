import 'package:capston/presentation/widgets/appbar_widget.dart';
import 'package:capston/presentation/widgets/drawer_widget.dart';
import 'package:capston/presentation/widgets/text_widget.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      drawer: const DrawerWidget(),
      appBar: AppbarWidget('My History'),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: ((context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
            child: ListTile(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5),
              ),
              leading: const Icon(
                Icons.check_box,
                color: Colors.green,
              ),
              title: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    TextRegular(
                        text: 'Worker: Lance Olana',
                        color: Colors.black,
                        fontSize: 14),
                    TextRegular(
                        text: 'Employer: Ian Jeferson',
                        color: Colors.black,
                        fontSize: 14),
                  ],
                ),
              ),
              tileColor: Colors.white,
              trailing: const TextBold(
                  text: '250php', color: Colors.green, fontSize: 18),
              subtitle: Row(
                children: const [
                  Icon(
                    Icons.calendar_today,
                    color: Colors.grey,
                    size: 14,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TextRegular(
                      text: 'January 01, 2022',
                      color: Colors.grey,
                      fontSize: 12),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
